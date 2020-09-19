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
    public partial class WebForm1 : System.Web.UI.Page
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

                string approve = "select Is_approved from Users where (Is_Approved=1 OR Is_Approved=0) AND Email='" + email.Text + "'";
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
                        verifyaccount.Text = "Please verify yout account first ";
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
                con.Open();
                string chkadmin = "select * from AdminLogin where Adminemail='" + email.Text + "'";
                SqlCommand cmd1 = new SqlCommand(chkadmin, con);
                int temp1 = Convert.ToInt32(cmd1.ExecuteScalar().ToString());
                SqlDataAdapter sda = new SqlDataAdapter(cmd1);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                Response.Write(ds.Tables[0].Rows[0]["Adminemail"].ToString());
                Response.Write(cmd.ExecuteScalar().ToString());
                con.Close();
                if (temp1 == 1)
                {
                    con.Open();
                    string checkpassword = "select AdminPassword from AdminLogin where Adminemail='" + email.Text + "'";
                    SqlCommand cmdpass = new SqlCommand(checkpassword, con);
                    string password1 = cmdpass.ExecuteScalar().ToString().Replace(" ", "");
                    if (password1 == txtpassword.Text)
                    {
                        cmd1 = new SqlCommand("Select AdminName from AdminLogin where Adminemail='" + email.Text + "'", con);
                        string AdminName = cmd1.ExecuteScalar().ToString().Replace(" ", "");


                        Session["admin"] = AdminName;
                        Response.Redirect("AdminHome.aspx");
                    }
                    else
                    {
                        Response.Write("Admin password is incorrect");
                    }


                    if (ds.Tables[0].Rows[0]["Adminemail"].ToString() == email.Text.ToString())
                    {
                        Label3.Visible = true;
                        Label3.Text = "Email is not correct";
                    }


                }
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
            dt.Columns.Add("RefundableDeposit");

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
                    dr["sno"] = i + 1;
                    dr["PId"] = ds.Tables[0].Rows[0]["PId"].ToString();
                    dr["PName"] = ds.Tables[0].Rows[0]["PName"].ToString();
                    dr["PImage"] = ds.Tables[0].Rows[0]["PImage"].ToString();
                    dr["RefundableDeposit"] = ds.Tables[0].Rows[0]["RefundableDeposit"].ToString();
                    dr["month"] = ds.Tables[0].Rows[0]["month"].ToString();//Request.QueryString["month"];
                    dr["PPrice"] = ds.Tables[0].Rows[0]["PPrice"].ToString();//Request.QueryString["price"];
                    dr["quantity1"] = ds.Tables[0].Rows[0]["quantity1"].ToString();
                    int quantity1 = Convert.ToInt16(ds.Tables[0].Rows[0]["quantity1"].ToString());
                    int ref1 = Convert.ToInt16(ds.Tables[0].Rows[0]["RefundableDeposit"].ToString());

                    int price = Convert.ToInt16(ds.Tables[0].Rows[0]["PPrice"].ToString());
                    int quantity = Convert.ToInt16(ds.Tables[0].Rows[0]["month"].ToString());

                    float totalprice = (price * quantity1) + ref1;
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