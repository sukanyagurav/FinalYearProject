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
using CrystalDecisions.Shared;
namespace RENTAL
{
    public partial class WebForm8 : System.Web.UI.Page
    {

          static ReportDocument crystal=new ReportDocument();
        protected void Page_Load(object sender, EventArgs e)
        {
       
            if (!IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("select * from City", con);
                con.Open();
                DropDownList2.DataSource = cmd.ExecuteReader();

                DropDownList2.DataTextField = "CityName";
                DropDownList2.DataValueField = "CityId";
                DropDownList2.DataBind();
                con.Close();
                DropDownList2.Items.Insert(0, new ListItem("All", "0"));
            }
       
        }


        

        protected void Button1_Click(object sender, EventArgs e)
        {
            string pathToDocument = "G:/suku html/RENTAL/RENTAL/MonthlyReport.rpt";
            
            crystal.Load(pathToDocument);
                    int str = Convert.ToInt32(DropDownList1.SelectedValue);           
            string str3 = DropDownList1.SelectedItem.ToString();
           string cityname = DropDownList2.SelectedItem.Text;
           crystal.SetParameterValue("monthname", str3);
           crystal.SetParameterValue("month", str);
           crystal.SetParameterValue("cityname", cityname);
          



              CrystalReportViewer1.ReportSource = crystal;
            CrystalReportViewer1.DataBind();
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