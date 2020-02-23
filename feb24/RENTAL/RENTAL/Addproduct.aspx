<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Addproduct.aspx.cs" Inherits="RENTAL.Addproduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Add Product Page</h1>
        <div>
            <asp:Label ID="Pname" runat="server" Text="Product Name"></asp:Label>
            <asp:TextBox ID="txtpname" runat="server"></asp:TextBox><br />

            <asp:Label ID="PPrice" runat="server" Text="Product Price"></asp:Label>
            <asp:TextBox ID="txtprice" runat="server"></asp:TextBox><br />

            <asp:Label ID="Quantity" runat="server" Text="Product Quantity"></asp:Label>
            <asp:TextBox ID="txtqty" runat="server"></asp:TextBox><br />

            <asp:Label ID="Pkeyword" runat="server" Text="Product Keyword"></asp:Label>
            <asp:TextBox ID="txtkeyword" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <br />

            <asp:Label ID="Pcategory" runat="server" Text="Product Category"></asp:Label>
            <asp:DropDownList ID="ddl" runat="server">
                <asp:ListItem>Bedroom</asp:ListItem>
                <asp:ListItem>Livingroom</asp:ListItem>
                <asp:ListItem>StudyRoom</asp:ListItem>
                <asp:ListItem>DinningRoom</asp:ListItem>
                <asp:ListItem>Storage</asp:ListItem>
                <asp:ListItem>OfficeFurniture</asp:ListItem>
                <asp:ListItem>Appliance</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <br />

            <asp:Label ID="PImage" runat="server" Text="Product Image"></asp:Label>
            <asp:FileUpload ID="f1" runat="server" />
            <br />
            <asp:Label ID="Label4" runat="server"></asp:Label>
            <br />

            <asp:Label ID="Refundatble" runat="server" Text="Refundable Deposit of product"></asp:Label>
            <asp:TextBox ID="txtrefunddeposit" runat="server"></asp:TextBox><br />

            <br />

            <asp:Button ID="btnupload" runat="server" Text="Upload" OnClick="btnupload_Click" />
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
        
    </form>
</body>
</html>
