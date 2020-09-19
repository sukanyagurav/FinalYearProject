<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="RENTAL.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
 
    
      <div class="container-fluid">
                 <div class="card" >
                 <div class="card-body"><center>
    <asp:GridView ID="GridView1" Height="146px" Width="1000px" CellSpacing="30" GridLines="Horizontal" CellPadding="20" BorderStyle="Dashed" Font-Bold="True" Font-Names="Verdana" Font-Size="X-Large" EmptyDataText="No Records Found" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand">
        <Columns>
         
            <asp:BoundField DataField="PName" HeaderText="Name" >
            <HeaderStyle Font-Bold="True" Font-Names="Verdana" Font-Size="Medium" />
                      <ItemStyle Font-Bold="False" Font-Names="Verdana" Font-Size="Medium" />
              </asp:BoundField>
            
            <asp:ImageField DataImageUrlField="PImage" HeaderText="Image">
           <HeaderStyle Font-Bold="True" Font-Names="Verdana" Font-Size="Medium" />
             <ItemStyle Height="100px" Width="100px"></ItemStyle>
                  
                </asp:ImageField>
            <asp:BoundField DataField="RefundableDeposit" HeaderText="Refundable Deposit">
         <HeaderStyle Font-Bold="True" Font-Names="Verdana" Font-Size="Medium" />
                      <ItemStyle Font-Names="Verdana" Font-Size="Medium" />
                      </asp:BoundField>
        
           
            <asp:ButtonField CommandName="Delete Row" Text="Remove" />
        
           
            <asp:BoundField DataField="PId" HeaderText="Id" Visible="false" />
        
           
        </Columns>
    </asp:GridView>
                     </center>
                     </div>
                     </div>
          </div>
</asp:Content>
