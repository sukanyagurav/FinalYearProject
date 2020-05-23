<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Send user gmail.aspx.cs" Inherits="RENTAL.Send_user_gmail" %>
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
    <script>
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
                   
                        <asp:Button ID="Button1" runat="server" Text="Send Notification" OnClick="Button1_Click" />
                     
                    </div>
                <div class="col-lg-8">
                       <asp:GridView ID="GridView1" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ReturnDate" HeaderText="RETURN " />
                <asp:BoundField DataField="username" HeaderText="Name" />
                <asp:BoundField DataField="firstName" HeaderText="User Name" />
            
                <asp:BoundField DataField="PName" HeaderText="Item Name" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                <asp:BoundField DataField="PPrice" HeaderText="Price" />
                <asp:BoundField DataField="DateOfOrder" HeaderText="Date of Order" />
            </Columns>
        </asp:GridView>
                </div>
            </div>
        </div>

     
   </asp:Content>
