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
                SqlCommand cmd = new SqlCommand("update Users set password='" + EncodePasswordToBase64(txtpassconfirm.Text.Trim()) + "'where Email='" + useremail + "'", con);
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
        }
    }
}