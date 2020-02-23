<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="RENTAL.AddtoCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Bed.aspx">continue </asp:HyperLink>
            <br />
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">LinkButton</asp:LinkButton>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" ShowFooter="True">
                <Columns>
                      <asp:BoundField DataField="sno" HeaderText="srno" />
                    <asp:BoundField DataField="PId" HeaderText="ProductId" />

                    <asp:BoundField DataField="PName" HeaderText="ProductName" />
                    <asp:ImageField DataImageUrlField="PImage" HeaderText="Product image">
                    </asp:ImageField>
                     <asp:BoundField DataField="month" HeaderText="Month" />
                    <asp:BoundField DataField="PPrice" HeaderText="Price" />
                    <asp:BoundField DataField="totalprice" HeaderText="Total price" />
                     <asp:BoundField DataField="quantity1" HeaderText="Quantity" SortExpression="quantity1" />
                  
                    
                    <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" />
                  
                     
                </Columns>
                <EditRowStyle Height="50px" />
                <HeaderStyle Height="50px" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
