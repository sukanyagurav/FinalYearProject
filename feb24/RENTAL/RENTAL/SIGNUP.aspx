<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SIGNUP.aspx.cs" Inherits="RENTAL.SIGNUP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body>
 
    <div class="loginbox">
        
        <h2>Sign Up Here </h2>
      <br />
 
    <form id="form1" runat="server">
       
        <asp:Label ID="Label1" runat="server" Text="Enter your Name" CssClass="lblname"></asp:Label>
        <asp:TextBox ID="uname" runat="server" CssClass="txtname"></asp:TextBox><br />
        <asp:Label ID="Label6" runat="server" Text="Label" Visible="false"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter name" ControlToValidate="uname"></asp:RequiredFieldValidator>
       <br />
       <br />
         <asp:Label ID="Label2" runat="server" Text="Enter Mobile Number" CssClass="lblno"></asp:Label>
        <asp:TextBox ID="umobileno" runat="server" CssClass="txtno" MaxLength="10" TextMode="Phone"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter mobile number" ControlToValidate="umobileno"></asp:RequiredFieldValidator>
       <br />
         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="umobileno" ErrorMessage="Please enter correct mobile no" ValidationExpression="^([7-9]{1})([0-9]{9})$"></asp:RegularExpressionValidator>
         <br />
        <asp:Label ID="Label3" runat="server" Text="Enter Email address" CssClass="lblmail"></asp:Label>
        <asp:TextBox ID="uemail" runat="server" CssClass="txtmail" ></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter email address" ControlToValidate="uemail"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter valid email address" ControlToValidate="uemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Create a password" CssClass="lblpass"></asp:Label>'
        <asp:TextBox ID="upassword" runat="server" TextMode="Password" CssClass="txtpass"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter password" ControlToValidate="upassword"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Minimum password length is 8" ValidationExpression="^([a-zA-Z0-9@#$%^&amp;+=*]{8,15})$" ControlToValidate="upassword"></asp:RegularExpressionValidator>
        <br />
        <asp:Label ID="Label5" runat="server" Text="Confirmed password" CssClass="lblrpass"></asp:Label>
        <asp:TextBox ID="urepassword" runat="server" TextMode="Password" CssClass="txtpass"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Confirom password is required" ControlToValidate="urepassword"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password mismatch" ControlToCompare="upassword" ControlToValidate="urepassword"></asp:CompareValidator>
        <br />

        <br />
        <asp:Button ID="Button1" runat="server" Text="Sign In" OnClick="Button1_Click" />
        <br />
        <asp:Label ID="msg" runat="server" Text="You are Successfully Registerd...!" Visible="False"></asp:Label>
        <br />
       
    </form>
             
 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT * FROM [signup1]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
        <br />
        </div>
</body>
</html>
