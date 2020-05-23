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
    public partial class AdminHome : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
        static string imagelink;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getNameBy();
        }
        void getNameBy()
        {
            Name.Enabled=false;
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from advertisement  where imageid='" + TextBox1.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Image1.ImageUrl = dr.GetValue(1).ToString();
                    }

                }
                else
                {
                    Response.Write("<script>alert('Image does not exist ');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            // f1.SaveAs(Request.PhysicalApplicationPath +"./images/" + f1.FileName.ToString());
            con.Open();
            Boolean imagesaved = false;
            if (f1.HasFile == true)
            {

                String contenttype = f1.PostedFile.ContentType;

                if (contenttype == "image/jpeg" || contenttype == "image/png")
                {

                    f1.SaveAs(Request.PhysicalApplicationPath + ("./Imag/") + Name.Text + ".jpg");
                    imagelink = "Imag/" + Name.Text + ".jpg";
                    imagesaved = true;
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
                string query = "insert into advertisement(imagesource)values('" + imagelink + "') ";
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
              
            }
        }
            bool checkIfItemExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from advertisement where imageid='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            // f1.SaveAs(Request.PhysicalApplicationPath +"./images/" + f1.FileName.ToString());
            con.Open();
            Boolean imagesaved = false;

            if (f1.HasFile == true)
            {

                String contenttype = f1.PostedFile.ContentType;

                if (contenttype == "image/jpeg" || contenttype == "image/png")
                {
                    f1.SaveAs(Request.PhysicalApplicationPath + ("./Imag/") + Name.Text + ".jpg");
                    imagelink = "Imag/" + Name.Text + ".jpg";
                    imagesaved = true;
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
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            clearForm();
        }
        void clearForm()
        {
           
            
            Name.Text = "";
            Image1.ImageUrl = "";
            
        }


    }
}
            