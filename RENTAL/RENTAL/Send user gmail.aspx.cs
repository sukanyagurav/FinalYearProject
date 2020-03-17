using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Configuration;
namespace RENTAL
{
    public partial class Send_user_gmail : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
        static DateTime date;
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();


            DateTime date;

            dt.Columns.Add("ReturnDate");
            dt.Columns.Add("username");
            dt.Columns.Add("PPrice");
            dt.Columns.Add("PName");
            dt.Columns.Add("Quantity");
            dt.Columns.Add("DateOfOrder");
            dt.Columns.Add("firstName");
            SqlConnection con = new SqlConnection(strcon);
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter sda;
            string str = "SELECT o.PId,o.PName,o.PPrice,o.Quantity,o.username,o.DateOfOrder,o.ReturnDate,p.firstName from OrderDetails o,orderaddress p";
            cmd.CommandText = str;
            cmd.Connection = con;
            sda = new SqlDataAdapter();
            sda.SelectCommand = cmd;
            sda.Fill(dt);
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                date = DateTime.Parse(dt.Rows[i]["ReturnDate"].ToString());
                if (((DateTime.Now - date).Days < 15) && ((DateTime.Now - date).Days >= 0))
                {
                    dt = new DataTable();
                    cmd = new SqlCommand("SELECT o.PId,o.PName,o.PPrice,o.Quantity,o.username,o.DateOfOrder,o.ReturnDate,p.firstName from OrderDetails o, orderaddress p where o.orderid = p.orderid and o.ReturnDate = '" + date + "'", con);
                    sda = new SqlDataAdapter();

                    sda.SelectCommand = cmd;
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    Session["due_expiray"] = dt;

                }
            }

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            string ActivationUrl = string.Empty;

            DataTable dt = new DataTable();
            dt = (DataTable)Session["due_expiray"];

           
            string username, useremail, pname, returndate, dateoforder;

            for (int i=0;i<=dt.Rows.Count-1;i++)
            {
               
                    MailMessage  msg1;
                returndate = dt.Rows[i]["ReturnDate"].ToString();
                useremail = dt.Rows[i]["username"].ToString();

                username = dt.Rows[i]["firstName"].ToString();
                    pname = dt.Rows[i]["PName"].ToString();
                    dateoforder= dt.Rows[i]["DateOfOrder"].ToString();

                    msg1 = new MailMessage();
                    SmtpClient smtp2 = new SmtpClient();
                    msg1.Subject = " Your subscription will expire in next 15 days. ";
                    ActivationUrl = Server.HtmlEncode("https://localhost:44350/Extendproduct.aspx?Username=" +username);

                msg1.Body = "Hi "+username+ ", It looks like  your subscription is going to expire in next 15 days.Please write us to email for further assistance. Otherwise by default your subscription will extend by 6 months.For extending click on following link.<a href='" + ActivationUrl + "'>Extend subscription</a>.";
                    string toaddress = useremail.Trim();
                    msg1.To.Add(toaddress);
                    string fromaddress = "Renture <sgurav2067@gmail.com>";
                    msg1.From = new MailAddress(fromaddress);
                    smtp2.UseDefaultCredentials = false;
                    smtp2.Credentials = new NetworkCredential("sgurav2067@gmail.com", "riverd@le$2067");
                    smtp2.Port = 587;
                    smtp2.DeliveryMethod = SmtpDeliveryMethod.Network;

                    smtp2.Host = "smtp.gmail.com";
                    smtp2.EnableSsl = true;
                    smtp2.Send(msg1);

                    

                }




            }
           
        }

        
    }
