<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="useravailable.aspx.cs" Inherits="RENTAL.useravailable" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <script src='<%=ResolveUrl("~/crystalreportviewers13/js/crviewer/crv.js")%>' type="text/javascript"></script>

</head>
<body>
    <form id="form1" runat="server">
           Format:
    <asp:RadioButtonList ID="rbFormat" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem Text="Word" Value="Word" Selected="True" />
        <asp:ListItem Text="Excel" Value="Excel" />
        <asp:ListItem Text="PDF" Value="PDF" />
        <asp:ListItem Text="CSV" Value="CSV" />
    </asp:RadioButtonList>
    <br />
    <asp:Button ID="btnExport" Text="Export" runat="server" OnClick="Export"  />
    
        <CR:CrystalReportViewer runat="server" AutoDataBind="true" BestFitPage="False" ToolPanelView="None"  ID="CrystalReportViewer1" />
    </form>
</body>
</html>
