<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="RENTAL.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <style>
body {font-family: Arial, Helvetica, sans-serif;}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
#btn{
    top:0;
    left:0;
    position:absolute;
    width:110px;
    height:100%;
    background:linear-gradient(to right,#ff105f,#ffad06);
    border-radius:30px;
    transition:0.5s;

}
.form-box{
    width:400px;
    height:500px;
    position:relative;
    margin:6% auto;
    background:#fff;
    padding:5px;
    overflow:hidden;

}
.button-box{
    width:220px;
    margin:354px auto;
    position:relative;
    box-shadow:0 0 20px 9 px #ff61241f;
    border-radius:30px;
}
.toggle-button{
    padding:10px 30px;
    cursor:pointer;
    background:transparent;
    border:0;
    outline:none;
    position:relative;
}
.input-group{
    top:180px;
    position:absolute;
    width:280px;
    transition:0.5s;
}
#login{
    left:50px;
}
#regi{
    left:50px;
}
</style>
</head>
<body>
    
      <h2>Modal Example</h2>

<!-- Trigger/Open The Modal -->
<button id="myBtn">Open Modal</button>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
      <form id="form1" runat="server">
          
              <br />
              <br />
              <br />
          <div class="form-box">
              <div id="btn"></div>
              <div class="button-box">
                  <button   class="toggle-button" onclick="login()"/>

              </div>
         <div class="input-group">
             <div id="login">
            <asp:Label ID="Label1" runat="server" Text="Email address" CssClass="lblmail"></asp:Label>
             
            <asp:TextBox ID="email" runat="server" CssClass="txtmail" Placeholder="Enter Email"/>
            <br />
           <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
               <br />
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please a Enter a Email address !!!" ControlToValidate="email"></asp:RequiredFieldValidator>
            <br />
              
               
               <!--Password section-->
           <asp:Label ID="Label2" runat="server" Text="Enter Password" CssClass="lblpass"></asp:Label>
           <asp:TextBox ID="txtpassword" runat="server" CssClass="txtpass" TextMode="Password" Placeholder="***********"></asp:TextBox>
              <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter a Password !!!" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
           
              
              <br /><!--forgot password section--> <br />
               <asp:HyperLink ID="HyperLink2" runat="server" Text="Forgot password?"  CssClass="aforgort" NavigateUrl="forgot.aspx" ></asp:HyperLink>
               
           <br />
           <asp:Button ID="Button1" runat="server" Text="Log In" CssClass="btnsubmit" OnClick="Buttton1_click" />
          <br/>
           <asp:Label ID="lblreg" runat="server" Text="Don't have an account?" CssClass="lblreg ">
               <asp:HyperLink ID="HyperLink1" runat="server" Text="Register Here!" NavigateUrl="SIGNUP.aspx" CssClass="areg"></asp:HyperLink>
               </asp:Label>

           <br />
           <br />
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT * FROM [signup1]"></asp:SqlDataSource>
          </div>
</div>
              <div class="input-group">
                  <div id="regi">
                  <asp:Label ID="Label5" runat="server" Text="Enter your Name" CssClass="lblname"></asp:Label>
        <asp:TextBox ID="uname" runat="server" CssClass="txtname"></asp:TextBox><br />
        <asp:Label ID="Label6" runat="server" Text="Label" Visible="false"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter name" ControlToValidate="uname"></asp:RequiredFieldValidator>
       <br />
       <br />
         <asp:Label ID="Label7" runat="server" Text="Enter Mobile Number" CssClass="lblno"></asp:Label>
        <asp:TextBox ID="umobileno" runat="server" CssClass="txtno" MaxLength="10" TextMode="Phone"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter mobile number" ControlToValidate="umobileno"></asp:RequiredFieldValidator>
       <br />
         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="umobileno" ErrorMessage="Please enter correct mobile no" ValidationExpression="^([7-9]{1})([0-9]{9})$"></asp:RegularExpressionValidator>
         <br />
        <asp:Label ID="Label8" runat="server" Text="Enter Email address" CssClass="lblmail"></asp:Label>
        <asp:TextBox ID="uemail" runat="server" CssClass="txtmail" ></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter email address" ControlToValidate="uemail"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter valid email address" ControlToValidate="uemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />
        <asp:Label ID="Label9" runat="server" Text="Create a password" CssClass="lblpass"></asp:Label>'
        <asp:TextBox ID="upassword" runat="server" TextMode="Password" CssClass="txtpass"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please enter password" ControlToValidate="upassword"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Minimum password length is 8" ValidationExpression="^([a-zA-Z0-9@#$%^&amp;+=*]{8,15})$" ControlToValidate="upassword"></asp:RegularExpressionValidator>
        <br />
        <asp:Label ID="Label10" runat="server" Text="Confirmed password" CssClass="lblrpass"></asp:Label>
        <asp:TextBox ID="urepassword" runat="server" TextMode="Password" CssClass="txtpass"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Confirom password is required" ControlToValidate="urepassword"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password mismatch" ControlToCompare="upassword" ControlToValidate="urepassword"></asp:CompareValidator>
        <br />

        <br />
        <asp:Button ID="Button4" runat="server" Text="Sign In" OnClick="register" />
        <br />
        <asp:Label ID="msg" runat="server" Text="You are Successfully Registerd...!" Visible="False"></asp:Label>
        <br />
           </div>
                      </div>
       </div>

          </form>
  </div>

</div>

<script>
    // Get the modal
    var modal = document.getElementById("myModal");

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modal 
    btn.onclick = function () {
        modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
   <script>
       var x = document.getElementById("login");
       var y = document.getElementById("signup");
       var z = document.getElementById("btn");
       fuction.signup(){
           x.style.left = "-400px";
           y.style.left = "50px";
           z.style.left = "110px";
       }
       function.login(){
           x.style.left = "50px";
           y.style.left = "450px";
           z.style.left = "0";
       }
   </script>
</body>
</html>
