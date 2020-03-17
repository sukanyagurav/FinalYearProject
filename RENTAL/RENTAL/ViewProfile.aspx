<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProfile.aspx.cs" Inherits="RENTAL.ViewProfile" %>

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
                                <center>
                                <img src="images/generaluser.png" width="100"/>
                                </center>
                                </div>
                             </div>
                            <div class="row">
                     <div class="col">
                        <center>
                           <h4>Your Profile</h4>
                           <span>Account Status - </span>
                           <asp:Label class="badge badge-pill badge-info" ID="Label1" runat="server" Text="Your status"></asp:Label>
                        </center>
                     </div>
                  </div>
                            <div class="row">
                            <div class="col">
                                <hr/>
                            </div>
                        </div>
                            <div class="row">
                         <div class="col-md-6">
                        <label>User Name</label>
                            <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name"></asp:TextBox>
                        </div>
                     </div>
                                </div>                              
                      <div class="row">  
                              <div class="col-md-6">
                        <label>E-mail</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="E-mail"></asp:TextBox>
                        </div>
                     </div>
                         
                            
                         </div>
                            <div class="row">
                               
                                    <div class="col-md-6">
                        <label>Contact No</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact No" ></asp:TextBox>
                        </div>
                     </div>

                                </div>  
                                <div class="row">
                                <div class="col-8 mx-auto">
                        <center>
                           <div class="form-group">
                              <asp:Button class="btn btn-primary btn-block btn-lg" ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" />
                           </div>
                        </center>
                     </div>
                            </div>
                           
                            </div>
                        </div>
                </div>
                <div class="col-md-8">
                    <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                                <img src="images/addproducts.jpg" width="100" />
                        </center>
                     </div>
                  </div>
                   <div class="row">
                     <div class="col">
                        <center>
                           <h4>Your Buy Products</h4>
                           <asp:Label class="badge badge-pill badge-info" ID="Label2" runat="server" Text="your product info"></asp:Label>
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
                           <asp:GridView ID="GridView1" runat="server"  class="table table-striped table-bordered"></asp:GridView>

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
