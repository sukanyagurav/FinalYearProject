﻿using System;
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
    public partial class AddtoCart1 : System.Web.UI.Page
    {
        static Boolean orderconfirm;
        //  static int quantityavailable;
        //static Boolean availabledesignid = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["useremail1"] == null)
            {

                LinkButton1.Visible = false;
            }
            else
            {

                LinkButton1.Visible = true;


            }
            if (!IsPostBack)
            {
                ViewState["ReferringURL"] = Request.ServerVariables["HTTP_REFERER"];
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("sno");
                dt.Columns.Add("PId");
                dt.Columns.Add("PName");
                dt.Columns.Add("month");
                dt.Columns.Add("PPrice");
                dt.Columns.Add("totalprice");
                dt.Columns.Add("PImage");
                dt.Columns.Add("quantity1");
                
                if (Request.QueryString["id"] != null)
                {
                    if (Session["Buyitems"] == null)
                    {

                        dr = dt.NewRow();
                        String mycon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
                        SqlConnection scon = new SqlConnection(mycon);
                        String myquery = "select * from Products where PId=" + Request.QueryString["id"];

                        SqlCommand cmd = new SqlCommand(myquery, scon);
                        //cmd.CommandText = myquery;
                        //cmd.Connection = scon;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = 1;

                        dr["PId"] = ds.Tables[0].Rows[0]["PId"].ToString();
                        dr["PName"] = ds.Tables[0].Rows[0]["PName"].ToString();
                        dr["PImage"] = ds.Tables[0].Rows[0]["PImage"].ToString();
                        dr["month"] = Request.Cookies["selection"].Value; //Request.QueryString["month"];
                        dr["PPrice"] = Session["price"].ToString(); //Request.QueryString["price"];
                        dr["quantity1"] = Request.Cookies["quantity"].Value;
                        
                        int price = Convert.ToInt16(Session["price"].ToString());
                        int quantity = Convert.ToInt16(Request.Cookies["selection"].Value);
                        int quantity1 = Convert.ToInt16(Request.Cookies["quantity"].Value);
                        int totalprice = price * quantity1;
                        dr["totalprice"] = totalprice;
                        savecartdetail(1, ds.Tables[0].Rows[0]["PId"].ToString(), ds.Tables[0].Rows[0]["PName"].ToString(), Request.Cookies["selection"].Value.ToString(), Session["price"].ToString(), totalprice.ToString(), ds.Tables[0].Rows[0]["PImage"].ToString(), Request.Cookies["quantity"].Value);
                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();

                        Session["Buyitems"] = dt;
                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        Response.Redirect("AddtoCart.aspx");

                    }

                    else
                    {

                        dt = (DataTable)Session["Buyitems"];
                        int sr;
                        sr = dt.Rows.Count;

                        dr = dt.NewRow();
                        String mycon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
                        SqlConnection scon = new SqlConnection(mycon);
                        String myquery = "select * from Products where PId=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = scon;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = sr + 1;

                        dr["PId"] = ds.Tables[0].Rows[0]["PId"].ToString();
                        dr["PName"] = ds.Tables[0].Rows[0]["PName"].ToString();
                        dr["PImage"] = ds.Tables[0].Rows[0]["PImage"].ToString();
                        dr["month"] = Request.Cookies["selection"].Value; //Request.QueryString["month"];
                        dr["PPrice"] = Session["price"].ToString();//Request.QueryString["price"];
                        dr["quantity1"] = Request.Cookies["quantity"].Value;
                        
                        int quantity1 = Convert.ToInt16(Request.Cookies["quantity"].Value);

                        int price = Convert.ToInt16(Session["price"].ToString());
                        int quantity = Convert.ToInt16(Request.Cookies["selection"].Value);

                        int totalprice = price * quantity1;
                        dr["totalprice"] = totalprice;
                        savecartdetail(1, ds.Tables[0].Rows[0]["PId"].ToString(), ds.Tables[0].Rows[0]["PName"].ToString(), Request.Cookies["selection"].Value.ToString(), Session["price"].ToString(), totalprice.ToString(), ds.Tables[0].Rows[0]["PImage"].ToString(), Request.Cookies["quantity"].Value);

                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();

                        Session["Buyitems"] = dt;
                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        Response.Redirect("AddtoCart.aspx");

                    }
                }
                else
                {
                    dt = (DataTable)Session["Buyitems"];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    if (GridView1.Rows.Count > 0)
                    {
                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();

                    }


                }
                Label2.Text = GridView1.Rows.Count.ToString();

            }


        }

        private void savecartdetail(int sno, String PId, String PName, String month, String PPrice, String totalprice, String PImage, string quantity1)
        {
            if (Session["useremail1"] != null)
            {
                String query = "insert into SavedCartDetail(sno,PId,PName,month,PPrice,totalprice,PImage,quantity1,useremail) values(" + sno + ",'" + PId + "','" + PName + "','" + month + "','" + PPrice + "','" + totalprice + "','" + PImage + "','" + quantity1 + "','" + Session["useremail1"].ToString() + "')";
                String mycon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;

                SqlConnection con = new SqlConnection(mycon);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
            }
            else
            {

            }
        }
        public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["Buyitems"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int gtotal = 0;
            while (i < nrow)
            {
                gtotal = gtotal + Convert.ToInt32(dt.Rows[i]["totalprice"].ToString());

                i = i + 1;
            }
            return gtotal;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["Buyitems"];


            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int sr;
                int sr1;
                string qdata;
                string dtdata;

                sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                qdata = cell.Text;
                dtdata = sr.ToString();
                sr1 = Convert.ToInt32(qdata);
                TableCell pid = GridView1.Rows[e.RowIndex].Cells[1];

                if (sr == sr1)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();
                    //Label1.Text = "Item Has Been Deleted From Shopping Cart";
                    String mycon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
                    SqlConnection con = new SqlConnection(mycon);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("delete top(1)from SavedCartDetail where PId='" + pid.Text + "'and useremail='" + Session["useremail1"] + "'", con);
                    cmd.ExecuteNonQuery();
                    //Item has been deleted from savedcartdetail
                    con.Close();


                    break;

                }
            }

            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["sno"] = i;
                dt.AcceptChanges();
            }

            Session["Buyitems"] = dt;
            Response.Redirect("AddtoCart.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (ViewState["ReferringURL"] != null)
                Response.Redirect(ViewState["ReferringURL"].ToString());
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label4.Text = GridView1.SelectedRow.Cells[0].Text;
            Label3.Text = GridView1.SelectedRow.Cells[2].Text;
            DropDownList1.SelectedValue = GridView1.SelectedRow.Cells[4].Text;
            Label12.Text = GridView1.SelectedRow.Cells[5].Text;
            Label13.Text = GridView1.SelectedRow.Cells[6].Text;
            DropDownList2.SelectedValue = GridView1.SelectedRow.Cells[7].Text;
             ModalPopupExtender1.Show();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSet ds = (DataSet)Session["getdata"];
            string dsprice = ds.Tables[0].Rows[0]["PPrice"].ToString();
            string str = dsprice;
            if (DropDownList1.SelectedValue == "3")
            {
                Label12.Text = (Convert.ToInt32(str) - 200).ToString();
                // Session["selectmonth"] = ddl.SelectedValue.ToString();
                Session["nprice"] = Label12.Text;

            }

            else if (DropDownList1.SelectedValue == "6")
            {
                Label12.Text = "1100";
                // Session["selectmonth"] = ddl.SelectedValue.ToString();
                Session["nprice"] = Label12.Text;

            }
            else if (DropDownList1.SelectedValue == "12")
            {

                Label12.Text = "1000";
                // Session["selectmonth"] = ddl.SelectedValue.ToString();
                Session["nprice"] = Label12.Text;
            }
            else if (DropDownList1.SelectedValue == "18")
            {

                Label12.Text = "1200";
                // Session["selectmonth"] = ddl.SelectedValue.ToString();
                Session["nprice"] = Label12.Text;

            }
            else
            {
                Label12.Text = dsprice;

                //Session["selectmonth"] = ddl.SelectedValue.ToString();
                Session["nprice"] = Label12.Text;


            }

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int q;
            q = Convert.ToInt32(DropDownList2.Text);
            int cost;
            cost = Convert.ToInt32(Label12.Text);
            int totalcost;
            totalcost = cost * q;
            Label13.Text = totalcost.ToString();

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["Buyitems"];


            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int sr;
                int sr1;
                sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());

                sr1 = Convert.ToInt32(Label4.Text);



                if (sr == sr1)
                {
                    dt.Rows[i]["sno"] = Label4.Text;
                    // dt.Rows[i]["productid"] = Label4.Text;
                    dt.Rows[i]["PName"] = Label1.Text;
                    dt.Rows[i]["month"] = DropDownList1.Text;
                    dt.Rows[i]["quantity1"] = DropDownList2.Text;
                    dt.Rows[i]["PPrice"] = Label12.Text;
                    dt.Rows[i]["totalprice"] = Label13.Text;



                       dt.AcceptChanges();

                    break;

                }
            }

            Response.Redirect("AddtoCart.aspx");

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            //checkout button
            DataTable dt1;
            dt1 = (DataTable)Session["Buyitems"];
            int PId;
            int quantity;

            if (Session["useremail"] != null)
            {
                foreach (DataRow row in dt1.Rows)
                {
                    PId = Convert.ToInt16(row["PId"].ToString());
                    quantity = Convert.ToInt16(row["quantity1"].ToString());
                    checkavailability(PId, quantity);
                    if (orderconfirm == false)
                    {
                        break;
                    }


                }
                if (orderconfirm == true)
                {
                    foreach (DataRow row in dt1.Rows)
                    {
                        PId = Convert.ToInt16(row["PId"].ToString());
                        quantity = Convert.ToInt16(row["quantity1"].ToString());
                        //Response.Write(PId);
                        updatestock(PId, quantity);
                    }
                    Response.Redirect("PlaceOrder.aspx");
                }

            }
            else
            {
                checkuser.Text = "Please login to your account!!!!!";
            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {//clear saved cart link button
            Session["buyitems"] = null;
            clearsavedcart();
        }
        private void clearsavedcart()
        {
            //clear the cart
            LinkButton3.Visible = true;

            String mycon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;

            String updatedata = "delete from SavedCartDetail where useremail='" + Session["useremail1"].ToString() + "'";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = updatedata;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            Response.Redirect("HomePage.aspx");
        }

        private void checkavailability(int PId, int numbersold)
        {
            // check the availability
            int pavailable = 0;
            int psold = 0;
            String mycon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            String myquery = "select * from Products where PId='" + PId + "'";
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

                pavailable = Convert.ToInt32(ds.Tables[0].Rows[0]["available"].ToString());

                psold = Convert.ToInt16(ds.Tables[0].Rows[0]["soldout"].ToString());

            }
            con.Close();

            if (pavailable >= numbersold)
            {
                orderconfirm = true;
            }
            else
            {
                orderconfirm = false;
                Label15.Text = " Quantity " + pavailable + " only Available. Order Could Not Be Placed";
            }
        }
        private void updatestock(int PId, int numbersold)
        {
            //update the stock
            int pavailable = 0;
            int psold = 0;
            String mycon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;

            String myquery = "select * from Products where PId='" + PId + "'";
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

                pavailable = Convert.ToInt16(ds.Tables[0].Rows[0]["available"].ToString());
                psold = Convert.ToInt16(ds.Tables[0].Rows[0]["soldout"].ToString());

            }
            con.Close();
            String mycon1 = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            int newavailable;
            int newsold;
            if (pavailable >= numbersold)
            {
                newavailable = pavailable - numbersold;
                newsold = psold + numbersold;
                String updatedata = "update Products set available='" + newavailable + "', soldout='" + newsold + "'where PId='" + PId + "'";
                SqlConnection con1 = new SqlConnection(mycon1);
                con1.Open();
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = updatedata;
                cmd1.Connection = con1;
                cmd1.ExecuteNonQuery();

            }
            else
            {
                Label15.Text = " Quantity " + pavailable + " only Available. Order Could Not Be Placed";

            }


        }

    }
}