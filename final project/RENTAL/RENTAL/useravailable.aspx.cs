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
    public partial class useravailable : System.Web.UI.Page
    {
        static ReportDocument crystal = new ReportDocument();

        protected void Page_Load(object sender, EventArgs e)
        {
            
            crystal.Load(@"G:/suku html/RENTAL/RENTAL/available_user.rpt");
            
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

            crystal.ExportToHttpResponse(formatType, Response, true, "G:/suku html/RENTAL/RENTAL/User");
            Response.End();
        }
    }
}