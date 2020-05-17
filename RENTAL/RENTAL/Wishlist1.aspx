<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Wishlist1.aspx.cs" Inherits="RENTAL.Wishlist1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <br />
    <br />
    <br />
    <br />
    
    <br />
    
    
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText="No Reords Found">
        <Columns>
            <asp:BoundField DataField="PName" HeaderText="Name" />
            <asp:ImageField DataImageUrlField="PImage" HeaderText="Image">
            </asp:ImageField>
            <asp:BoundField DataField="RefundableDeposit " HeaderText="Refundable Deposit " />
        </Columns>
    </asp:GridView>
</asp:Content>
