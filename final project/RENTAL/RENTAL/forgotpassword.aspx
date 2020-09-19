<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" Inherits="RENTAL.forgotpassword" %>

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
width:360px;
height:400px;


}
     .txtb{
         border-bottom:5px solid #fff;
        
         font-size:19px;
         color:black; 
         border:none;
    height:40px;
         outline:none;
         background-color:transparent;
         padding :0 5px;
         }
     /*.txtb ::before{
         content:attr(placeholder);
         position:absolute;
         top:50%;
         left:5px;
         color:#adadad;
         transform:translateY(-50%);
         z-index:-1;
         transition:0.5s;

     }
     .txtb ::after{
         content:'';
         position:absolute;
         width:0%;
         height:2px;
         background:linear-gradient(120deg,#3498db,#8e44ad);
         transition:.5s;
          
     }
     .focus + placehoder ::before{
         top:-5px;

     }
     .focus + placehoder ::after{
         width:100%;

     }*/
</style>
 


</head>
<body style="background-image: url(Imag/3.jpg); background-repeat:no-repeat;height: 500px;background-position: center;background-repeat: no-repeat;  background-size: cover;  position: relative;">
    <script type="text/javascript">
        $(".txtb").on("focus", function () {
            $(this).addClass("focus");
        });
        $(".txtb").on("blur", function () {
            if ($(this).val == "")
                $(this).removeClass("focus");
        });



    </script>
    <form id="form1" runat="server">
                                                        
<div class="container centered" style="vertical-align: middle;">
    <div class="row">
        <div class="col-md-6 mx-auto">
    <div class="card centered">
        <div class="card-body" style="background-color:#D6CFC7; opacity:1;">

        <div class="row">
            <div class="col">
                <label class="lblemail">Enter email address</label>
                        <asp:TextBox ID="txtEmail" runat="server" placeholder="Email address" CssClass="txtb" validationgroup="save"></asp:TextBox><br /><asp:Label ID="Label3" runat="server" Visible="false"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter a email address" ControlToValidate="txtEmail" ></asp:RequiredFieldValidator>
            <br />
                
                <asp:Button ID="Button2" runat="server" Text="send" OnClick="Button2_Click" validationgroup="save"/>
            </div>
            </div>


            <br />
            <div class="row codesend">
                <div class="col">
            <label class="lblemail">Enter OTP</label>
            <asp:TextBox ID="txtVerifyCode" runat="server" placeholder="OTP" CssClass="txtb" validationgroup="save1'"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter a valid otp" ControlToValidate="txtVerifyCode" ></asp:RequiredFieldValidator>
               <asp:Label ID="Label4" runat="server" Visible="false"></asp:Label>
                 
            </div>
            </div>
                    <br />
           <div class="row">
               <div class="col">
            <asp:Button ID="Button1" runat="server" Text="Verify code" validationgroup="save1" OnClick="Button1_Click" />
            </div>
           </div>
        </div>

            </div>
        </div>
            </div>
        </div>
   
    </form>
</body>
</html>
