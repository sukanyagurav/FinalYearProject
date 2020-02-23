<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="RENTAL.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Bootstrap -->
<script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
<script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
<link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css' media="screen" />
   <!-- Bootstrap -->
<!-- Modal Popup -->
        
  
</head>
<body> 
   
    <form id="form1" runat="server">

        <asp:Button ID="Button2" runat="server" Text="Button" OnClick="ShowPopup"  />
       

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
      
          
             
           <div class="form-box">
              <div id="btn"></div>
              <div class="button-box">
                  <button   class="toggle-button" onclick="login()"/>

              </div>
         <div class="input-group">
             <div id="login">
            <asp:Label ID="Label1" runat="server" Text="Email address" CssClass="lblmail"></asp:Label>
             
            <asp:TextBox ID="email" runat="server" CssClass="txtmail" Placeholder="Enter Email"/>
            <br />
           <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
               <br />
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please a Enter a Email address !!!" ControlToValidate="email"></asp:RequiredFieldValidator>
            <br />
              
               
               <!--Password section-->
           <asp:Label ID="Label2" runat="server" Text="Enter Password" CssClass="lblpass"></asp:Label>
           <asp:TextBox ID="txtpassword" runat="server" CssClass="txtpass" TextMode="Password" Placeholder="***********"></asp:TextBox>
              <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter a Password !!!" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
           
              
              <br /><!--forgot password section--> <br />
               <asp:HyperLink ID="HyperLink2" runat="server" Text="Forgot password?"  CssClass="aforgort" NavigateUrl="forgot.aspx" ></asp:HyperLink>
               
           <br />
           <asp:Button ID="Button1" runat="server" Text="Log In" CssClass="btnsubmit"  />
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
      </div>
    </div>
      <script>
          // Get the modal
          var modal = document.getElementById("myModal");

          // Get the button that opens the modal
          var btn = document.getElementByClassName("myBtn");

          // Get the <span> element that closes the modal
          var span = document.getElementsByClassName("close")[0];

          // When the user clicks the button, open the modal 
          btn.onclick = function () {
              modal.style.display = "block";
          }

          // When the user clicks on <span> (x), close the modal
          span.onclick = function () {
              modal.style.display = "none";
          }

          // When the user clicks anywhere outside of the modal, close it
          window.onclick = function (event) {
              if (event.target == modal) {
                  modal.style.display = "none";
              }
          }
          function ShowPopup() {
              //  $("#MyPopup .modal-title").html(title);
              //  $("#MyPopup .modal-body").html(body);
              $("#MyPopup").modal("show");
          }

</script>
   
    </form>
    
</body>
</html>
