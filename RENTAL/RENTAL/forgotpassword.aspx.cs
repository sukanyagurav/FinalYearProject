using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Windows.Forms;

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
            string from, pass, messagebody;
            Random rand = new Random();
            randomCode = (rand.Next(999999)).ToString();//genrating random code
            MailMessage message = new MailMessage();
            to = (txtEmail.Text).ToString();//user email address
            from = "sgurav2067@gmail.com";//sender email address
            pass = "riverd@le$2067";//sender email address password
            messagebody = "your reset code is "+randomCode;
            message.To.Add(to);
            message.From = new MailAddress(from);
            message.Body = messagebody;
            message.Subject = "Password resting code";
            SmtpClient smtp = new SmtpClient("smtp.gmail.com");
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.DeliveryMethod= SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential(from, pass);
            try
            {
                smtp.Send(message);
                Label3.Visible = true;
                Label3.Text=("code send successfully");
            }
            catch(Exception ex)
            {
                Label3.Visible = true;
                Label3.Text=(ex.Message);
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
                Label3.Visible = true;
                Label3.Text=("Wrong code");
            }
        }
    }
}
