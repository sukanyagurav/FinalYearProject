using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace RENTAL
{
    public partial class Addproduct : System.Web.UI.Page
    {
        static string imagelink;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnupload_Click(object sender, EventArgs e)
        {
            String str = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(str);
            // f1.SaveAs(Request.PhysicalApplicationPath +"./images/" + f1.FileName.ToString());
            con.Open();
            Boolean imagesaved = false;

            if (f1.HasFile == true)
            {

                String contenttype = f1.PostedFile.ContentType;

                if (contenttype == "image/jpeg" || contenttype == "image/png")
                {
                    if (ddl.SelectedValue.ToLower().ToString() == "bedroom")
                    {
                        f1.SaveAs(Request.PhysicalApplicationPath + ("./bedroom/") + txtpname.Text + ".jpg");
                        imagelink = "bedroom/" + txtpname.Text + ".jpg";
                        imagesaved = true;
                    }
                    if (ddl.SelectedValue.ToLower().ToString() == "livingroom")
                    { 
                         f1.SaveAs(Request.PhysicalApplicationPath + ("./livingroom/") + txtpname.Text + ".jpg");
                        imagelink = "livingroom/" + txtpname.Text + ".jpg";
                        imagesaved = true;
                    }
                    if (ddl.SelectedValue.ToLower().ToString() == "studyroom")
                    {
                        f1.SaveAs(Request.PhysicalApplicationPath + ("./studyroom/") + txtpname.Text + ".jpg");
                        imagelink = "studyroom/" + txtpname.Text + ".jpg";
                        imagesaved = true;
                    }
                    if (ddl.SelectedValue.ToLower().ToString() == "diningroom")
                    {
                        f1.SaveAs(Request.PhysicalApplicationPath + ("./diningroom/") + txtpname.Text + ".jpg");
                        imagelink = "diningroom/" + txtpname.Text + ".jpg";
                        imagesaved = true;
                    }
                    if (ddl.SelectedValue.ToLower().ToString() == "storage")
                    {
                        f1.SaveAs(Request.PhysicalApplicationPath + ("./storage/") + txtpname.Text + ".jpg");
                        imagelink = "storage/" + txtpname.Text + ".jpg";
                        imagesaved = true;
                    }
                    if (ddl.SelectedValue.ToString() == "Appliance")
                    {
                        f1.SaveAs(Request.PhysicalApplicationPath + ("./Appliance/") + txtpname.Text + ".jpg");
                        imagelink = "Appliance/" + txtpname.Text + ".jpg";
                        imagesaved = true;
                    }
                    if (ddl.SelectedValue.ToString() == "OfficeFurniture")
                    {
                        f1.SaveAs(Request.PhysicalApplicationPath + ("./OfficeFurniture/") + txtpname.Text + ".jpg");
                        imagelink = "OfficeFurniture/" + txtpname.Text + ".jpg";
                        imagesaved = true;
                    }
                }

                else
                {
                    Label4.Text = "Kindly Upload JPEG Format Image Only";
                }
            }
            else
            {
                Label4.Text = "You have not selected any file - Browse and Select File First";
            }

            if (imagesaved == true)
            {
               string query = "insert into Products values('" + txtpname.Text + "','" + txtprice.Text + "','" + txtqty.Text + "','" + txtkeyword.Text + "','" + ddl.SelectedValue.ToLower().ToString() + "','" + imagelink + "','" + txtrefunddeposit.Text + "') ";
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                Label1.Text = "Product Has Been Successfully Saved";
            }
        }
        

    }
}