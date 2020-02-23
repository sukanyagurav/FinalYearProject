using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace RENTAL
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Buttton1_click(object sender, EventArgs e)
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
                    Label4.Visible = true;
                    Label4.Text = ("Password is correct");
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

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
        protected void register(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = "select * from [signup1] where User_name=@User_name";
                cmd1.Parameters.AddWithValue("@User_name", uname.Text);
                cmd1.Connection = con;
                SqlDataReader rd = cmd1.ExecuteReader();
                if (rd.HasRows)
                {
                    Label6.Visible = true;
                    Label6.Text = "User is already available";

                }

                else
                {
                    rd.Close();
                    string command = "INSERT INTO signup1(User_name,Mobile_no,Email,Password) values(@User_name,@Mobile_no,@Email,@Password)";
                    SqlCommand cmd = new SqlCommand(command, con);
                    cmd.Parameters.AddWithValue("@User_name", uname.Text);
                    cmd.Parameters.AddWithValue("@Mobile_no", umobileno.Text);
                    cmd.Parameters.AddWithValue("@Email", uemail.Text);
                    cmd.Parameters.AddWithValue("@Password", upassword.Text);
                    cmd.ExecuteNonQuery();
                    msg.Visible = true;
                }
            }
            catch (Exception E)
            {
                Response.Write(E);

            }
            finally
            {
                con.Close();

            }
        }
    }
}