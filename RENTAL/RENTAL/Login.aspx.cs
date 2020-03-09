using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net;
using System.Net.Mail;
namespace RENTAL
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString);
            con.Open();
           
           
                string checkuser = "select count(*) from Users where Email='" + email.Text + "'";
                SqlCommand cmd = new SqlCommand(checkuser, con);
                int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                con.Close();
                if (temp == 1)
                {
                    con.Open();
                    string checkpassword = "select Password from Users where Email='" + email.Text + "'";
                    SqlCommand cmdpass = new SqlCommand(checkpassword, con);
                    string password1 = cmdpass.ExecuteScalar().ToString().Replace(" ", "");
              //  string password = DecodeFrom64(password1);
                   string approve= "select Is_approved from Users where (Is_Approved=1 OR Is_Approved=0) AND Email='" + email.Text+"'";
                    SqlCommand cmdapprove = new SqlCommand(approve, con);
               string verify = cmdapprove.ExecuteScalar().ToString();
                if (DecodeFrom64(password1) == txtpassword.Text)
                    {
                    //Response.Write(verify);
                       if (verify == "1")
                        {
                        //session created;
                        Session["useremail"] = email.Text;
                        //Response.Redirect("Home.aspx");
                        Session["useremail1"] = email.Text;
                        Session["buyitems"] = null;
                        fillsavedCart();

                        HttpCookie returnCookie = Request.Cookies["returnUrl"];
                        if ((returnCookie == null) || string.IsNullOrEmpty(returnCookie.Value))
                        {
                            Response.Redirect("Home.aspx");
                        }
                        else
                        {
                            HttpCookie deleteCookie = new HttpCookie("returnUrl");
                            deleteCookie.Expires = DateTime.Now.AddDays(-1);
                            Response.Cookies.Add(deleteCookie);
                            Response.Redirect(returnCookie.Value);
                        }
                    }
                    else
                    {
                        verifyaccount.Visible = true;
                        verifyaccount.Text="Please verify yout account first ";
                    }
                    }
                    else
                    {
                        Label4.Visible = true;
                        Label4.Text = "Password is not correct";
                    }
                }
                else
                {
                    Label3.Visible = true;
                    Label3.Text = "Email is not correct";
                }
            
           
        }


        //this function Convert to Decord your Password
        public string DecodeFrom64(string encodedData)
        {
            System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
            System.Text.Decoder utf8Decode = encoder.GetDecoder();
            byte[] todecode_byte = Convert.FromBase64String(encodedData);
            int charCount = utf8Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
            char[] decoded_char = new char[charCount];
            utf8Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
            string result = new String(decoded_char);
            return result;
        }

        private void fillsavedCart()
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
            

            String mycon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlConnection scon = new SqlConnection(mycon);
            String myquery = "select * from SavedCartDetail where useremail='" + Session["useremail1"].ToString() + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = scon;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                int i = 0;
                int counter = ds.Tables[0].Rows.Count;
                while (i < counter)
                {
                    dr = dt.NewRow();
                     dr["sno"] = i+1;
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
                    i = i + 1;
                }

            }
            else
            {
                Session["Buyitems"] = null;
            }
            Session["Buyitems"] = dt;
        }


    }
}