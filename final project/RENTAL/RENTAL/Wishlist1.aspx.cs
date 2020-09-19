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
    public partial class Wishlist1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                
            }
            else {
                DataTable dt = new DataTable();
                DataRow dr;

                dt.Columns.Add("PName");

                dt.Columns.Add("PImage");
                dt.Columns.Add("RefundableDeposit");
                dr = dt.NewRow();
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

                dr["PName"] = ds.Tables[0].Rows[0]["PName"].ToString();
                dr["PImage"] = ds.Tables[0].Rows[0]["PImage"].ToString();
                dr["RefundableDeposit"] = ds.Tables[0].Rows[0]["RefundableDeposit"].ToString(); //Request.QueryString["month"];
                dt.Rows.Add(dr);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                con.Close();
            }
        }

        
    }
}