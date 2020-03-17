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
    public partial class Adminaddproducts : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
        static string imagelink;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            SqlCommand cmd = new SqlCommand();
            string str = "select p.PId,p.PName,p.PPrice,p.PCategory,p.RefundableDeposit,c.CityName,r.PQuantity,r.SoldOut from Products p,City c, ProductRef r where c.CityId = r.CityId and p.PId = r.PId order by 1";
            cmd.CommandText = str;
            cmd.Connection= con;
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = cmd;
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getNameBy();
        }
        void getNameBy()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from Products where PName='" + TextBox1.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        //f1.Enabled = false;
                        TextBox2.Text = dr.GetValue(3).ToString();
                        TextBox3.Text = dr.GetValue(2).ToString();

                        TextBox4.Text = dr.GetValue(7).ToString();
                        TextBox5.Text = dr.GetValue(4).ToString();

                        ddl.SelectedValue= dr.GetValue(5).ToString();

                    }

                }
                else
                {
                    Response.Write("<script>alert('Prodcut does not exist ');</script>");
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
                    if (ddl.SelectedValue.ToLower().ToString() == "bedroom")
                    {
                        f1.SaveAs(Request.PhysicalApplicationPath + ("./bedroom/") +TextBox1.Text + ".jpg");
                        imagelink = "bedroom/" + TextBox1.Text + ".jpg";
                        imagesaved = true;
                    }
                    if (ddl.SelectedValue.ToLower().ToString() == "livingroom")
                    {
                        f1.SaveAs(Request.PhysicalApplicationPath + ("./livingroom/") + TextBox1.Text + ".jpg");
                        imagelink = "livingroom/" + TextBox1.Text + ".jpg";
                        imagesaved = true;
                    }
                    if (ddl.SelectedValue.ToLower().ToString() == "studyroom")
                    {
                        f1.SaveAs(Request.PhysicalApplicationPath + ("./studyroom/") + TextBox1.Text + ".jpg");
                        imagelink = "studyroom/" + TextBox1.Text + ".jpg";
                        imagesaved = true;
                    }
                    if (ddl.SelectedValue.ToLower().ToString() == "diningroom")
                    {
                        f1.SaveAs(Request.PhysicalApplicationPath + ("./diningroom/") + TextBox1.Text + ".jpg");
                        imagelink = "diningroom/" +TextBox1.Text + ".jpg";
                        imagesaved = true;
                    }
                    if (ddl.SelectedValue.ToLower().ToString() == "storage")
                    {
                        f1.SaveAs(Request.PhysicalApplicationPath + ("./storage/") +TextBox1.Text + ".jpg");
                        imagelink = "storage/" + TextBox1.Text + ".jpg";
                        imagesaved = true;
                    }
                    if (ddl.SelectedValue.ToString() == "Appliance")
                    {
                        f1.SaveAs(Request.PhysicalApplicationPath + ("./Appliance/") + TextBox1.Text + ".jpg");
                        imagelink = "Appliance/" + TextBox1.Text + ".jpg";
                        imagesaved = true;
                    }
                    if (ddl.SelectedValue.ToString() == "OfficeFurniture")
                    {
                        f1.SaveAs(Request.PhysicalApplicationPath + ("./OfficeFurniture/") + TextBox1.Text + ".jpg");
                        imagelink = "OfficeFurniture/" + TextBox1.Text + ".jpg";
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
                string query = "insert into Products1(PName,PPrice,PKeyword,PCategory,PImage,RefundableDeposit) values('" + TextBox1.Text + "','" + TextBox3.Text + "','" + TextBox5.Text + "','" + ddl.SelectedValue.ToLower().ToString() + "','" + imagelink + "','" + TextBox4.Text + "') ";
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();

                string pidQuery = "select PId from Products1 where PName='"+TextBox1.Text+"'";
                cmd.CommandText = pidQuery;
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                int pId = Convert.ToInt32(ds.Tables[0].Rows[0]["PId"]);

                string cityNameQuery = "select CityId from City where CityName='" + DropDownList1.SelectedValue.ToString()+ "'";
                cmd.CommandText = cityNameQuery;
                sda = new SqlDataAdapter(cmd);
                ds = new DataSet();
                sda.Fill(ds);
                int cityId = Convert.ToInt32(ds.Tables[0].Rows[0]["CityId"]);

                string query1 = "insert into ProductRef1(PId,CityId,PQty,SoldOut) values('" +pId + "','" + cityId + "','" + TextBox2.Text + "','" + 0 + "') ";
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = query1;
                cmd1.Connection = con;
                cmd1.ExecuteNonQuery();

                Label1.Text = "Product Has Been Successfully Saved";
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

                SqlCommand cmd = new SqlCommand("SELECT * from Products where PName='" + TextBox1.Text.Trim() + "';", con);
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

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkIfItemExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from Products WHERE PName='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Product Deleted Successfully');</script>");
                    clearForm();
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Product Name');</script>");
            }
        }
        void clearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            ddl.SelectedValue = "";
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
                    if (ddl.SelectedValue.ToLower().ToString() == "bedroom")
                    {
                        f1.SaveAs(Request.PhysicalApplicationPath + ("./bedroom/") + TextBox1.Text + ".jpg");
                        imagelink = "bedroom/" + TextBox1.Text + ".jpg";
                        imagesaved = true;
                    }
                    if (ddl.SelectedValue.ToLower().ToString() == "livingroom")
                    {
                        f1.SaveAs(Request.PhysicalApplicationPath + ("./livingroom/") + TextBox1.Text + ".jpg");
                        imagelink = "livingroom/" + TextBox1.Text + ".jpg";
                        imagesaved = true;
                    }
                    if (ddl.SelectedValue.ToLower().ToString() == "studyroom")
                    {
                        f1.SaveAs(Request.PhysicalApplicationPath + ("./studyroom/") + TextBox1.Text + ".jpg");
                        imagelink = "studyroom/" + TextBox1.Text + ".jpg";
                        imagesaved = true;
                    }
                    if (ddl.SelectedValue.ToLower().ToString() == "diningroom")
                    {
                        f1.SaveAs(Request.PhysicalApplicationPath + ("./diningroom/") + TextBox1.Text + ".jpg");
                        imagelink = "diningroom/" + TextBox1.Text + ".jpg";
                        imagesaved = true;
                    }
                    if (ddl.SelectedValue.ToLower().ToString() == "storage")
                    {
                        f1.SaveAs(Request.PhysicalApplicationPath + ("./storage/") + TextBox1.Text + ".jpg");
                        imagelink = "storage/" + TextBox1.Text + ".jpg";
                        imagesaved = true;
                    }
                    if (ddl.SelectedValue.ToString() == "Appliance")
                    {
                        f1.SaveAs(Request.PhysicalApplicationPath + ("./Appliance/") + TextBox1.Text + ".jpg");
                        imagelink = "Appliance/" + TextBox1.Text + ".jpg";
                        imagesaved = true;
                    }
                    if (ddl.SelectedValue.ToString() == "OfficeFurniture")
                    {
                        f1.SaveAs(Request.PhysicalApplicationPath + ("./OfficeFurniture/") + TextBox1.Text + ".jpg");
                        imagelink = "OfficeFurniture/" + TextBox1.Text + ".jpg";
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
                string query = "update Products set PName='"+TextBox1.Text+"',PPrice='"+TextBox3.Text+"',PQty='"+TextBox2.Text+"',PKeyword='"+TextBox5.Text+"',PCategory='"+ddl.SelectedValue.ToLower().ToString()+"',PImage='"+imagelink+"',RefundableDeposit='"+TextBox4.Text+"'where PName='"+TextBox1.Text+"'";          
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                Label1.Text = "Product Has Been Successfully Updated";
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            string mycon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ToString();
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            string query = "select Distinct p.PId,p.PName,p.PPrice,p.PCategory,p.RefundableDeposit,c.CityName,r.PQuantity,r.SoldOut from Products p,City c,ProductRef r where p.PName like('%"+txtsearch.Text+ "%') or  c.CityName like('%" + txtsearch.Text + "%') or p.PCategory like('%" + txtsearch.Text + "%')";
            cmd.CommandText = query;
            cmd.Connection = con;
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = cmd;
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

        

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
    }
}