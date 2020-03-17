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
        static Boolean orderconfirm;

        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox5.Text = Session["CityName"].ToString();
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
                        //Response.Redirect("AddtoCart.aspx");

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
                        //Response.Redirect("AddtoCart.aspx");

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
            Label4.Text = DateTime.Now.ToString("dd/MM/yyyy");
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
            Session["total"] = gtotal;
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

     
        protected void Button1_Click(object sender, EventArgs e)
        {
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
                    Session["name"] = TextBox1.Text;
                    Session["add"] = TextBox2.Text;
                    Session["pin"] = TextBox3.Text;
                    Session["ddl"] = TextBox5.Text;
                    Session["city"] = TextBox4.Text;
                    Response.Redirect("Paymentgateway.aspx?orderid=" + Label3.Text.ToString());

                    /* 
                         Response.Redirect("PlaceOrderSuccessfully.aspx?orderid=" + Label3.Text.ToString());

                     }
                     */
                }


            }
        }

        private void checkavailability(int PId, int numbersold)
        {
            // check the availability
            int productQuan = 0;
            int psold = 0;
            String mycon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            String myquery = "select * from ProductRef where PId='" + PId + "'";
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

                productQuan = Convert.ToInt32(ds.Tables[0].Rows[0]["PQuantity"].ToString());

                psold = Convert.ToInt16(ds.Tables[0].Rows[0]["SoldOut"].ToString());

            }
            con.Close();

            if (productQuan != psold && (productQuan - psold) >= numbersold)
            {
                orderconfirm = true;
                
            }
            else
            {
                orderconfirm = false;
                if (productQuan == psold)
                {
                    Label15.Text = " Sorry for the inconvience.The product you requested is Out of Stock.";

                }
                else
                {
                    Label15.Text = "Sorry for the inconvience.Requested quantity is unavailable.Please update the quantity for selected item.";

                }
            }
        }
       
        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
           
        }
    }

}