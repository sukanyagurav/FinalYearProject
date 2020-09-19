<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="RENTAL.AdminLogin" %>

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
    <form id="form1" runat="server">
        
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                     <div class="col">
                        <center>
                           
                                 <img src="images/adminuser.jpg" />
                        </center>
                     </div>
                  </div>
                    <div class="row">
                     <div class="col">
                        <center>
                           <h3>Admin Login</h3>
                        </center>
                     </div>
                  </div>
                    <div class="row">
                     <div class="col">
                        <hr/>
                     </div>
                  </div>
                    <div class="row">
                        <div class="col">
                            <label>Admin ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Admin ID"></asp:TextBox>
                        </div>
                            <label>Password</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                            <div class="form-group">
                           <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                        </div>
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
