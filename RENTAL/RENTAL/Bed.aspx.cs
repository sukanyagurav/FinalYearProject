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
    public partial class Bed : System.Web.UI.Page
    {
         //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FurnitureConnectionString3"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["addtowishlist"] != null && Session["useremail"] != null)
            {
                String query = "insert into wishlist(useremail,PId) values('" + Session["useremail"].ToString() + "'," + Request.QueryString["addtowishlist"].ToString() + ")";
                String mycon = "Data Source=DESKTOP-R3DR9N1\\SQLEXPRESS; Initial Catalog=FURNITURE; Integrated Security=true";
                SqlConnection con1 = new SqlConnection(mycon);
                con1.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con1;
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Product Added in Wishlist');</script>");
            }
            if (Session["useremail"] == null)
            {
                if (Request.QueryString["addtowishlist"] != null)
                {
                    Response.Write("<script>alert('Login to Your Account First. No Product Added in WishList');</script>");
                }

            }

           
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Response.Redirect("bed.aspx?addtowishlist=" + e.CommandArgument.ToString());
          
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (Session["username"] != null)
            {
                Label lb = e.Item.FindControl("Label3") as Label;
                ImageButton btn = e.Item.FindControl("ImageButton1") as ImageButton;
                Label lb1 = e.Item.FindControl("Label4") as Label;
                String mycon = "Data Source=DESKTOP-R3DR9N1\\SQLEXPRESS; Initial Catalog=FURNITURE; Integrated Security=True";
                String myquery = "Select * from wishlist where PId=" + lb1.Text + " and useremail='" + Session["useremail"] + "'";
                SqlConnection con = new SqlConnection(mycon);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = myquery;
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);


                if (ds.Tables[0].Rows.Count > 0)
                {
                    lb.Text = "Already in Wishlist ";

                    btn.ImageUrl = "images/icontrue.png";
                    btn.Enabled = false;
                }
                else
                {
                    lb.Text = "Click Heart to Add in Wishlist";
                    btn.ImageUrl = "images/iconfalse.png";
                }
                con.Close();
            }
            else
            {
                Label lb = e.Item.FindControl("Label3") as Label;
                ImageButton btn = e.Item.FindControl("ImageButton1") as ImageButton;
                lb.Text = "Click Heart to Add in Wishlist";
                btn.ImageUrl = "images/iconfalse.png";

            }
            
        }
        protected void linkclick(object sender, EventArgs e)
        {
            Response.Redirect("wishlist.aspx");
        }
        protected void drop_down_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            //ddlmonth.SelectedValue.ToString();
            DropDownList ddl = (DropDownList)this.Page.FindControl("ddlmonth");
            Label lb = (Label)this.Page.FindControl("Label1");
           // string str=lb.Text;
            //DropDownList ddl = sender as DropDownList;
            //string id = ddl.ID;
            //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + ddl.SelectedItem.Text + "');", true); ;
            //Label lb = sender as Label;
            lb.Text = "100";
        }
        protected void drop_down_DataBinding(object sender, EventArgs e)
        {
            
        }
    }
    
}