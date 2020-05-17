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
   
</head>
<body>
     <form runat="server">
     
                                                 
<div class="container">
    <div class="row">
        <div class="col-md-6 mx-auto">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col">
                    <center>
<img src="images/usericon.png" height="100" width="100" />

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
                    <asp:Label id="Label3" runat="server">Enter Email address</asp:Label>
                      <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="email" runat="server" placeholder="Email ID"></asp:TextBox>
                      <br />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="email"></asp:RequiredFieldValidator>
                                        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                                <br />
                      </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label> Enter Password</label>
                    <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtpassword" runat="server" placeholder="Enter password" TextMode="Password"></asp:TextBox>
                      <br />
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
                                   <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
                                     <br />
                        </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
              <asp:Button ID="Button2" runat="server" Text="Button" CssClass="btn btn-primary btn-sm" OnClick="Button1_Click" />
            <asp:Label ID="verifyaccount" runat="server" Text="Label" Visible="False"></asp:Label>
             <br /> 
                </div>
            </div>
            <div class="row">
                <div class="col">
                      <a href="forgotpassword.aspx">Forgot your password?</a>
                                  
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
