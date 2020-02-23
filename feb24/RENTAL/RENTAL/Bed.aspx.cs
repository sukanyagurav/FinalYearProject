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
          protected void Page_Load(object sender, EventArgs e)
        {
           
            //crating session for addtocart
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            if (dt != null)
            {

                Label3.Text = dt.Rows.Count.ToString();
            }
            else
            {
                Label3.Text = "0";

            }

        }






        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {



            if (e.CommandName == "id")
            {
                string str = price.Text;
                ddl.SelectedValue = "24";
                HttpCookie c = new HttpCookie("selection");
                c.Value = ddl.SelectedValue.ToString();
                Response.Cookies.Add(c);

                Session["price"] = str;

                DropDownList1.SelectedValue = "1";
                HttpCookie c1 = new HttpCookie("quantity");
                c1.Value = DropDownList1.SelectedValue.ToString();
                Response.Cookies.Add(c1);
            }


            //passing addtocart command argument
            if (ImageButton2.CommandName == "addtocart")
            {
                
                ImageButton2.PostBackUrl=("AddtoCart.aspx?id=" + e.CommandArgument.ToString()+"&price="+Session["price"]);
               
                // DropDownList dlist = (DropDownList)(e.Item.FindControl("DropDownList1"));
              //  Response.Redirect("AddtoCart.aspx?id=" + e.CommandArgument.ToString()+"&month="+ddl.SelectedItem.ToString()+"&price="+price.Text);

            }


        }

        protected void ShowPopup(object sender, EventArgs e)
            {
            //code for modal pop up
                Button btn = (Button)sender;
                string info = btn.CommandArgument;
            

            Session["getdata"] = info;
           // Session["getdata"] = e.CommandArgument.ToString();
            String mycon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Products where PId='" + Session["getdata"] + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            namep.Text = ds.Tables[0].Rows[0]["PName"].ToString();
            price.Text = ds.Tables[0].Rows[0]["PPrice"].ToString();
           pimage.ImageUrl = ds.Tables[0].Rows[0]["PImage"].ToString();
            //pimage.ImageUrl = ds.Tables[0].Rows[0]["PImage"].ToString();
           // Label1.Text = Label1.Text;
            Session["getdata"] = ds;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

            }
        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
           
            //dropdown select changed
            DataSet ds = (DataSet)Session["getdata"];//getting session values of dropdownlist
            string dsprice= ds.Tables[0].Rows[0]["PPrice"].ToString();
            string str = price.Text;
            HttpCookie c = new HttpCookie("selection");
            c.Value = ddl.SelectedValue.ToString();
           
            Response.Cookies.Add(c);
           
            if (ddl.SelectedValue == "3")
            {

               
                price.Text = (Convert.ToInt32(str) - 200).ToString();
               // Session["selectmonth"] = ddl.SelectedValue.ToString();
              Session["price"] = price.Text;

            }

            else if (ddl.SelectedValue == "6")
            {
                price.Text = " 1100";
               // Session["selectmonth"] = ddl.SelectedValue.ToString();
                Session["price"] = price.Text;

            }
            else if (ddl.SelectedValue == "12")
            {

                price.Text = " 1000";
               // Session["selectmonth"] = ddl.SelectedValue.ToString();
             Session["price"] = price.Text;
            }
            else if (ddl.SelectedValue == "18")
            {

                price.Text = " 1000";
               // Session["selectmonth"] = ddl.SelectedValue.ToString();
               Session["price"] = price.Text;

            }
            else
            {
                price.Text = dsprice;

                //Session["selectmonth"] = ddl.SelectedValue.ToString();
               Session["price"] = price.Text;


            }
          
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

        }
        protected void checked_changed(object sender, EventArgs e)
        {
            string chkbox = "";
            for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            {
                if (CheckBoxList1.Items[i].Selected)
                {
                    if (chkbox == "")
                    {
                        chkbox = "'" + CheckBoxList1.Items[i].Text + "'";

                    }
                    else
                    {
                        chkbox += "," + "'" + CheckBoxList1.Items[i].Text + "'";
                    }
                    Label2.Visible = true;
                    Label2.Text = chkbox;

                    String mycon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
                    SqlConnection con = new SqlConnection(mycon);
                    string query = "select * from Products where PCategory in(" + Label2.Text + ")";
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);

                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    DataList1.Visible = false;
                    DataList2.Visible = true;
                    DataList2.DataSource = dt;
                    DataList2.DataBind();
                    //  DataList1.DataSource = dt;
                    //DataList1.DataBind();

                    con.Close();

                }
                else
                {
                    DataList1.Visible = false;
                }
               

            }
            

        }

        protected void ddlquantity(object sender, EventArgs e)
        {
            HttpCookie c1 = new HttpCookie("quantity");
            c1.Value = DropDownList1.SelectedValue.ToString();
            Response.Cookies.Add(c1);

        }
    }

}