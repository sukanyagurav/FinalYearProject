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
    public partial class PlaceOrder : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = scon;
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
                
            }
            Label4.Text = DateTime.Now.ToShortDateString();
            findorderid();
        
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
        public void findorderid()
        {
            String pass = "abcdefghijklmnopqrstuvwxyz123456789";
            Random r = new Random();
            char[] mypass = new char[5];
            for (int i = 0; i < 5; i++)
            {
                mypass[i] = pass[(int)(35 * r.NextDouble())];

            }
            String orderid;
            orderid = "Order" + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(mypass);

            Label3.Text = orderid;


        }

        public void saveaddress()
        {
          //  int order = int.Parse(Label3.Text.ToString());
            String updatepass = "insert into orderaddress(orderid,mobileno,address,usercity,username) values('" + Label3.Text + "','" + TextBox1.Text + "','"+TextBox2.Text+"','"+TextBox3.Text+"','"+Session["useremail"]+"')";
            String mycon1 =   ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlConnection s = new SqlConnection(mycon1);
            s.Open();
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandText = updatepass;
            cmd1.Connection = s;
            cmd1.ExecuteNonQuery();
            s.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable dt;
            dt = (DataTable)Session["buyitems"];

            String ReturnDate;
           
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                DateTime today = DateTime.Now;
                string today1 = today.ToString("dd/MM/yyyy");
                int month = Convert.ToInt32(dt.Rows[i]["month"]);
                ReturnDate = today.AddMonths(month).ToString("dd/MM/yyyy");
               // Response.Write(ReturnDate);
                String updatepass = "insert into OrderDetails(orderid,sno,PId,PName,PPrice,Quantity,DateOfOrder,Month,username,ReturnDate) values('" + Label3.Text + "','" + dt.Rows[i]["sno"] + "','" + dt.Rows[i]["PId"] + "','" + dt.Rows[i]["PName"] + "','" + dt.Rows[i]["PPrice"] + "','" + dt.Rows[i]["quantity1"] + "','"+today1+"','"+ dt.Rows[i]["month"] + "','"+Session["useremail"]+"','"+ReturnDate+"')";
                String mycon1 = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
                SqlConnection s = new SqlConnection(mycon1);
                s.Open();
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = updatepass;
                cmd1.Connection = s;
                cmd1.ExecuteNonQuery();
                s.Close();

            }
             saveaddress();
               Response.Redirect("PlaceOrderSuccessfully.aspx?orderid="+Label3.Text.ToString());
        }


    }

}