<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RENTAL.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
    <link href="logincss.css" rel="stylesheet" />
<style>
    .lblemail{
        font-family:Verdana;
        font-size:22px;
    }
     .centered {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}


</style>
     
</head>
<body style="background-image: url(background.jpg);">
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
    <form runat="server">
   

                                                 
<div class="container centered" style="vertical-align: middle;">
    <div class="row">
        <div class="col-md-6 mx-auto">
    <div class="card centered">
        <div class="card-body" style="background-color:#FFDEAD;">
            <div class="row">
                <div class="col">
                    <center><h3>Login</h3>

                    </center>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <hr />
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <asp:Label id="Label3" runat="server" CssClass="lblemail">Enter Email address</asp:Label>
                   <br />  <div class="input-group">
                           <asp:TextBox CssClass="textbox" ID="email" runat="server" placeholder="Email ID" BorderStyle="None"></asp:TextBox>
                      <br />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="email"></asp:RequiredFieldValidator>
                                        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                                <br />
                      </div>
                </div>
            </div>
            <br />
            <br />
            <div class="row">
                <div class="col">

                   <label  class="lblemail"> Enter Password</label>
                    <div class="input-group">
                        <br />  <asp:TextBox CssClass="form-control" ID="txtpassword" runat="server" placeholder="Enter password" TextMode="Password"> </asp:TextBox>
                   
                        <div class="input-group-append"> 
                        <button id="show_password" class="btn btn-primary" type="button">  
                                <span class="fa fa-eye-slash icon"></span>  
                            </button>  
                           </div>   
                        <br />
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
                                   <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
                                     <br />
                        </div>
                </div>
            </div>
            <br />
           

            <div class="row">
                <div class="col">
                    <center>
              <asp:Button ID="Button2" runat="server" Text="Button" CssClass="btn btn-primary btn-lg align-content-center" OnClick="Button1_Click" />
            <asp:Label ID="verifyaccount" runat="server" Text="Label" Visible="False"></asp:Label>
             </center>
                        <br /> 
                </div>
            </div>
            <div class="row">
               <div class="col">
            <center>      <a href="SIGNUP.aspx">New User?</a>
         </center>       </div>
            </div>
            <div class="row">
                <div class="col">
                <center>      <a href="forgotpassword.aspx">Forgot your password?</a>
                        </center>          
                </div>
            </div>
        </div>
        </div>
            </div>
    </div>
</div>                              
                           
                                 
                                
                                
                                
                                
                                
                                
                                
                                
                               
      
       
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT * FROM [signup1]"></asp:SqlDataSource>
           

       </form>
  

</body>
</html>
