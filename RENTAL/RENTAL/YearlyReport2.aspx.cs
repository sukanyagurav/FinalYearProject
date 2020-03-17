using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
namespace RENTAL
{
    public partial class YearlyReport2 : System.Web.UI.Page
    {
        static ReportDocument crystal = new ReportDocument();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("select * from City", con);
                con.Open();
                DropDownList1.DataSource = cmd.ExecuteReader();

                DropDownList1.DataTextField = "CityName";
                DropDownList1.DataValueField = "CityId";
                DropDownList1.DataBind();
                con.Close();
                DropDownList1.Items.Insert(0, new ListItem("All", "0"));
            }
        }
        protected void Button1_Click1(object sender, EventArgs e)
        {
            string pathToDocument ="G:/suku html/RENTAL/RENTAL/YearlyReport1.rpt";

            crystal.Load(pathToDocument);

            int yearid = Convert.ToInt32(DropDownList2.SelectedValue);
            string cityname = DropDownList1.SelectedItem.Text;
            crystal.SetParameterValue("yearid", yearid);


            crystal.SetParameterValue("cityname", cityname);

            CrystalReportViewer1.ReportSource = crystal;

        }
        protected void Export(object sender, EventArgs e)
        {


            ExportFormatType formatType = ExportFormatType.NoFormat;
            switch (rbFormat.SelectedItem.Value)
            {
                case "Word":
                    formatType = ExportFormatType.WordForWindows;
                    break;
                case "PDF":
                    formatType = ExportFormatType.PortableDocFormat;
                    break;
                case "Excel":
                    formatType = ExportFormatType.Excel;
                    break;
                case "CSV":
                    formatType = ExportFormatType.CharacterSeparatedValues;
                    break;
            }

            crystal.ExportToHttpResponse(formatType, Response, true, "G:/suku html/RENTAL/RENTAL/Reoirt");
            Response.End();
        }
    }
}