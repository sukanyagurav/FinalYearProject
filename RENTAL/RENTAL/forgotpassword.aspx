<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" Inherits="RENTAL.forgotpassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Enter email address"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><br /><asp:Label ID="Label3" runat="server" Visible="false"></asp:Label>
            <asp:Button ID="Button2" runat="server" Text="send" OnClick="Button2_Click" />
            
            <br />
            <asp:Label ID="Label2" runat="server" Text="Enter OTP "></asp:Label>
            <asp:TextBox ID="txtVerifyCode" runat="server"></asp:TextBox>
            <asp:Label ID="Label4" runat="server" Visible="false"></asp:Label>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Verify code" OnClick="Button1_Click" />
            
        </div>
    </form>
</body>
</html>
