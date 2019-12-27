<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RENTAL.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
      <div class="loginbox">
       <h2>Login here</h2>
       <br />
       <form runat="server" >
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
           <asp:Button ID="Button1" runat="server" Text="Log In" CssClass="btnsubmit" OnClick="Button1_Click" />
          <br/>
           <asp:Label ID="lblreg" runat="server" Text="Don't have an account?" CssClass="lblreg ">
               <asp:HyperLink ID="HyperLink1" runat="server" Text="Register Here!" NavigateUrl="SIGNUP.aspx" CssClass="areg"></asp:HyperLink>
               </asp:Label>

           <br />
           <br />
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT * FROM [signup1]"></asp:SqlDataSource>
           

       </form>
   </div>

</body>
</html>
