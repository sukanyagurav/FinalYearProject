﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonthlyReport.aspx.cs" Inherits="RENTAL.WebForm8" %>


<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <link href="Admincss.css" rel="stylesheet" />
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
  
    <script src='<%=ResolveUrl("~/crystalreportviewers13/js/crviewer/crv.js")%>' type="text/javascript"></script>

    </head>
<body style="background-color:gainsboro;">
    <form id="form1" runat="server">
           <div class="wrapper">
             <div id="nav">

             
                <img src="images/logo1.JPG" height="100" width="200"/>
                
                   <ul>
                        <li><a href="Home.aspx">Home</a></li>
                       <li><a href="AdminHome.aspx">Admin Home</a></li>
                   <li><a href="Adminaddproducts.aspx">Add Products</a></li>
                   <li><a href="AdminQuery.aspx" >Admin Query</a></li>
                   <li><a href="Send user gmail.aspx">Send mail</a></li>
                   <li><a href="Remove user.aspx">Remove User</a></li>
                  <li><a href="#">View Reports</a>
                      <ul>
                          <li><a href="MonthlyReport.aspx">Monthly Report</a></li>
                          <li><a href="YearlyReport2.aspx">Yearly Report</a></li>
                          <li><a href="useravailable.aspx">User available</a></li>
                      <li><a href="Stockreport.aspx">Stock Report</a></li>
                      </ul>
                  </li>
                      
                   </ul>
                 </div>
            
           </div> 
   

        <label>Select  Month</label>

        <asp:DropDownList ID="DropDownList1" runat="server" >
            <asp:ListItem Selected="True" Value="1">Jan</asp:ListItem>
            <asp:ListItem Value="2">Feb</asp:ListItem>
            <asp:ListItem Value="3">Mar</asp:ListItem>
            <asp:ListItem Value="4">Apr</asp:ListItem>
            <asp:ListItem Value="5">May</asp:ListItem>
            <asp:ListItem Value="6">June</asp:ListItem>
            <asp:ListItem Value="7">Jul</asp:ListItem>
            <asp:ListItem Value="8">Aug</asp:ListItem>
            <asp:ListItem Value="9">Sept</asp:ListItem>
            <asp:ListItem Value="10">Oct</asp:ListItem>
            <asp:ListItem Value="11">Nov</asp:ListItem>
            <asp:ListItem Value="12">Dec</asp:ListItem>
        </asp:DropDownList>
   <label>Select City</label>
        <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="Load Report" OnClick="Button1_Click" />
&nbsp;<br />

        Format:
    <asp:RadioButtonList ID="rbFormat" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem Text="Word" Value="Word" Selected="True" />
        <asp:ListItem Text="Excel" Value="Excel" />
        <asp:ListItem Text="PDF" Value="PDF" />
        <asp:ListItem Text="CSV" Value="CSV" />
    </asp:RadioButtonList>
    <br />
    <asp:Button ID="btnExport" Text="Export" runat="server" OnClick="Export"  />
    

        &nbsp;<CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True"  BorderColor="#3399FF" BorderStyle="Solid" DisplayStatusbar="False" DisplayToolbar="False" BestFitPage="False" ToolPanelView="None" />
  </form>
</body>
</html>
