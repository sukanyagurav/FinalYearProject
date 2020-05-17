<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="useravailable.aspx.cs" Inherits="RENTAL.useravailable" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<!DOCTYPE html>

<html>
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
<body>
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
   
           Format:
    <asp:RadioButtonList ID="rbFormat" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem Text="Word" Value="Word" Selected="True" />
        <asp:ListItem Text="Excel" Value="Excel" />
        <asp:ListItem Text="PDF" Value="PDF" />
        <asp:ListItem Text="CSV" Value="CSV" />
    </asp:RadioButtonList>
    <br />
    <asp:Button ID="btnExport" Text="Export" runat="server" OnClick="Export"  />
    
        <CR:CrystalReportViewer runat="server" AutoDataBind="true" ID="CrystalReportViewer1"/>
        </form>
    </body>
    </html>