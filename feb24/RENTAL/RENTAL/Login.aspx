<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RENTAL.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet"/>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <style>
        .nav-tabs {
    margin-bottom: 15px;
}
.sign-with {
    margin-top: 25px;
    padding: 20px;
}
div#OR {
    height: 30px;
    width: 30px;
    border: 1px solid #C2C2C2;
    border-radius: 50%;
    font-weight: bold;
    line-height: 28px;
    text-align: center;
    font-size: 12px;
    float: right;
    position: absolute;
    right: -16px;
    top: 40%;
    z-index: 1;
    background: #DFDFDF;
}
    </style>
</head>
<body>
     
       <h2>Login here</h2>
       <br />
 <form runat="server" >
        <div class="row">
                    <div class="col-md-8" style="border-right: 1px dotted #C2C2C2;padding-right: 30px;">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#Login" data-toggle="tab">Login</a></li>
                            <li><a href="#Registration" data-toggle="tab">Registration</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane active" id="Login">
                                
                                <div class="form-group">
                            <asp:Label ID="Label5" runat="server" Text="Enter Email address" CssClass="col-sm-2 control-label"></asp:Label>
                                   
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="email"></asp:RequiredFieldValidator>
                                        <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group">
                                        <asp:Label ID="Label6" runat="server" Text="Enter a password" CssClass="col-sm-2 control-label"></asp:Label>
                                   
                                    <div class="col-sm-10">
                                       
                                        <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
                                   <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
                                        </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-10">
                                         <asp:Button ID="Button2" runat="server" Text="Button" CssClass="btn btn-primary btn-sm" OnClick="Button1_Click" />
                                        <asp:Label ID="verifyaccount" runat="server" Text="Label" Visible="False"></asp:Label>
                                        <a href="#forgot">Forgot your password?</a>
                                    </div>
                                </div>
                              
                            </div>
       
                             <div class="tab-pane" id="Registration">
                              
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="Enter Your name" CssClass="col-sm-2 control-label"></asp:Label>
                                     <div class="col-sm-10">

                                        <asp:TextBox ID="uname" runat="server" CssClass="form-control"></asp:TextBox>
                                        
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Text="Enter Email address" CssClass="col-sm-2 control-label"></asp:Label>
                                    <div class="col-sm-10">
                                    <asp:TextBox ID="uemail" runat="server" CssClass="form-control"></asp:TextBox>
                                     
                                    </div>
                                </div>

                                 <div class="form-group">
                                    <asp:Label ID="Label7" runat="server" Text="Enter Mobile Number" CssClass="col-sm-2 control-label"></asp:Label>
                                    <div class="col-sm-10">
                                    <asp:TextBox ID="umobileno" runat="server" CssClass="form-control"></asp:TextBox>
                                     
                                    </div>
                                </div>

                                 <div class="form-group">
                                    <asp:Label ID="Label8" runat="server" Text="Enter a Password " CssClass="col-sm-2 control-label"></asp:Label>
                                    <div class="col-sm-10">
                                    <asp:TextBox ID="upassword" runat="server" CssClass="form-control"></asp:TextBox>
                                     
                                    </div>
                                </div>

                                  <div class="form-group">
                                    <asp:Label ID="Label9" runat="server" Text="Enter Confirmed password" CssClass="col-sm-2 control-label"></asp:Label>
                                    <div class="col-sm-10">
                                    <asp:TextBox ID="urepassword" runat="server" CssClass="form-control"></asp:TextBox>
                                     
                                    </div>
                                </div>

                                  <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-10">
                                        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="signup_click" />
                                         <asp:Button ID="signup" runat="server" Text="Button" CssClass="btn btn-primary btn-sm" />
                                        <asp:Label ID="Label10" runat="server" Text="Label" Visible="False"></asp:Label>
                                          <asp:Label ID="msg" runat="server" Text="You are Successfully Registerd...!" Visible="False"></asp:Label>
      
                                    </div>
                                </div>
                                 reg
                                 </div>
                       
                                      <div id="OR" class="hidden-xs">
                            OR</div>
                        
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                         </div>
               
                        
                    </div>
                    
              </div>
                               
          </div>
       
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT * FROM [signup1]"></asp:SqlDataSource>
           

       </form>
  

</body>
</html>
