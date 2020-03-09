<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="RENTAL.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet2.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
       <div class="hero">
           <div class="form-box">
                <div class="button-box">

                    <div id="btn"></div>

                    <button type="button" class="toggle-btn" onclick="login()">Login</button>
                    
                    <button type="button" class="toggle-btn" onclick="register()">Register</button>
                    
                    
                        </div>
               <div class="input-group" id="login">
                     <asp:Label ID="Label1" runat="server" Text="Enter a Email"></asp:Label>
                   <asp:TextBox ID="email" runat="server"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter email address!!!" ControlToValidate="email"></asp:RequiredFieldValidator>
                   <asp:Label ID="Label3" runat="server" Text="Label" Visible="false"></asp:Label>
                  <br />
                   
                   <asp:Label ID="Label2" runat="server" Text="Enter a Password"></asp:Label>
                   <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter your password!!!!" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
                   <asp:Label ID="Label4" runat="server" Text="Label" Visible="false"></asp:Label>
                   <br />

                   <asp:Button ID="Button3" runat="server" Text="Button" CssClass="submit-btn" OnClick="Button1_Click" />
                    <asp:Label ID="verifyaccount" runat="server" Text="Label" Visible="False"></asp:Label>
                   <br /> 
                   <a href="#forgot">Forgot your password?</a>
                   </div>
             <div class="input-group" id="register">
                 <asp:Label ID="Label5" runat="server" Text="Enter Your name" CssClass="col-sm-2 control-label"></asp:Label>
                    <asp:TextBox ID="uname" runat="server" CssClass="form-control"></asp:TextBox>
                           <asp:Label ID="Label11" runat="server" Text="Label" Visible="false"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please enter name" ControlToValidate="uname"></asp:RequiredFieldValidator>
       <br />     

                   <asp:Label ID="Label6" runat="server" Text="Enter Email address" CssClass="col-sm-2 control-label"></asp:Label>
                        <asp:TextBox ID="uemail" runat="server" CssClass="form-control"></asp:TextBox>
                       <asp:Label ID="Label10" runat="server" Text="Label" Visible="false"></asp:Label>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter email address" ControlToValidate="uemail"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter valid email address" ControlToValidate="uemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />

                      <asp:Label ID="Label7" runat="server" Text="Enter Mobile Number" CssClass="col-sm-2 control-label"></asp:Label>
                          <asp:TextBox ID="umobileno" runat="server" CssClass="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter mobile number" ControlToValidate="umobileno"></asp:RequiredFieldValidator>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter name" ControlToValidate="uname"></asp:RequiredFieldValidator>
         <br />
         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="umobileno" ErrorMessage="Please enter correct mobile no" ValidationExpression="^([7-9]{1})([0-9]{9})$"></asp:RegularExpressionValidator>
         <br />

                      <asp:Label ID="Label8" runat="server" Text="Enter a Password " CssClass="col-sm-2 control-label"></asp:Label>
                             <asp:TextBox ID="upassword" runat="server" CssClass="form-control"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please enter password" ControlToValidate="upassword"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Minimum password length is 8" ValidationExpression="^([a-zA-Z0-9@#$%^&amp;+=*]{8,15})$" ControlToValidate="upassword"></asp:RegularExpressionValidator>
        <br />          

                  <asp:Label ID="Label9" runat="server" Text="Enter Confirmed password" CssClass="col-sm-2 control-label"></asp:Label>
                       <asp:TextBox ID="urepassword" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Confirom password is required" ControlToValidate="urepassword"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password mismatch" ControlToCompare="upassword" ControlToValidate="urepassword"></asp:CompareValidator>
        <br />         

                  <asp:Button ID="Button4" runat="server" Text="Button" OnClick="signup_click" />
                                    

                 <asp:Label ID="msg" runat="server" Text="You are Successfully Registerd...!" Visible="False"></asp:Label>
      
             </div>
           </div>
       </div>

 

            <script>
                var x = document.getElementById("login");
                var y = document.getElementById("register");
                var z = document.getElementById("btn");
                function register() {
                    x.style.left = "-400px";
                    y.style.left = "50px";
                    z.style.left = "110px";
                }
                function login() {
                    x.style.left = "50px";
                    y.style.left = "450px";
                    z.style.left = "0";
                }
            </script>
               
    </form>
</body>
</html>
