using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace RENTAL
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ShowPopup(object sender, EventArgs e)
        {
            //string title = "Greetings";
            //string body = "Welcome to ASPSnippets.com";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

        }

        protected void Login(object sender, EventArgs e)
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
                string approve = "select Is_approved from Users where (Is_Approved=1 OR Is_Approved=0) AND Email='" + email.Text + "'";
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
                      /*  else
                        {
                            HttpCookie deleteCookie = new HttpCookie("returnUrl");
                            deleteCookie.Expires = DateTime.Now.AddDays(-1);
                            Response.Cookies.Add(deleteCookie);
                            Response.Redirect(returnCookie.Value);
                        }*/
                    }
                    else
                    {
                       // verifyaccount.Visible = true;
                       // verifyaccount.Text = "Please verify yout account first ";
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
               // Label3.Visible = true;
                //Label3.Text = "Email is not correct";
            }
        }
    }
}