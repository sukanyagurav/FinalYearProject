using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using iTextSharp.text;
using System.IO;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.Configuration;

namespace RENTAL
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Text = Request.QueryString["orderid"];
           // Panel1.Visible = true;
            Label11.Text = Label2.Text;
            findorderdate(Label11.Text);
            findaddress(Label11.Text);
            showgrid(Label11.Text);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            exportpdf();
        }
        private void exportpdf()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Panel1.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }
        private void findorderdate(String Orderid)
        {
            String mycon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;

            String myquery = "Select * from OrderDetails where orderid='" + Orderid + "'";
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

                Label12.Text = ds.Tables[0].Rows[0]["DateOfOrder"].ToString();

            }

            con.Close();
        }
        private void findaddress(String Orderid)
        {
            String mycon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;

            String myquery = "Select * from orderaddress where orderid='" + Orderid + "'";
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
                Label14.Text= ds.Tables[0].Rows[0]["username"].ToString();
                Label18.Text = ds.Tables[0].Rows[0]["useremail"].ToString();
                Label19.Text = ds.Tables[0].Rows[0]["address"].ToString();
                Label20.Text = ds.Tables[0].Rows[0]["mobileno"].ToString();
            }

            con.Close();
        }
        private void showgrid(String orderid)
        {
            DataTable dt = new DataTable();
            DataRow dr;

            dt.Columns.Add("sno");
          //  dt.Columns.Add("productid");
            dt.Columns.Add("PName");
            dt.Columns.Add("month");
            dt.Columns.Add("quantity");
            dt.Columns.Add("PPrice");
            dt.Columns.Add("totalprice");
            String mycon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;

            SqlConnection scon = new SqlConnection(mycon);
            String myquery = "select * from orderdetails where orderid='" + orderid + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = scon;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            int totalrows = ds.Tables[0].Rows.Count;
            int i = 0;
            int grandtotal = 0;
            while (i < totalrows)
            {
                dr = dt.NewRow();
                dr["sno"] = ds.Tables[0].Rows[i]["sno"].ToString();
              //  dr["productid"] = ds.Tables[0].Rows[i]["productid"].ToString();
                dr["PName"] = ds.Tables[0].Rows[i]["PName"].ToString();
                dr["quantity"] = ds.Tables[0].Rows[i]["Quantity"].ToString();
                dr["PPrice"] = ds.Tables[0].Rows[i]["PPrice"].ToString();
                dr["month"] = ds.Tables[0].Rows[i]["Month"].ToString();
                int price = Convert.ToInt16(ds.Tables[0].Rows[i]["PPrice"].ToString());
                int quantity = Convert.ToInt16(ds.Tables[0].Rows[i]["Quantity"].ToString());
                int totalprice = price * quantity;
                dr["totalprice"] = totalprice;
                grandtotal = grandtotal + totalprice;
                dt.Rows.Add(dr);
                i = i + 1;
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();

            Label4.Text = grandtotal.ToString();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

    }
}