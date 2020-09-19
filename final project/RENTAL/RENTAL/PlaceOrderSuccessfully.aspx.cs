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
using System.Net;
using System.Net.Mail;
using System.Text;
namespace RENTAL
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt;
                dt = (DataTable)Session["Buyitems"];
                int PId;
                int quantity;

                foreach (DataRow row in dt.Rows)
                {
                    PId = Convert.ToInt16(row["PId"].ToString());
                    quantity = Convert.ToInt16(row["quantity1"].ToString());
                    //Response.Write(PId);
                    updatestock(PId, quantity);
                }
                //           DataTable dt;
                dt = (DataTable)Session["buyitems"];

                DateTime ReturnDate;

                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DateTime today = DateTime.Now;
                    
                    int month = Convert.ToInt32(dt.Rows[i]["month"]);
                    ReturnDate = today.AddMonths(month);
                    // Response.Write(ReturnDate);
                    String updatepass = "insert into OrderDetails(orderid,sno,PId,PName,PPrice,Quantity,DateOfOrder,Month,username,ReturnDate) values('" + Request.QueryString["orderid"] + "','" + dt.Rows[i]["sno"] + "','" + dt.Rows[i]["PId"] + "','" + dt.Rows[i]["PName"] + "','" + dt.Rows[i]["PPrice"] + "','" + dt.Rows[i]["quantity1"] + "','" + today + "','" + dt.Rows[i]["month"] + "','" + Session["useremail"] + "','" + ReturnDate + "')";
                    String mycon1 = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
                    SqlConnection s = new SqlConnection(mycon1);
                    s.Open();
                    SqlCommand cmd1 = new SqlCommand();
                    cmd1.CommandText = updatepass;
                    cmd1.Connection = s;
                    cmd1.ExecuteNonQuery();
                    s.Close();
                    saveaddress();
                }
                Label2.Text = Request.QueryString["orderid"];
                // Panel1.Visible = true;
                Label11.Text = Label2.Text;
                findorderdate(Label11.Text);
                findaddress(Label11.Text);
                showgrid(Label11.Text);
            }
        }
        private void updatestock(int PId, int numbersold)
        {//update the stock
            int pquantity = 0;
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

                pquantity = Convert.ToInt16(ds.Tables[0].Rows[0]["PQuantity"].ToString());
                psold = Convert.ToInt16(ds.Tables[0].Rows[0]["SoldOut"].ToString());

            }
            con.Close();
            string q = "select CityId from City where CityName='" + Session["ddl"].ToString() + "'";
            cmd = new SqlCommand(q, con);
            da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            ds = new DataSet();
            da.Fill(ds);
            int cityId = Convert.ToInt32(ds.Tables[0].Rows[0]["cityId"].ToString());

            String mycon1 = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            int newsold;
            if (pquantity != psold && (pquantity-psold) >= numbersold)
            {
                newsold = psold + numbersold;
                String updatedata = "update ProductRef set SoldOut='" + newsold + "'where PId='" + PId + "'and CityId='"+cityId+"'";
                SqlConnection con1 = new SqlConnection(mycon1);
                con1.Open();
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = updatedata;
                cmd1.Connection = con1;
                cmd1.ExecuteNonQuery();

            }
            

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            exportpdf();
        }
        public void saveaddress()
        {
            //  int order = int.Parse(Label3.Text.ToString());
            String updatepass = "insert into orderaddress(orderid,address,usercity,firstname,state,pincode) values('" + Request.QueryString["orderid"] + "','" + Session["add"] + "','" + Session["ddl"] + "','" + Session["name"] + "','" + Session["city"] + "','" + Session["pin"] + "')";
            String mycon1 = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlConnection s = new SqlConnection(mycon1);
            s.Open();
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandText = updatepass;
            cmd1.Connection = s;
            cmd1.ExecuteNonQuery();
            s.Close();
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
            string dateorder;
            DateTime orderdate;
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
                dateorder= ds.Tables[0].Rows[0]["DateOfOrder"].ToString();
                orderdate = DateTime.Parse(dateorder);
                Label12.Text = orderdate.ToString("dd/MM/yyyy");
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
                Label14.Text= ds.Tables[0].Rows[0]["firstname"].ToString();
              //  Label18.Text = ds.Tables[0].Rows[0]["useremail"].ToString();
                Label19.Text = ds.Tables[0].Rows[0]["address"].ToString();
                //Label20.Text = ds.Tables[0].Rows[0]["mobileno"].ToString();
            }
            myquery = "select * from Users where Email='" + Session["useremail"].ToString() + "'";
            cmd = new SqlCommand(myquery,con);
             da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            ds = new DataSet();
            da.Fill(ds);
            if(ds.Tables[0].Rows.Count>0)
            {
                Label18.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                Label20.Text = ds.Tables[0].Rows[0]["Mobileno"].ToString();
            }
            con.Close();
        }
        private void showgrid(String orderid)
        {
            DataTable dt = new DataTable();
            DataRow dr;
           string  dateoforder;
            string ReturnDate;
            dt.Columns.Add("sno");
          //  dt.Columns.Add("productid");
            dt.Columns.Add("PName");
            dt.Columns.Add("month");
            dt.Columns.Add("quantity");
            dt.Columns.Add("PPrice");
            dt.Columns.Add("totalprice");
            dt.Columns.Add("DateOfOrder");
            dt.Columns.Add("ReturnDate");
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
            MailMessage msg1;
        
            string emailId = string.Empty;
            Boolean chk = false;
            while (i < totalrows)
            {
                dr = dt.NewRow();
                dr["sno"] = ds.Tables[0].Rows[i]["sno"].ToString();
              //  dr["productid"] = ds.Tables[0].Rows[i]["productid"].ToString();
                dr["PName"] = ds.Tables[0].Rows[i]["PName"].ToString();
                dr["quantity"] = ds.Tables[0].Rows[i]["Quantity"].ToString();
                dr["PPrice"] = ds.Tables[0].Rows[i]["PPrice"].ToString();
                dr["month"] = ds.Tables[0].Rows[i]["Month"].ToString();
                dateoforder = ds.Tables[0].Rows[i]["DateOfOrder"].ToString();
                DateTime dO;
                dO = DateTime.Parse(dateoforder);
                dr["DateOfOrder"] =dO.ToString("dd/MM/yyyy");
                ReturnDate = ds.Tables[0].Rows[i]["ReturnDate"].ToString();
                DateTime dR;
                dR = DateTime.Parse(ReturnDate);
                dr["ReturnDate"] = dR.ToString("dd/MM/yyyy");
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
            SendHTMLMail();
        }
        public void SendHTMLMail()
        {
            MailMessage msg1 = new MailMessage();
            SmtpClient smtp1 = new SmtpClient();
            msg1.Subject = "Order Confirmation";
            msg1.IsBodyHtml = true;
            msg1.Body += firstbody();
            msg1.Body += GetGridviewData(GridView1);
            msg1.Body += lastbody();

            string toaddress = Session["useremail"].ToString();
            msg1.To.Add(toaddress);
            string fromaddress = "Renture <rentureteam@gmail.com>";
            msg1.From = new MailAddress(fromaddress);
            smtp1.Credentials = new NetworkCredential("rentureteam@gmail.com", "RENTURE@22");
            smtp1.Port = 587;
            smtp1.Host = "smtp.gmail.com";
            smtp1.EnableSsl = true;
            smtp1.Send(msg1);
        }


        public string firstbody()
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/OrderConfirmation.html")))
            {
                body = reader.ReadToEnd();

            }
            body = body.Replace("{name}", Label14.Text.Trim());
            body= body.Replace("{OrderDate}", Label12.Text.Trim());
            body = body.Replace("{OrderNo}", Label2.Text.Trim());

            return body;
        }
        public string lastbody()
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/OrderConfirmation.html")))
            {
                body = reader.ReadToEnd();

            }
            body += "Thanks for Shopping with Renture, we appriate it.";

            return body;
        }
        // This Method is used to render gridview control
        public string GetGridviewData(GridView gv)
        {
            StringBuilder strBuilder = new StringBuilder();
            StringWriter strWriter = new StringWriter(strBuilder);
            HtmlTextWriter htw = new HtmlTextWriter(strWriter);
            gv.RenderControl(htw);
            return strBuilder.ToString();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

    }
}