using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using System.Configuration;

namespace RENTAL
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("ProductReport1",con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet dsProduct = new DataSet();
            sda.Fill(dsProduct);
            con.Close();
          CrystalReport3 crproduct = new CrystalReport3();
            crproduct.Database.Tables["orderaddress"].SetDataSource(dsProduct.Tables[0]);
            crproduct.Database.Tables["OrderDetails"].SetDataSource(dsProduct.Tables[0]);
            CrystalReportViewer1.ReportSource = null;
            CrystalReportViewer1.ReportSource = crproduct;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("ProductReport1", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet dsProduct = new DataSet();
            sda.Fill(dsProduct);
            con.Close();
            CrystalReport3 crproduct = new CrystalReport3();
            crproduct.Database.Tables["orderaddress"].SetDataSource(dsProduct.Tables[0]);
            crproduct.Database.Tables["OrderDetails"].SetDataSource(dsProduct.Tables[0]);
            CrystalReportViewer1.ReportSource = null;
            CrystalReportViewer1.ReportSource = crproduct;
        }
    }
}