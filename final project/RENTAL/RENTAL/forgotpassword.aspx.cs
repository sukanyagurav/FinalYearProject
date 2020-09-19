using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Windows.Forms;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
namespace RENTAL
{
    public partial class forgotpassword : System.Web.UI.Page
    {
        public static string  randomCode;
        public static string to;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                con.Open();
                string checkuser = "select Email from Users where Email='" + txtEmail.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(checkuser, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                String str= ds.Tables[0].Rows[0]["Email"].ToString();
                if (txtEmail.Text.Trim() == str.Trim())
                {
                    string from, pass, messagebody;
                    Random rand = new Random();
                    randomCode = (rand.Next(999999)).ToString();//genrating random code
                    MailMessage message = new MailMessage();
                    SmtpClient smtp = new SmtpClient();
                    to = (txtEmail.Text.Trim()).ToString();//user email address
                    from = "rentureteam@gmail.com";//sender email address
                    pass = "RENTURE@22";//sender email address password
                    messagebody = "your reset code is " + randomCode;
                    message.Body = messagebody;
                    message.Subject = "Password resting code";

                    message.From = new MailAddress(from);
                    message.To.Add(to);
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new NetworkCredential(from, pass);
                    smtp.Port = 587;
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;





                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    try
                    {
                        smtp.Send(message);
                        Label3.Visible = true;

                        Label3.Text = ("code send successfully");
                    }
                    catch (Exception ex)
                    {
                        Label3.Visible = true;
                        Label3.Text = (ex.Message);
                    }
                }
                else
                {
                    Label3.Text = "User is not present";
                }
            }
            catch (Exception ex)
            {
                Label3.Visible = true;
                Label3.Text = "Enter the email address";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
             
            if (randomCode==((txtVerifyCode.Text).ToString()))
            {
                to = txtEmail.Text;
                //     resetpassword rs = new resetpassword();
                Response.Redirect("resetpassword.aspx?to=" + to);
            }
            else
            {
                Label4.Visible = true;
                Label4.Text=("Wrong code");
            }
        }
    }
}
