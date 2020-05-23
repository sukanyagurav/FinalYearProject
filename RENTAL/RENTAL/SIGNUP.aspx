<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SIGNUP.aspx.cs" Inherits="RENTAL.SIGNUP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <style>
      
        .centered {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
        
    </style>
</head>
<body style="background-image: url(background.jpg);">
 
   
 
    <form id="form1" runat="server">
        <div class="container centered" style="vertical-align: middle;" >
  
           <div class="row">
            <div class="col-md-6 ">
                <center>
                    <div class="card centered">
                        <div class="card-body"  style="background-color:#FFDEAD;">
                          <div class="row">
                              <div class="col"> 
                                  <center>  <h2>Sign Up Here </h2></center>
                                 </div>
                           </div>
      <br />
                            <div class="row">
                                <div class="col">
                                   <asp:Label ID="Label1" runat="server" Text="Enter your Name" CssClass="lblname"></asp:Label>
                                   <asp:TextBox ID="uname" runat="server" CssClass="txtname"></asp:TextBox><br />
                                   <asp:Label ID="Label6" runat="server" Text="Label" Visible="false"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter name" ControlToValidate="uname"></asp:RequiredFieldValidator>
                                    </div>
                            </div>
         <br />
       <br />
                            <div class="row">
                                <div class="col">
                                 <asp:Label ID="Label2" runat="server" Text="Enter Mobile Number" CssClass="lblno"></asp:Label>
                                  <asp:TextBox ID="umobileno" runat="server" CssClass="txtno" MaxLength="10" TextMode="Phone"></asp:TextBox><br />
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter mobile number" ControlToValidate="umobileno"></asp:RequiredFieldValidator>
                                <br />
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="umobileno" ErrorMessage="Please enter correct mobile no" ValidationExpression="^([7-9]{1})([0-9]{9})$"></asp:RegularExpressionValidator>
                                <br />
                            </div>
      </div>
            <div class="row">
                <div class="col">
                                    <asp:Label ID="Label3" runat="server" Text="Enter Email address" CssClass="lblmail"></asp:Label>
        <asp:TextBox ID="uemail" runat="server" CssClass="txtmail" ></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter email address" ControlToValidate="uemail"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter valid email address" ControlToValidate="uemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>
      </div>
                    <br />
                            <div class="row">
                <div class="col">
        <asp:Label ID="Label4" runat="server" Text="Create a password" CssClass="lblpass"></asp:Label>'
        <asp:TextBox ID="upassword" runat="server" TextMode="Password" CssClass="txtpass"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter password" ControlToValidate="upassword"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Minimum password length is 8" ValidationExpression="^([a-zA-Z0-9@#$%^&amp;+=*]{8,15})$" ControlToValidate="upassword"></asp:RegularExpressionValidator>
         </div>
      </div>
                    <br />
                             <div class="row">
                <div class="col">
        <asp:Label ID="Label5" runat="server" Text="Confirmed password" CssClass="lblrpass"></asp:Label>
        <asp:TextBox ID="urepassword" runat="server" TextMode="Password" CssClass="txtpass"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Confirom password is required" ControlToValidate="urepassword"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password mismatch" ControlToCompare="upassword" ControlToValidate="urepassword"></asp:CompareValidator>
     </div>
      </div>
                    <br />

        <br />
                              <div class="row">
                <div class="col">
        <asp:Button ID="Button1" runat="server" Text="Sign In" OnClick="Button1_Click" />
        <br />
        <asp:Label ID="msg" runat="server" Text="You are Successfully Registerd...!" Visible="False"></asp:Label>
        <br />

    
                                  </div>
                               </div>
                            <div class="row">
                <div class="col">
                    <a href="Login.aspx">Log In?</a>
                               </div>

                             </div>
                         </div>
                   
                 </div>
                     </center>
                </div>
             </div>
            </div>
    </form>
             
 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT * FROM [signup1]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
        <br />
        
</body>
</html>
