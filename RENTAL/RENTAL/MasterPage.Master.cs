using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
namespace RENTAL
{


    public partial class MasterPage : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //check if the session exists and select the correct value in the dropdownlist
                if (Session["CityName"] != null)
                {
                    ddl.SelectedValue = Session["CityName"].ToString();
                    // ddl.Items.FindByValue(Session["CityName"].ToString()).Selected = true;
                    // Session["CityName"] = ddl.SelectedValue;
                }
                else
                {
                    ddl.DataBind();
                    //set the session with the default city
                    Session["CityName"] = ddl.SelectedValue;
                }



            }
            if (Session["useremail1"] == null)
            {
                logout.Visible = false;
           //     LinkButton1.Visible = false;
            }
            else
            {
                Button1.Visible = false;
                logout.Visible = true;
         //       LinkButton1.Visible = true;
                

            }

            if (Session["useremail"] == null)
            {
                Image1.Visible = false;
                Label1.Visible = false;
                // Response.Redirect("Home.aspx");
            }
            else
            {
                Image1.Visible = true;
                Label1.Visible = true;
                string str = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
                SqlConnection con = new SqlConnection(str);
                SqlDataAdapter sda = new SqlDataAdapter("Select * from Users where Email= '" + Session["useremail"].ToString() + "' ", con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                Label1.Text = dt.Rows[0]["Username"].ToString();
                // Image2.ImageUrl = "images/usericon.png";
                Image1.ImageUrl = "images/usericon.png";
                // Label2.Text = dt.Rows[0]["First_Name"].ToString() + " " + dt.Rows[0]["Last_Name"].ToString();
                //Label3.Text = dt.Rows[0]["Email_id"].ToString();

            }
            if (Session["admin"] == null)
            {
                Image2.Visible = false;
                Label2.Visible = false;
                // Response.Redirect("Home.aspx");
            }
            else
            {
                Image2.Visible = true;
                Label2.Visible = true;
                string str = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
                SqlConnection con = new SqlConnection(str);
                SqlDataAdapter sda = new SqlDataAdapter("Select * from AdminLogin where AdminName= '" + Session["admin"].ToString() + "'", con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                Label2.Text = dt.Rows[0]["AdminName"].ToString();
                // Image2.ImageUrl = "images/usericon.png";
                Image2.ImageUrl = "images/usericon.png";
                // Label2.Text = dt.Rows[0]["First_Name"].ToString() + " " + dt.Rows[0]["Last_Name"].ToString();
                //Label3.Text = dt.Rows[0]["Email_id"].ToString();

            }
        
       

    }
        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Remove("useremail1");

            Session.Remove("useremail");
            ///Session.Abandon();
        }
        protected void AddtoCart(object sender, EventArgs e)
        {
            Response.Redirect("AddtoCart.aspx");
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            
            ddl.SelectedValue = ddl.SelectedItem.Value;
            Session["CityName"] = ddl.SelectedValue;

            //string pagename = GetCurrentPageName();
            //    Console.WriteLine("pagename--------"+pagename);
            //    Response.Write("~/"+pagename+".aspx?city=" + ddl.SelectedItem.Value);

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String str = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(str);
            string myquery = "SELECT PCategory from Products where PKeyword like '%'+@PKeyword+'%' or PName like '%'+@PName+'%'";
            SqlCommand cmd = new SqlCommand(myquery,con);
            cmd.Parameters.AddWithValue("@PKeyword", search.Text);
            cmd.Parameters.AddWithValue("@PName", search.Text);

            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = cmd;
            DataSet dt = new DataSet();
            sda.Fill(dt);
            string searchcat = dt.Tables[0].Rows[0]["PCategory"].ToString();
            if (searchcat == "bedroom")
            {
                Response.Redirect("Bed.aspx?search=" +search.Text);
            }
            else if (searchcat == "livingroom")
            {
                Response.Redirect("Living room.aspx?search=" + search.Text);
            }
            else
            {

            }
        }



      protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Cookies.Add(new HttpCookie("returnUrl", Request.Url.PathAndQuery));
            Response.Redirect("Login.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("wishlist.aspx");
        }









        /*   protected void Logout_Click(object sender, EventArgs e)
           {
               Session.RemoveAll();
               //Session.Clear();
              // Session.Abandon();
           }
           */




        //public string GetCurrentPageName()
        //{
        //    string sPath = Request.Url.AbsolutePath;
        //    System.IO.FileInfo oInfo = new System.IO.FileInfo(sPath);
        //    string sRet = oInfo.Name;
        //    return sRet;
        //}

    }
}