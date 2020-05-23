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
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
           
                

        }
        private void BindGrid()
        {
            if (Session["useremail"] != null)
            {
                //if gridview is not empty and session is not empty
                String mycon = "Data Source=DESKTOP-R3DR9N1\\SQLEXPRESS; Initial Catalog=FURNITURE; Integrated Security=True";
                String myquery = "select PId,PName,PImage,RefundableDeposit from Products where PId IN(select PId from wishlist where useremail='" + Session["useremail"].ToString() + "')";
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
            else
            {
                //if gridview is empty
                DataTable dt1 = new DataTable();
                GridView1.DataSource = dt1;
                GridView1.DataBind();
            }

        }


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            /*String mycon1 = "Data Source=DESKTOP-R3DR9N1\\SQLEXPRESS; Initial Catalog=FURNITURE; Integrated Security=True";

            SqlConnection con1 = new SqlConnection(mycon1);

            int empid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            con1.Open();
            SqlCommand cm1 = new SqlCommand("delete FROM wishlist where PId='" + empid + "'", con1);
            cm1.ExecuteNonQuery();
            con1.Close();


    */
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete Row")
            {
                int crow;
                crow = Int32.Parse(e.CommandArgument.ToString());
                string rollno = GridView1.Rows[crow].Cells[4].Text;
                deleterowdata(rollno);
            }
        }
        private void deleterowdata(string rollno)
        {
            String mycon = "Data Source=DESKTOP-R3DR9N1\\SQLEXPRESS; Initial Catalog=FURNITURE; Integrated Security=True";
            int crow1;
            crow1 = Int32.Parse(rollno);

            String deletedata = "delete from wishlist where PId='" +crow1+"'";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = deletedata;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();

             GridView1.DataBind();
            this.BindGrid();
        }
    }
}