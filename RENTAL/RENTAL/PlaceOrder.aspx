<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="RENTAL.PlaceOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <asp:Label ID="Label1" runat="server" Text="Order Id"></asp:Label>
    <asp:Label ID="Label3" runat="server" ></asp:Label>

    <br />

    <asp:Label ID="Label2" runat="server" Text="Order Date"></asp:Label>
    <asp:Label ID="Label4" runat="server" ></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True">
         <Columns>
                      <asp:BoundField DataField="sno" HeaderText="srno" />
                    <asp:BoundField DataField="PId" HeaderText="ProductId" />

                    <asp:BoundField DataField="PName" HeaderText="ProductName" />
                    <asp:ImageField DataImageUrlField="PImage" HeaderText="Product image" ItemStyle-Width="200" ItemStyle-Height="100">
<ItemStyle Height="100px" Width="200px"></ItemStyle>
                    </asp:ImageField>
                     <asp:BoundField DataField="month" HeaderText="Month" />
                    <asp:BoundField DataField="PPrice" HeaderText="Price" />
                    <asp:BoundField DataField="totalprice" HeaderText="Total price" />
                     <asp:BoundField DataField="quantity1" HeaderText="Quantity" SortExpression="quantity1" />
            
                     
                </Columns>
                <EditRowStyle Height="50px" />
                <HeaderStyle Height="50px" />
    </asp:GridView>
    <br />
    <br />
    <asp:Label ID="Label8" runat="server" Text="Address"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine"></asp:TextBox>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:Label ID="Label9" runat="server" Text="City"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox3" runat="server" ></asp:TextBox>
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:Label ID="Label5" runat="server" Text="Mobile number"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Check Out" OnClick="Button1_Click" />

</asp:Content>
