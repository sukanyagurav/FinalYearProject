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
    public partial class ViewProfile : System.Web.UI.Page
    {
        String mycon = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        { 
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            string str = "select * from Users where Email='sukanyagurav6@gmail.com'";
           SqlCommand cmd = new SqlCommand(str, con);
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = cmd;
            DataSet ds = new DataSet();
            sda.Fill(ds);
            TextBox1.Text = ds.Tables[0].Rows[0]["Username"].ToString();
            TextBox2.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            TextBox3.Text = ds.Tables[0].Rows[0]["Mobileno"].ToString();
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            Label1.Text = ds.Tables[0].Rows[0]["Account_status"].ToString();
            str = "select PName,PPrice,Quantity,DateOfOrder,Month,ReturnDate from OrderDetails where username='sukanyagurav6@gmail.com'";
            cmd = new SqlCommand(str,con);
            sda = new SqlDataAdapter();
            sda.SelectCommand = cmd;
               ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
         SqlConnection   con = new SqlConnection(mycon);
            con.Open();
            string str = "select * from Users where Email='sukanyagurav6@gmail.com'";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = cmd;
            DataSet ds = new DataSet();
            sda.Fill(ds);
            TextBox1.Text = ds.Tables[0].Rows[0]["Username"].ToString();
            TextBox2.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            TextBox3.Text = ds.Tables[0].Rows[0]["Mobileno"].ToString();

        }

    }
}