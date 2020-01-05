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
    public partial class wishlist : System.Web.UI.Page
    {
        //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FurnitureConnectionString3"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            String mycon = "Data Source=DESKTOP-R3DR9N1\\SQLEXPRESS; Initial Catalog=FURNITURE; Integrated Security=True";
            String myquery = "select * from Products where PId IN(select PId from wishlist where useremail='" + Session["useremail"].ToString() + "')";
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();

        }
    }
}