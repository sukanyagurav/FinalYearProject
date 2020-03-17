using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;

namespace RENTAL
{
    public partial class AdminQuery : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        // Go button

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            getMemberByID();
        }
        void getMemberByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from Query_details where QueryId='" + TextBox1.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox2.Text = dr.GetValue(2).ToString();
                        TextBox4.Text = dr.GetValue(6).ToString();

                        TextBox3.Text = dr.GetValue(1).ToString();
                        TextBox5.Text = dr.GetValue(3).ToString();



                    }

                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
        bool checkIfMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Query_details where QueryId='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            MailMessage msg1;
            if (checkIfMemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }
                   // Response.Write(TextBox6.Text);
                    SqlCommand cmd = new SqlCommand("UPDATE Query_details SET status='Processed' ,replymsg='"+TextBox6.Text+"' WHERE QueryId='" + TextBox1.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    //registration message
                    msg1 = new MailMessage();
                    SmtpClient smtp1 = new SmtpClient();
                    msg1.Subject = "Hello " + TextBox2.Text + "  Thanks for Register at Renture";
                    msg1.Body = "Hi, Thanks For Your Registration at Renture,'"+TextBox6.Text+"' We will Provide You The Latest Update. Thanks";
                    string toaddress = TextBox4.Text;
                    msg1.To.Add(toaddress);
                    string fromaddress = "Renture <sgurav2067@gmail.com>";
                    msg1.From = new MailAddress(fromaddress);
                    smtp1.Credentials = new NetworkCredential("sgurav2067@gmail.com", "riverd@le$2067");
                    smtp1.Port = 587;
                    smtp1.Host = "smtp.gmail.com";
                    smtp1.EnableSsl = true;
                    smtp1.Send(msg1);
                    Response.Write("<script>alert('Query Status Updated');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }

        }
    }
}