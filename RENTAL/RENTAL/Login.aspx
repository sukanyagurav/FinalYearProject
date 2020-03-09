<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RENTAL.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body>
     <form runat="server">
       <h2>Login here</h2>
       <br />

                            <asp:Label ID="Label5" runat="server" Text="Enter Email address" CssClass="col-sm-2 control-label"></asp:Label>
                                   
                                   
                                        <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="email"></asp:RequiredFieldValidator>
                                        <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
                                <br />
                                        <asp:Label ID="Label6" runat="server" Text="Enter a password" CssClass="col-sm-2 control-label"></asp:Label>
                                   
                                   
                                       
                                        <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
                                   <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
                                     <br />
                                         <asp:Button ID="Button2" runat="server" Text="Button" CssClass="btn btn-primary btn-sm" OnClick="Button1_Click" />
                                        <asp:Label ID="verifyaccount" runat="server" Text="Label" Visible="False"></asp:Label>
                                         <br />   <a href="forgotpassword.aspx">Forgot your password?</a>
                                  
                              
                           
                                 
                                
                                
                                
                                
                                
                                
                                
                                
                               
      
       
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT * FROM [signup1]"></asp:SqlDataSource>
           

       </form>
  

</body>
</html>
