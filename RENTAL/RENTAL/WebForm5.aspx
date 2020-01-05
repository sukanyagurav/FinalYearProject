<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="RENTAL.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="demo.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.7);
            position: absolute;
            top: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            left: 51px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <button id="button" class="modal"  value="login" />
  <div class="bg-modal" id="myModal">
            <div class="modal-content">
                <br />
                <br />
                <br />
                <br />
                <br />
                <span class="close">&times;</span>
                <div>
                    <asp:Label ID="Label1" runat="server" Text="Email address" CssClass="lblmail"></asp:Label>
             
                    <asp:TextBox ID="email" runat="server" CssClass="txtmail" Placeholder="Enter Email"/>
                    <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please a Enter a Email address !!!" ControlToValidate="email"></asp:RequiredFieldValidator>
                    <br />
                </div> 
                <div>
                        <!--Password section-->
                    <asp:Label ID="Label2" runat="server" Text="Enter Password" CssClass="lblpass"></asp:Label>
                    <asp:TextBox ID="txtpassword" runat="server" CssClass="txtpass" TextMode="Password" Placeholder="***********"></asp:TextBox>
                        <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter a Password !!!" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
           
              
                     <br /><!--forgot password section--> <br />
                     <asp:HyperLink ID="HyperLink2" runat="server" Text="Forgot password?"  CssClass="aforgort" NavigateUrl="forgot.aspx" ></asp:HyperLink>
               </div>
                 <br />
                <div>
                <asp:Button ID="Button1" runat="server" Text="Log In" CssClass="btnsubmit" OnClick="Button1_Click" />
                <br/>
                 <asp:Label ID="lblreg" runat="server" Text="Don't have an account?" CssClass="lblreg ">
                <asp:HyperLink ID="HyperLink1" runat="server" Text="Register Here!" NavigateUrl="SIGNUP.aspx" CssClass="areg"></asp:HyperLink>
                 </asp:Label>

                    <br />
                     <br />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT * FROM [signup1]"></asp:SqlDataSource>
           </div>
       </div>
  </div>
        <script>
            var modal = document.getElementById("myModal");
            var btn = document.getElementById("button");
            var span = document.getElementsByClassName("close")[0];
            btn.onclick = function () {
                modal.style.display = "block";
            }
            btn.onclick = function () {
                modal.style.display = "block";
            }
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
               

        </script>
    </form>
    
</body>
</html>
