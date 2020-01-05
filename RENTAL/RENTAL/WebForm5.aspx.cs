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

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString);
            con.Open();
            string checkuser = "select count(*) from signup1 where Email='" + email.Text + "'";
            SqlCommand cmd = new SqlCommand(checkuser, con);
            int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            con.Close();
            if (temp == 1)
            {
                con.Open();
                string checkpassword = "select Password from signup1 where Email='" + email.Text + "'";
                SqlCommand cmdpass = new SqlCommand(checkpassword, con);
                string password = cmdpass.ExecuteScalar().ToString().Replace(" ", "");
                if (password == txtpassword.Text)
                {
                    Response.Write("Password is correct");
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

        protected void button_Click(object sender, EventArgs e)
        {

        }
    }
}