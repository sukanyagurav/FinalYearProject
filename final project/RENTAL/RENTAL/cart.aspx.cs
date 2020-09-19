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
    public partial class AddtoCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

              
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
                        String myquery = "select * from Products where PId="+Request.QueryString["id"];
                       
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
                        dr["month"] =Request.Cookies["selection"].Value ; //Request.QueryString["month"];
                        dr["PPrice"] = Session["price"].ToString(); //Request.QueryString["price"];
                        dr["quantity1"] =  Request.Cookies["quantity"].Value;
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
                        dr["quantity1"] =  Request.Cookies["quantity"].Value;
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
                Label2.Text = GridView1.Rows.Count.ToString();

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

                if (sr == sr1)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();
                    //Label1.Text = "Item Has Been Deleted From Shopping Cart";
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
    }
}
