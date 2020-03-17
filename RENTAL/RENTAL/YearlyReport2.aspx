﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YearlyReport2.aspx.cs" Inherits="RENTAL.YearlyReport2" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     
    <script src='<%=ResolveUrl("~/crystalreportviewers13/js/crviewer/crv.js")%>' type="text/javascript"></script>

</head>
<body>
    <form id="form1" runat="server">
       
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="Column1" DataValueField="Column1"></asp:DropDownList>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="year_report" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

        <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList><asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click1" />

            Format:
    <asp:RadioButtonList ID="rbFormat" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem Text="Word" Value="Word" Selected="True" />
        <asp:ListItem Text="Excel" Value="Excel" />
        <asp:ListItem Text="PDF" Value="PDF" />
        <asp:ListItem Text="CSV" Value="CSV" />
    </asp:RadioButtonList>
    <br />
    <asp:Button ID="btnExport" Text="Export" runat="server" OnClick="Export"  />
    
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />

    </form>
</body>
</html>
