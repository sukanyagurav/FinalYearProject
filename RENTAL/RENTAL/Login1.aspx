<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login1.aspx.cs" Inherits="RENTAL.WebForm1" %>

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
	    <script type="text/javascript">  
        $(document).ready(function () {  
            $('#show_password').hover(function show() {  
                //Change the attribute to text  
                $('#txtpassword').attr('type', 'text');  
                $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');  
            },  
            function () {  
                //Change the attribute back to password  
                $('#txtpassword').attr('type', 'password');  
                $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');  
            });  
            
        });  
    </script>  
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" runat="server">
					<span class="login100-form-title p-b-43">
						Login to continue
					</span>
					
					
					
					<div class="wrap-input100  m-b-16" >
						
                        <asp:TextBox ID="email"  class="input100" name="email" placeholder="Email" runat="server"></asp:TextBox>
						
						<span class="focus-input100"></span>
				        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  display="Dynamic" runat="server" ErrorMessage="Enter User Name"  forecolor="Red"  ControlToValidate="email"></asp:RequiredFieldValidator>
                       <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
                           
						
					</div>
				<br />
					<br />
					<div class="wrap-input100 " >
                       	          
                          <asp:TextBox class="input100" ID="txtpassword" runat="server" placeholder="Password"    TextMode="Password"> </asp:TextBox>
					<span class="focus-input100"></span>

						<span class="btn-show-pass">
												
						<i id="show_password" style="position:absolute; top:10px;">  
                                <span class="fa fa-eye-slash icon right" style="top: 0;right: 25px;position:absolute;top:18px;"></span>  
                            
					 </i>        
							</span>
					
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  display="Dynamic" runat="server" ErrorMessage="Enter Password" forecolor="Red" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
                                   <asp:Label ID="Label4" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
                                     <br />
                       
						</div>
	           
					
			<br />
					<br />
					<div class="flex-sb-m w-full p-t-3 p-b-32">
						
						<div>
							<a href="forgotpassword.aspx" class="txt1">
								Forgot Password?
							</a>
						</div>
					</div>
			

					<div class="container-login100-form-btn">
						<asp:Button ID="Button2" runat="server"   class="login100-form-btn" Text="Login" OnClick="Button1_Click" />
                         <asp:Label ID="verifyaccount" runat="server" Text="Label" Visible="False"></asp:Label>
            		</div>
					
					<div class="text-center p-t-46 p-b-20">
						<span class="txt2">
							or sign up using
						</span>
					</div>

					<div class="login100-form-social flex-c-m">
						<a href="#" class="login100-form-social-item flex-c-m bg1 m-r-5">
							<i class="fa fa-facebook-f" aria-hidden="true"></i>
						</a>

						<a href="#" class="login100-form-social-item flex-c-m bg2 m-r-5">
							<i class="fa fa-twitter" aria-hidden="true"></i>
						</a>
					</div>
				</form>

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
