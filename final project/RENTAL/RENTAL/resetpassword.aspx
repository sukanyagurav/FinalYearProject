<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resetpassword.aspx.cs" Inherits="RENTAL.resetpassword" %>

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
        <div class="card-body" style="background-color:#D6CFC7;">

        <div class="row">
            <div class="col">
            <asp:Label ID="Label1" CssClass="lblemail" runat="server" Text="Enter Password"></asp:Label>
            <br /><asp:TextBox ID="txtpass" runat="server" CssClass="txtb" placeholder="password" TextMode="Password"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter a password" ControlToValidate="txtpass" ></asp:RequiredFieldValidator>
            
            </div>
            </div>

            <br />
            <div class="row codesend">
                <div class="col">
            <asp:Label ID="Label2" runat="server" Text="Enter Confirm Password" CssClass="lblemail"></asp:Label>

            <asp:TextBox ID="txtpassconfirm" runat="server" CssClass="txtb" placeholder="Confirm password" TextMode="Password"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter a confirm password" ControlToValidate="txtpassconfirm" ></asp:RequiredFieldValidator>
            <br />
                    <asp:Button ID="Restpass" runat="server" Text="Reset" OnClick="Restpass_Click" />
            <asp:Label ID="Label3" runat="server" Visible="false" CssClass="lblemail"></asp:Label>
            
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
