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
    public partial class WebForm10 : System.Web.UI.Page
    {
        static ReportDocument crystal ;

        protected void Page_Load(object sender, EventArgs e)
        {
            crystal = new ReportDocument();
                crystal.Load(@"G:/suku html/RENTAL/RENTAL/stockdetails.rpt");
       
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

            crystal.ExportToHttpResponse(formatType, Response, true, "StockReport");
            Response.End();
        }
    }
}