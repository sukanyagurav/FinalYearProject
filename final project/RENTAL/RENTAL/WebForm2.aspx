<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="RENTAL.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
	<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="LOGIN?/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="LOGIN/vendor/bootstrap/css/bootstrap.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="LOGIN/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="LOGIN/fonts/Linearicons-Free-v1.0.0/icon-font.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="LOGIN/vendor/animate/animate.css"/>
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="LOGIN/vendor/css-hamburgers/hamburgers.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="LOGIN/vendor/animsition/css/animsition.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="LOGIN/vendor/select2/select2.min.css"/>
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="LOGIN/vendor/daterangepicker/daterangepicker.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="LOGIN/css/util.css"/>
	<link rel="stylesheet" type="text/css" href="LOGIN/css/main.css"/>
<!--===============================================================================================-->
	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  

</head>
<body style="background-color: #666666;">
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" runat="server">
					<span class="login100-form-title p-b-43">
					    Signin to continue
					</span>
					
					<div class="wrap-input100  m-b-16" >
						 <asp:TextBox ID="uname" class="input100" runat="server" placeholder="Name"></asp:TextBox>
                                   <asp:Label ID="Label6" runat="server" Text="Label" Visible="false"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" display="Dynamic" runat="server" ErrorMessage="Please enter name" ControlToValidate="uname" forecolor="Red"></asp:RequiredFieldValidator>
               						<span class="focus-input100"></span>
					</div>
				<br />

					<div class="wrap-input100 " >
                       	 <asp:TextBox ID="umobileno" class="input100" runat="server"  placeholder="Mobile Number" MaxLength="10" TextMode="Phone"></asp:TextBox>
                         <span class="focus-input100"></span>
      					 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter mobile number" ControlToValidate="umobileno" forecolor="Red"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" forecolor="Red" ControlToValidate="umobileno" ErrorMessage="Please enter correct mobile no" ValidationExpression="^([7-9]{1})([0-9]{9})$"></asp:RegularExpressionValidator>
					</div>         			
			<br />
			      <div class="wrap-input100 " >
				     <asp:TextBox ID="uemail" runat="server" class="input100"   placeholder="Email" ></asp:TextBox>                     <span class="focus-input100"></span>
				     <span class="focus-input100"></span>
					 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" forecolor="Red" runat="server" ErrorMessage="Please enter email address" ControlToValidate="uemail"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" forecolor="Red" ErrorMessage="Please enter valid email address" ControlToValidate="uemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

			      </div>
			<br />
				<div class="wrap-input100">
	    	        <asp:TextBox ID="upassword" runat="server" class="input100" TextMode="Password" placeholder="Password"></asp:TextBox><br />
					<asp:RequiredFieldValidator ID="RequiredFieldValidator4" forecolor="Red" runat="server" ErrorMessage="Please enter password" ControlToValidate="upassword"></asp:RequiredFieldValidator>
					<asp:RegularExpressionValidator ID="RegularExpressionValidator2" forecolor="Red" runat="server" ErrorMessage="Minimum password length is 8" ValidationExpression="^([a-zA-Z0-9@#$%^&amp;+=*]{8,15})$" ControlToValidate="upassword"></asp:RegularExpressionValidator>
				</div>
			<br />
					<div class="wrap-input100">
					  <asp:TextBox ID="urepassword" runat="server" class="input100" TextMode="Password" placeholder="Confirmed Password"></asp:TextBox><br />
					  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" forecolor="Red" runat="server" ErrorMessage="Confirom password is required" ControlToValidate="urepassword"></asp:RequiredFieldValidator>
				      <asp:CompareValidator ID="CompareValidator1" runat="server" forecolor="Red" ErrorMessage="Password mismatch" ControlToCompare="upassword" ControlToValidate="urepassword"></asp:CompareValidator> 			
				    </div>
					<br />
					<br />
					<br />
					<div class="container-login100-form-btn">
						<asp:Button ID="Button2" runat="server"   class="login100-form-btn" Text="Sign In" OnClick="Button1_Click" />
                         <asp:Label ID="verifyaccount" runat="server" Text="Label" Visible="False"></asp:Label>
            		</div>
					<br />
					<br />
					<div class="flex-sb-m w-full p-t-3 p-b-32">
						
						<div>
							<a href="Login1.aspx" class="txt1">
							  Already User?
							</a>
						</div>
					</div>
				</form>
				<br />

				<div class="login100-more" style="background-image: url('LOGIN/images/bg-02.jpg');">
				</div>
			</div>
		</div>
</div>

	
	

	
	
<!--===============================================================================================-->
	<script src="LOGIN/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="LOGIN/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="LOGIN/vendor/bootstrap/js/popper.js"></script>
	<script src="LOGIN/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="LOGIN/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="LOGIN/vendor/daterangepicker/moment.min.js"></script>
	<script src="LOGIN/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="LOGIN/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="LOGIN/js/main.js"></script>

</body>



</html>
