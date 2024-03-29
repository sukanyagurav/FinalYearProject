﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using AjaxControlToolkit;

namespace RENTAL
{
    public partial class Bed1 : System.Web.UI.Page
    {

        DataTable dt1 = new DataTable();
        string constr = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;

        static string city;
        protected void Page_Load(object sender, EventArgs e)
        {
            city = "Mumbai";

            
            if (!IsPostBack)
            {//rating
                DataTable dt1 = this.GetData("SELECT ISNULL(AVG(Rating), 0) AverageRating, COUNT(Rating) RatingCount FROM tblrating");
                Rating1.CurrentRating = Convert.ToInt32(dt1.Rows[0]["AverageRating"]);
                lbresult.Text = string.Format("{0} Users have rated. Average Rating {1}", dt1.Rows[0]["RatingCount"], dt1.Rows[0]["AverageRating"]);
            }

            if (Session["useremail1"] == null)
            {
        
                LinkButton1.Visible = false;
            }
            else
            {
             
                LinkButton1.Visible = true;
                

            }



            //crating session for addtocart
            DataTable dt = new DataTable();
            dt = (DataTable)Session["Buyitems"];
            if (dt != null)
            {

                Label3.Text = dt.Rows.Count.ToString();
            }
            else
            {
                Label3.Text = "0";

            }

        }
        //rating
        private DataTable GetData(string query)
        {
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand(query);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            sda.SelectCommand = cmd;
            sda.Fill(dt1);
            return dt1;
        }
        //rating
        public void btnsubmit_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string info = btn.CommandArgument;
            string info1 = btn.CommandName;
            if (info1 == "ratingproduct" && Session["useremail"]!=null)
            {
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("insert into tblrating values (@ratingvalue,@review)");
                SqlDataAdapter sda = new SqlDataAdapter();
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@ratingvalue", Rating1.CurrentRating.ToString());
                cmd.Parameters.AddWithValue("@review", txtreview.Text);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect(Request.Url.AbsoluteUri);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

            }
            else
            {
                Label1.Text = "Login to your account";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

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
                //quantity
                Session["price"] = str;

                DropDownList1.SelectedValue = "1";
                HttpCookie c1 = new HttpCookie("quantity");
                c1.Value = DropDownList1.SelectedValue.ToString();
                Response.Cookies.Add(c1);
            }


            //passing addtocart command argument
            if (ImageButton2.CommandName == "addtocart")
            {

                ImageButton2.PostBackUrl = ("AddtoCart.aspx?id=" + e.CommandArgument.ToString() + "&price=" + Session["price"]);


            }

            // Label lb = e.Item.FindControl("Label4") as Label;
            
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
            Session["price"] = str;
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
        //checkchanged datalist
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
               
               else if (chkbox=="")
                {
                    DataList1.Visible = true;
                    DataList2.Visible = false;
                }

            }
            

        }

        protected void ddlquantity(object sender, EventArgs e)
        {
            HttpCookie c1 = new HttpCookie("quantity");
            c1.Value = DropDownList1.SelectedValue.ToString();
            Response.Cookies.Add(c1);

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Remove( "useremail1");

            Session.Remove("useremail");
            ///Session.Abandon();
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            //Label lb = e.Item.FindControl("Label6") as Label;
            ImageButton btn = e.Item.FindControl("ImageButton1") as ImageButton;
            Label lb1 = e.Item.FindControl("PIdLabel") as Label;
            
            String mycon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand cmd = new SqlCommand();
            if (DropDownList1.SelectedIndex != 0)
            {
                city = DropDownList1.SelectedValue.ToString();
            }
            string cityNameQuery = "select CityId from City where CityName='" + city + "'";
            cmd.CommandText = cityNameQuery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int cityId = Convert.ToInt32(ds.Tables[0].Rows[0]["CityId"]);



            String myquery = "select * from ProductRef1 where PId='" + lb1.Text + "' and CityId='"+cityId+"'";

            cmd.CommandText = myquery;
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();            
            
            da.Fill(ds);

            
            
            
            int stockdata=0 ;
            int soldout=0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                stockdata=Convert.ToInt32(ds.Tables[0].Rows[0]["PQty"]);
                soldout = Convert.ToInt32(ds.Tables[0].Rows[0]["soldout"]);
            }
            con.Close();

            if (stockdata == soldout)
            {
                //lb.Text = "Out of Stock";
               btn.Visible= true;
               btn.ImageUrl = "images/soldout.jpg";

            }
        }

        
    }

}