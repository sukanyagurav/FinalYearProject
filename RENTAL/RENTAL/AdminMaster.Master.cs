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
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Image2.Visible = false;
                Label2.Visible = false;
                // Response.Redirect("Home.aspx");
            }
            else
            {
                Image2.Visible = true;
                Label2.Visible = true;
                string str = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
                SqlConnection con = new SqlConnection(str);
                SqlDataAdapter sda = new SqlDataAdapter("Select * from AdminLogin where AdminName= '" + Session["admin"].ToString() + "'", con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                Label2.Text = dt.Rows[0]["AdminName"].ToString();
                // Image2.ImageUrl = "images/usericon.png";
                Image2.ImageUrl = "images/usericon.png";
                // Label2.Text = dt.Rows[0]["First_Name"].ToString() + " " + dt.Rows[0]["Last_Name"].ToString();
                //Label3.Text = dt.Rows[0]["Email_id"].ToString();

            }

        }
    }
}