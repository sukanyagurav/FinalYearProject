<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="RENTAL.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<hr />
    <div >
        <asp:Label ID="lbname" runat="server" Text="Enter your name"></asp:Label>
        <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Enter your gmail"></asp:Label>
        <asp:TextBox ID="txtgmail" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lbquery" runat="server" Text="Enter your Query"></asp:Label>
        <asp:TextBox ID="txtquery" runat="server" Height="78px" TextMode="MultiLine" Width="184px"></asp:TextBox>
        <br />
        <asp:Button ID="btnregister" runat="server" Text="Submit" OnClick="btnregister_Click" />
    </div>
</asp:Content>
