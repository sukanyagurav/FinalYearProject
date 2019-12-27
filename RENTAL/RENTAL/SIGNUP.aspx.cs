using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
namespace RENTAL
{
    public partial class SIGNUP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
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
                if(rd.HasRows)
                { 
                    Label6.Visible = true;
                    Label6.Text = "User is already available";
                   
                }
               
                else
                {    rd.Close();
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
            catch(Exception E)
            {
                Response.Write(E);
               
            }
            finally{
                con.Close();

            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}