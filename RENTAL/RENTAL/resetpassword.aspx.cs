using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Windows.Forms;

namespace RENTAL
{
    public partial class resetpassword : System.Web.UI.Page
    {
        string useremail = forgotpassword.to;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Restpass_Click(object sender, EventArgs e)
        {
            if ((txtpass.Text) == (txtpassconfirm.Text))
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString);
                SqlCommand cmd = new SqlCommand("update signup1 set password='" + txtpassconfirm.Text + "'where Email='" + useremail + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Label3.Visible = true;
                Label3.Text=("reset successfully");

            }
            else
            {
                Label3.Visible = true;
                Label3.Text=("the new password do not match so enter new password");
            }
            
        }
    }
}