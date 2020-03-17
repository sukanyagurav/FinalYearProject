using System;
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
    public partial class Bed : System.Web.UI.Page
    {

        DataTable dt1 = new DataTable();
        string constr = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
        //static String rating;
        static string city;
        protected void Page_Load(object sender, EventArgs e)
        {

            city = "Mumbai";
            if (!IsPostBack)
            {

            }
            else
            {
                bool checkBoxEnabled = false;
                for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                {
                    if (CheckBoxList1.Items[i].Selected)
                    {
                        checkBoxEnabled = true;
                        break;
                    }
                }
                if (checkBoxEnabled)
                {
                    checked_changed(sender, e);
                }
                else
                {
                    DataList1.Visible = true;
                    DataList1.DataBind();
                }
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
            //wishlist
           /* if (Session["wish"] != null && Session["useremail"] != null)
            {

            }
            else
            {

            }*/

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
            int pid = Convert.ToInt32(Session["productId"].ToString());

            Button btn = (Button)sender;
            string info = btn.CommandArgument;

            string info1 = btn.CommandName;
            if (Session["useremail"] != null)
            {
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("insert into tblrating values (@ratingvalue,@review,@PId,@UserName)");
                SqlDataAdapter sda = new SqlDataAdapter();
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@ratingvalue", Rating1.CurrentRating.ToString());
                cmd.Parameters.AddWithValue("@review", txtreview.Text);
                cmd.Parameters.AddWithValue("@PId", pid);
                cmd.Parameters.AddWithValue("@Username", Session["useremail"]);

                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                //    Response.Redirect(Request.Url.AbsoluteUri);
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

        }

        protected void ShowPopup(object sender, EventArgs e)
        {
            //code for modal pop up
            Button btn = (Button)sender;
            string prodctId = btn.CommandArgument;


            Session["productId"] = prodctId;
            // Session["getdata"] = e.CommandArgument.ToString();
            String mycon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Products where PId='" + prodctId + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            namep.Text = ds.Tables[0].Rows[0]["PName"].ToString();
            price.Text = ds.Tables[0].Rows[0]["PPrice"].ToString();
            pimage.ImageUrl = ds.Tables[0].Rows[0]["PImage"].ToString();

            cmd = new SqlCommand();
            DataTable dt1 = this.GetData("SELECT ISNULL(AVG(Rating), 0) AverageRating, COUNT(Rating) RatingCount FROM tblrating  where PId='" + prodctId + "'");
            Rating1.CurrentRating = Convert.ToInt32(dt1.Rows[0]["AverageRating"]);
            lbresult.Text = string.Format("{0} Users have rated. Average Rating {1}", dt1.Rows[0]["RatingCount"], dt1.Rows[0]["AverageRating"]);


            if (Session["useremail"] != null)
            {
                string myquery1 = "Select * from wishlist where PId=" + prodctId + " and useremail='" + Session["useremail"] + "'";
                con = new SqlConnection(mycon);

                cmd = new SqlCommand();
                cmd.CommandText = myquery1;
                cmd.Connection = con;
                sda = new SqlDataAdapter();
                sda.SelectCommand = cmd;
                ds = new DataSet();
                sda.Fill(ds);

                      if (ds.Tables[0].Rows.Count > 0)
                {
                    
                    wishlist.ImageUrl = "images/icontrue.png";
                                }
                else
                {
                                 wishlist.ImageUrl = "images/iconfalse.png";
                }
            }
            else
            {
                   wishlist.ImageUrl = "images/iconfalse.png";
                con.Close();

            }

            Session["getdata"] = ds;
            Session["price"] = price.Text;
            int productQuan = 0;
            int psold = 0;
            DropDownList drp = (DropDownList)this.Master.FindControl("ddl");
            if (drp.SelectedValue != null)
            {
                city = drp.SelectedValue.ToString();
            }
          string q = "select CityId from City where CityName='" + city + "'";
            cmd = new SqlCommand(q, con);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            ds = new DataSet();
            da.Fill(ds);
            int cityId = Convert.ToInt32(ds.Tables[0].Rows[0]["cityId"].ToString());
            String myquery = "select * from ProductRef where PId='" + prodctId + "' and CityId='" + cityId + "'";
            cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {

                productQuan = Convert.ToInt32(ds.Tables[0].Rows[0]["PQuantity"].ToString());

                psold = Convert.ToInt16(ds.Tables[0].Rows[0]["SoldOut"].ToString());

            }
            if (productQuan == psold)
            {
                Label15.Text = "Sorry for the inconvience.The product you requested is Out of Stock.";
                Label15.Visible = true;

                ImageButton2.Enabled = false;
            }
            else
            {

                Label15.Visible = false;
                ImageButton2.Enabled = true;

            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

        }
        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {

            //dropdown select changed
            DataSet ds = (DataSet)Session["getdata"];//getting session values of dropdownlist
            string dsprice = ds.Tables[0].Rows[0]["PPrice"].ToString();
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

                      Session["price"] = price.Text;


            }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

        }
        //checkchanged datalist
        protected void checked_changed(object sender, EventArgs e)
        {

            DropDownList drp = (DropDownList)this.Master.FindControl("ddl");
            if (drp.SelectedValue != null)
            {
                city = drp.SelectedValue.ToString();
            }
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
                    SqlCommand cmd = new SqlCommand();
                   
                    string cityNameQuery = "select CityId from City where CityName='" + city + "'";
                    cmd.CommandText = cityNameQuery;
                    cmd.Connection = con;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    int cityId = Convert.ToInt32(ds.Tables[0].Rows[0]["CityId"]);

                    string query = "select * from Products p, ProductRef r where p.PCategory in (" + Label2.Text + ") and p.PId=r.PId and r.CityId='" + cityId + "'";
                    cmd = new SqlCommand(query, con);
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);

                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    DataList1.Visible = false;
                    DataList2.Visible = true;
                    DataList2.DataSource = dt;
                    DataList2.DataBind();
                    
                    con.Close();

                }

                else if (chkbox == "")
                {
                    DataList1.Visible = true;
                    DataList1.DataBind();
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
            Session.Remove("useremail1");

            Session.Remove("useremail");
            ///Session.Abandon();
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            DropDownList drp = (DropDownList)this.Master.FindControl("ddl");
            if (drp.SelectedValue != null)
            {
                city = drp.SelectedValue.ToString();
            }
            ImageButton btn = e.Item.FindControl("ImageButton1") as ImageButton;
            Label lb1 = e.Item.FindControl("id") as Label;

            String mycon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand cmd = new SqlCommand();


            string cityNameQuery = "select CityId from City where CityName='" + city + "'";
            cmd.CommandText = cityNameQuery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int cityId = Convert.ToInt32(ds.Tables[0].Rows[0]["CityId"]);



            String myquery = "select * from ProductRef where PId='" + lb1.Text + "' and CityId='" + cityId + "'";

            cmd.CommandText = myquery;
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();

            da.Fill(ds);




            int stockdata = 0;
            int soldout = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                stockdata = Convert.ToInt32(ds.Tables[0].Rows[0]["PQuantity"]);
                soldout = Convert.ToInt32(ds.Tables[0].Rows[0]["SoldOut"]);
            }
            con.Close();

            if (stockdata == soldout)
            {
                //lb.Text = "Out of Stock";
                btn.Visible = true;
                btn.ImageUrl = "images/soldout.jpg";
            }

        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {

            string s = Session["productId"].ToString();
            string selectedval;
            if (ddl.SelectedValue != null)
            {
                selectedval = ddl.SelectedValue.ToString();
            }
            else
            {
                selectedval = "24";
            }



            HttpCookie c = new HttpCookie("selection");
            c.Value = selectedval;
            Response.Cookies.Add(c);
            //quantity
            string pquantity;
            if (DropDownList1.SelectedValue != null)
            {
                pquantity = DropDownList1.SelectedValue.ToString();
            }
            else
            {
                pquantity = "1";
            }

            HttpCookie c1 = new HttpCookie("quantity");
            c1.Value = pquantity;
            Response.Cookies.Add(c1);




            Response.Redirect("AddtoCart.aspx?id=" + s + "&price=" + Session["price"]);
        }
        protected void Wishlist_Click(object sender, ImageClickEventArgs e)
        {
            int pid = Convert.ToInt32(Session["productId"].ToString());

            if (Session["useremail"] != null)
            {
                Session["wish"] = Session["productId"];
                String query = "insert into wishlist(useremail,PId) values('" + Session["useremail"].ToString() + "'," + Session["wish"].ToString() + ")";
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand(query);

                con.Open();
                cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();


                string myquery1 = "Select * from wishlist where PId=" + pid + " and useremail='" + Session["useremail"] + "'";
                 cmd = new SqlCommand();
                cmd.CommandText = myquery1;
                cmd.Connection = con;
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmd;
                DataSet ds = new DataSet();
                sda.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                  
                    wishlist.ImageUrl = "images/icontrue.png";
                    
                }
                else
                {
                      wishlist.ImageUrl = "images/iconfalse.png";
                }
            }
            else
            {
                lbwishlist.Text = "Login to yout account";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

            }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
      
       
        }
    }
}