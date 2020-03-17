using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace RENTAL
{
    public partial class SIGNUP : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            MailMessage msg,msg1;
           string ActivationUrl = string.Empty;
            string emailId = string.Empty;
            Boolean chk = false;
            int userId = 0;
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("Insert_User"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@Username", uname.Text.Trim());
                            cmd.Parameters.AddWithValue("@Mobileno",umobileno.Text.Trim());
                            cmd.Parameters.AddWithValue("@Password", EncodePasswordToBase64(urepassword.Text.Trim()));
                            cmd.Parameters.AddWithValue("@Email", uemail.Text.Trim());
                            cmd.Connection = con;
                            con.Open();
                            userId = Convert.ToInt32(cmd.ExecuteScalar());
                            con.Close();
                        }
                    }
                    string message = string.Empty;
                    switch (userId)
                    {
                        case -1:
                            message = "Username already exists.\\nPlease choose a different username.";
                            chk = true;
                            break;
                        case -2:
                            message = "Supplied email address has already been used.";
                            chk = true;
                            break;
                        case -3:
                            message = "Supplied Mobile no has already been used.";
                            chk = true;
                            break;
                            /* default:
                                 message = "Registration successful. Activation email has been sent.";
                                 SendActivationEmail(userId);
                                 break;*/
                    }
                    if (chk == true)
                    {
                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);

                    }
                    //registration message
                    msg1 = new MailMessage();
                    SmtpClient smtp1 = new SmtpClient();
                    msg1.Subject = "Hello " + uname.Text + "  Thanks for Register at Renture";
                    msg1.Body = "Hi, Thanks For Your Registration at Renture, We will Provide You The Latest Update. Thanks";
                    string toaddress = uemail.Text;
                    msg1.To.Add(toaddress);
                    string fromaddress = "Renture <sgurav2067@gmail.com>";
                    msg1.From = new MailAddress(fromaddress);
                    smtp1.Credentials = new NetworkCredential("sgurav2067@gmail.com", "w@yw@rd@2067");
                    smtp1.Port = 587;
                    smtp1.Host = "smtp.gmail.com";
                    smtp1.EnableSsl = true;
                    smtp1.Send(msg1);


                    //Sending activation link in the email
                    msg = new MailMessage();
                    SmtpClient smtp = new SmtpClient();
                    emailId = uemail.Text.Trim();
                    //sender email address
                    msg.From = new MailAddress("sgurav2067@gmail.com");
                    //Receiver email address
                    msg.To.Add(emailId);
                    msg.Subject = "Confirmation email for account activation";
                    //For testing replace the local host path with your lost host path and while making online replace with your website domain name
                    ActivationUrl = Server.HtmlEncode("https://localhost:44350/Home.aspx?UserId=" + FetchUserId(emailId) + "&EmailId=" + emailId);

                    msg.Body = "Hi " + uname.Text.Trim() + "!\n" +
                          "Thanks for showing interest and registring in" +
                          " Please <a href='" + ActivationUrl + "'>click here to activate</a>  your account and enjoy our services. \nThanks!";
                    msg.IsBodyHtml = true;
                    smtp.Credentials = new NetworkCredential("sgurav2067@gmail.com", "riverd@le$2067");
                    smtp.Port = 587;
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    smtp.Send(msg);
                    clear_controls();
                    if (chk == false)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Confirmation Link to activate your account has been sent to your email address');", true);
                        //  ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
                    }
                 }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Error occured : " + ex.Message.ToString() + "');", true);
                return;
            }
            finally
            {
                ActivationUrl = string.Empty;
                emailId = string.Empty;
                /*con.Close();
                cmd.Dispose();*/
            }
        }
        //this function Convert to Encord your Password 
        public static string EncodePasswordToBase64(string password)
        {
            try
            {
                byte[] encData_byte = new byte[password.Length];
                encData_byte = System.Text.Encoding.UTF8.GetBytes(password);
                string encodedData = Convert.ToBase64String(encData_byte);
                return encodedData;
            }
            catch (Exception ex)
            {
                throw new Exception("Error in base64Encode" + ex.Message);
            }
        } //this function Convert to Decord your Password

        private string FetchUserId(string emailId)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand();
            cmd = new SqlCommand("SELECT UserId FROM Users WHERE Email=@Email", con);
            cmd.Parameters.AddWithValue("@Email", emailId);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            string UserID = Convert.ToString(cmd.ExecuteScalar());
            con.Close();
            cmd.Dispose();
            return UserID;
        }
        private void clear_controls()
        {
           uname.Text = string.Empty;
           uemail.Text = string.Empty;
           umobileno.Text = string.Empty;
            upassword.Text = string.Empty;
            urepassword.Text = string.Empty;
            //txtName.Focus();
        }

        




        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
            {

            }
        }
    }
