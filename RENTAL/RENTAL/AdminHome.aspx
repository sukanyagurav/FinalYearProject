<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="RENTAL.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <script type="text/javascript">
      $(document).ready(function () {
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
      });
   </script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                                <center>Advertisement</center>
                        </div>
                        
                    </div>
                    <div class="row">
                        <div class="col">
                              <label>Image Id</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Product ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click"  />
                                          </div>
                                </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col">
                             <label>Product Name</label>
                              <asp:TextBox ID="Name" runat="server" CssClass="form-control" placeholder="Description" TextMode="SingleLine"></asp:TextBox>
                  
                        </div>
                        <div class="col">
                            <asp:Image ID="Image1" runat="server"  Height="100" Width="200"/>
                        </div>
                        
                    </div>
                    <div class="row">
                        <div class="col">
                             <label>Browse Advertisements</label>
                               <div class="form-group">
                                    <div class="input-group">
                                            <asp:FileUpload ID="f1" runat="server" />
                                                <br />
                                             <asp:Label ID="Label4" runat="server"></asp:Label>
                                                <br />
                                        </div>
                                   
                           </div>
                          
                        </div>
                    </div>
                     <div class="row">
                            <div class="col-4">
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button2_Click"  />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click"  />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="Button4_Click"  />
                            </div>
                        </div>
                    
                </div>
            </div>
        </div>
        <div class="col-md-8">

        </div>
    </div>
</div>

</asp:Content>
