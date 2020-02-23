<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="RENTAL.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
            height: 226px;
        }
        .auto-style4 {
            height: 38px;
            text-align: center;
        }
        .auto-style5 {
            height: 51px;
        }
        .auto-style6 {
            height: 45px;
            text-align: center;
        }
        .auto-style7 {
            text-align: center;
        }
        .auto-style8 {
            margin-right: 244;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />


    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("PImage") %>' />
            <br />
            <br />
        </ItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FURNITUREConnectionString2 %>" SelectCommand="SELECT [PName], [PPrice], [PImage] FROM [Products]"></asp:SqlDataSource>
</asp:Content>
