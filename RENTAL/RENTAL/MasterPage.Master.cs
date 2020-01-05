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
            //user session checking
            if (Session["useremail"] != null)
            {
                Label3.Text = "Hello, " + Session["useremail"].ToString();
                Button1.Visible = false;
                Button3.Visible = true;
            }
            else
            {
                Label3.Visible = false;
                Button1.Visible = true;
                Button3.Visible = false;

            }

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
        {/*
            string str = search.Text;
            string s1 = str.ToLower();
            


            string op = "";
            SqlDataReader dr;
            string con1 = ConfigurationManager.ConnectionStrings["search"].ConnectionString;
            SqlConnection con2 = new SqlConnection(con1);
            con2.Open();
            string query = "select top 1 PCategory from Products where PKeyword like '%'"+s1+"'%'";
            SqlCommand cmd = new SqlCommand(query, con2);
            dr= cmd.ExecuteReader();
            
            while (dr.Read())
            {
                op = op + dr.GetValue(5);
            }
            Response.Write(op);
            con2.Close();*/
        }

        protected void Button1_click(object sender, EventArgs e)
        {
            Response.Cookies.Add(new HttpCookie("returnUrl", Request.Url.PathAndQuery));
            Response.Redirect("Login.aspx");
        }

        protected void logout(object sender, EventArgs e)
        {
          // Session.Clear();
            Session.Abandon();
        }

        //public string GetCurrentPageName()
        //{
        //    string sPath = Request.Url.AbsolutePath;
        //    System.IO.FileInfo oInfo = new System.IO.FileInfo(sPath);
        //    string sRet = oInfo.Name;
        //    return sRet;
        //}

    }
}