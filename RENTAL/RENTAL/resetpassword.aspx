<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resetpassword.aspx.cs" Inherits="RENTAL.resetpassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            &nbsp;
            <asp:Label ID="Label1" runat="server" Text="Enter Password"></asp:Label>
&nbsp;<asp:TextBox ID="txtpass" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server" Text="Enter Confirm Password"></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="txtpassconfirm" runat="server"></asp:TextBox><br />
            <asp:Button ID="Restpass" runat="server" Text="Reset" OnClick="Restpass_Click" />
            <asp:Label ID="Label3" runat="server" Visible="false"></asp:Label>
            </div>
    </form>
</body>
</html>
