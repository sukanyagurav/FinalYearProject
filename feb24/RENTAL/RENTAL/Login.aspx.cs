using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net;
using System.Net.Mail;
namespace RENTAL
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString);
            con.Open();
           
           
                string checkuser = "select count(*) from Users where Email='" + email.Text + "'";
                SqlCommand cmd = new SqlCommand(checkuser, con);
                int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                con.Close();
                if (temp == 1)
                {
                    con.Open();
                    string checkpassword = "select Password from Users where Email='" + email.Text + "'";
                    SqlCommand cmdpass = new SqlCommand(checkpassword, con);
                    string password = cmdpass.ExecuteScalar().ToString().Replace(" ", "");
                   string approve= "select Is_approved from Users where (Is_Approved=1 OR Is_Approved=0) AND Email='" + email.Text+"'";
                    SqlCommand cmdapprove = new SqlCommand(approve, con);
               string verify = cmdapprove.ExecuteScalar().ToString();
                if (password == txtpassword.Text)
                    {
                    //Response.Write(verify);
                       if (verify == "1")
                        {
                        //session created;
                        Session["useremail"] = email.Text;
                        //Response.Redirect("Home.aspx");
                       
                        HttpCookie returnCookie = Request.Cookies["returnUrl"];
                        if ((returnCookie == null) || string.IsNullOrEmpty(returnCookie.Value))
                        {
                            Response.Redirect("Home.aspx");
                        }
                        else
                        {
                            HttpCookie deleteCookie = new HttpCookie("returnUrl");
                            deleteCookie.Expires = DateTime.Now.AddDays(-1);
                            Response.Cookies.Add(deleteCookie);
                            Response.Redirect(returnCookie.Value);
                        }
                    }
                    else
                    {
                        verifyaccount.Visible = true;
                        verifyaccount.Text="Please verify yout account first ";
                    }
                    }
                    else
                    {
                        Label4.Visible = true;
                        Label4.Text = "Password is not correct";
                    }
                }
                else
                {
                    Label3.Visible = true;
                    Label3.Text = "Email is not correct";
                }
            
           
        }



        protected void signup_click(object sender, EventArgs e)
        {

            MailMessage msg;
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
                            cmd.Parameters.AddWithValue("@Mobileno", umobileno.Text.Trim());
                            cmd.Parameters.AddWithValue("@Password", urepassword.Text.Trim());
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
                    ActivationUrl = Server.HtmlEncode("https://localhost:44350/Home.aspx?UserID=" + FetchUserId(emailId) + "&EmailId=" + emailId);

                    msg.Body = "Hi " + uname.Text.Trim() + "!\n" +
                          "Thanks for showing interest and registring in" +
                          " Please <a href='" + ActivationUrl + "'>click here to activate</a>  your account and enjoy our services. \nThanks!";
                    msg.IsBodyHtml = true;
                    smtp.Credentials = new NetworkCredential("sgurav2067@gmail.com", "w@yw@rd@2067");
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



    }
}