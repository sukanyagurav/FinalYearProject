<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Addnewadmin.aspx.cs" Inherits="RENTAL.Addnewadmin" %>

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
       <div class="container-fluid">
           <div class="row">
               <div class="col-md-4">
                   <div class="card">
                       <div class="card-body">
                           <div class="row">
                               <div class="col">
                                   <center> Add Admin Members</center>
                                   </div>

                           </div>
                           <div class="row" >
                               <div class="col">
                                   <hr />
                               </div>

                           </div>
                       <div class="row">
                           <div class="col">
                               <label>Admin  ID</label>
                               <div class="form-control">
                                   <div class="input-group">
                                       <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Placeholder="Id"></asp:TextBox>
                                              <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                  
                                   </div>
                               </div>
                           </div>
                           <div class="col">
                               <label> Name</label>
                               <div class="form-control">
                                   <div class="input-group">
                                       <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" ReadOnly="true" placeholder="Name"></asp:TextBox>
                                   </div>
                               </div>
                           </div>
                        
                       </div>
                           <div class="row">
                               <div class="col">
                                   <label>Mobile Number</label>
                                   <div class="form-control">
                                       <div class="input-group">
                                           <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" placeholder="Mobile no" ReadOnly="true"></asp:TextBox>
                                       </div>
                                   </div>
                               </div>
                                  <div class="col">
                               <label> Email address</label>
                               <div class="form-control">
                                   <div class="input-group">
                                       <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" ReadOnly="true" placeholder="email Id"></asp:TextBox>
                                   </div>
                               </div>
                           </div>
                           </div>
                           <div class="row">
                                <div class="col">
                                <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click" />
                            </div>
                            <div class="col">
                                <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="Button4_Click" />
                            </div>
                           </div>
                       </div>
                   </div>
               </div>
               <div class="col-md-8">

               </div>
           </div>
       </div>
    </form>
</body>
</html>
