<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm8.aspx.cs" Inherits="RENTAL.WebForm8" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script type="text/javascript" src="/crystalreportviewers13/js/crviewer/crv.js">
      </script> 
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <br />
        <br />
        <br />
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />

    </form>
</body>
</html>
