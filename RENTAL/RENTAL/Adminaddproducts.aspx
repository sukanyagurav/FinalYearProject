﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Adminaddproducts.aspx.cs" Inherits="RENTAL.Adminaddproducts" %>
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
   <style  type="text/css">
       .pagination{
           display: inline-block;
             text-align: center;

              color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;

       }
       .pagination.active {
  background-color: #4CAF50;
  color: white;
}
       .pagination :hover:not(.active) {background-color: #ddd;}
  
    </style>
       <div class="container-fluid">
           <div class="row">
           <div class="col-md-4">
               <div class="card">
                   <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>Add Products</h4>
                                 </center>
                            </div>
                        </div>
                       <div class="row">
                            <div class="col">
                                <center>
                                       
                                       <img src="images/addproducts.jpg" width="100" />
                                    </center>
                            </div>
                        </div>
 
                       <div class="row">
                            <div class="col">
                                <hr/>
                            </div>
                        </div>
                       <div class="row">
                           <div class="col-md-4">
                                <label>Product Name</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Product ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox1" style="color:Red; font-size:15px;" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                          <div class="col-md-8">
                              <label>Product Name</label>
                              <asp:TextBox ID="Name" runat="server" CssClass="form-control" placeholder="Description"></asp:TextBox>
                          </div>
                       </div>

                       <div class="row">
                           <div class="col-md-3">
                              
                               <label>Product Image</label>
                               <div class="form-group">
                                    <div class="input-group">
                                            <asp:FileUpload ID="f1" runat="server" />
                                                <br />
                                             <asp:Label ID="Label4" runat="server"></asp:Label>
                                                <br />
                                        </div>
                                   
                           </div>
                          
                           </div> 
                           <div class="col-md-3">
                               
                               <label>Product Image 1</label>
                               <div class="form-group">
                                    <div class="input-group">
                                            <asp:FileUpload ID="f2" runat="server" />
                                                <br />
                                             <asp:Label ID="Label2" runat="server"></asp:Label>
                                                <br />
                                        </div>
                                   </div>

                           </div>
                           
                             <div class="col-md-3">
                                
                               <label>Product Image</label>
                               <div class="form-group">
                                    <div class="input-group">
                                            <asp:FileUpload ID="f3" runat="server" />
                                                <br />
                                             <asp:Label ID="Label3" runat="server"></asp:Label>
                                                <br />
                                        </div>
                                   </div>

                           
                           </div>
                         </div>
                           
                       
                       <div class="row">
                           <div class="col-md-6">
                               <label>Description</label>
                               <asp:TextBox ID="description" runat="server" CssClass="form-control" placeholder="Description" ></asp:TextBox>
                           </div>
                           <div class="col-md-3">
                           <label>Dimension</label>
                           <asp:TextBox ID="dimension" runat="server" CssClass="form-control" placeholder="Dimesnsion"></asp:TextBox>
                       </div>
                           <div class="col-md-3">
                               <label>Color</label>
                               <asp:TextBox ID="color" runat="server" CssClass="form-control" placeholder="Dimesnsion" ></asp:TextBox>
                           </div>
                     </div>
                       <div class="row">
                           <div class="col-md-4">
                               <label>Product Quantity</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Quanatity"></asp:TextBox>
                                      </div>
                                </div>
                           </div>
                           <div class="col-md-4">
                               <label>Product Price</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Price"></asp:TextBox>
                                      </div>
                                </div>
                           </div>
                           <div class="col-md-4">
                               <label>Refundable Deposit</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Refundable Deposit"></asp:TextBox>
                                      </div>
                                </div>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col">
                               <label>Product Keyword</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Keyword"></asp:TextBox>
                                      </div>
                                </div>
                           </div>
                           <div class="col">
                               <label>Product Category</label>
                                <div class="form-group">
                                    <div class="input-group">
                                         <asp:DropDownList ID="ddl" runat="server">
                                               <asp:ListItem>Bedroom</asp:ListItem>
                                                 <asp:ListItem>Livingroom</asp:ListItem>
                                                   <asp:ListItem>StudyRoom</asp:ListItem>
                                                   <asp:ListItem>DinningRoom</asp:ListItem>
                                                    <asp:ListItem>Storage</asp:ListItem>
                                                <asp:ListItem>OfficeFurniture</asp:ListItem>
                                                   <asp:ListItem>Appliance</asp:ListItem>
                                          </asp:DropDownList>

                                    </div>
                                    </div>

                           </div>
                           <div class="col">
                               <label>Chooose City</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="CityName" DataValueField="CityName"></asp:DropDownList>

                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [CityName] FROM [City]"></asp:SqlDataSource>

                                    </div>
                                    </div>

                           </div>
                       </div>
                   </div>
                   <div class="row">
                       <div class="col-md-3">
                           <asp:Image ID="Image1" runat="server" Height="200" Width="200" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       </div>&nbsp;&nbsp;&nbsp;
                       <div class="col-md-3">
                           <asp:Image ID="Image2" runat="server" Height="200" Width="200"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       </div>&nbsp;&nbsp;&nbsp;
                       <div class="col-md-3">
                           <asp:Image ID="Image3" runat="server" Height="200" Width="200" />
                       </div>
                   </div>
                   <div class="row">
                            <div class="col-4">
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button2_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="Button4_Click" />
                            </div>
                        </div>
               </div>
               <asp:Label ID="Label1" runat="server"></asp:Label>
           </div>
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                         <div class="row">
                            <div class="col">
                                <center>
                                        <h4>Items</h4>
                                    </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-8">
                                <asp:TextBox ID="txtsearch" runat="server"></asp:TextBox>
                                <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr/>
                            </div>
                        </div>
 
                        <div class="row">
                            <div class="col">
                                <asp:GridView ID="GridView1" runat="server" EmptyDataText="No Records Found" ShowHeaderWhenEmpty="True" AllowPaging="True" class="table table-striped table-bordered"  PageSize="20" OnPageIndexChanging="GridView1_PageIndexChanging">
                                    <PagerStyle/>
                                  

                                </asp:GridView>
                                
                                <br />
                               
                            </div>
                        </div>
 
                    </div>
                </div>
            </div>
       </div>
     </div>
  </asp:Content>