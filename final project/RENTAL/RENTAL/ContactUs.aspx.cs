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
    public partial class ContactUs : System.Web.UI.Page
    {

       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnregister_Click(object sender, EventArgs e)
        {
            DateTime currentdate = DateTime.Now;
            String query = "insert into Query_details(DateOfQuery,username,QueryDetails,status,usergmail) values('" +currentdate.ToString() + "','" +txtname.Text + "','" +txtquery.Text + "','Under Processing','"+txtgmail.Text+"')";
            String mycon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;

                SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            txtname.Text = "";
            txtquery.Text = "";
            txtgmail.Text = "";
            Response.Write("Successfull");
        }
    }
}