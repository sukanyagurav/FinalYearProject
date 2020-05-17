<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminQuery.aspx.cs" Inherits="RENTAL.AdminQuery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-body">
                             <div class="row">
                            <div class="col">
                              <center>
                                    <h4>Query member Details</h4>
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
                                    <label>Member ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Member ID"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        </div>
                                    </div>
                              
                     </div>
                                 <div class="col-md-8">
                                   <label>Member Name</label>
                                   <div class="form-group">
                                       <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="Member ID" runat="server" ReadOnly="True"></asp:TextBox>

                                   </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-5">
                                    <label>Email ID</label>
                                      <div class="form-group">
                                     <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email ID" ReadOnly="True"></asp:TextBox>
                                </div>

                                </div>
                                <div class="col-md-7">
                                    <label>Date Of Query</label>
                                      <div class="form-group">
                                     <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Date Of Query" ReadOnly="True"></asp:TextBox>
                                </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-8">
                                    <label>Query or Compliants</label>
                                   <div class="form-group">
                                     <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="User Query" ReadOnly="True"></asp:TextBox>
                                </div>
                                    </div>
                            </div>
                            <div class="row">
                                <div class="col-md-8">
                                    <label>Admin Reply</label>
                                   <div class="form-group">
                                     <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Admin Reply" TextMode="MultiLine"></asp:TextBox>
                                </div>
                                    </div>
                            </div>
                                 <div class="row">
                     <div class="col-8 mx-auto">
                        <asp:Button ID="Button2" class="btn btn-lg btn-block btn-success" runat="server" Text="Reply" OnClick="Button2_Click" />
                     </div>
                  </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Query Details</h4>
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
                                    <hr />
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