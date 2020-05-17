<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="RENTAL.PlaceOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <br />
    <br />
    <br />
    <br />
    <br />
    <hr />
   <div class="container-fluid">
        <div class="row ">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                        <label>Enter Full Name</label>
                         <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Name"></asp:TextBox>
                                          </div>
                                </div>
                                 <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter Full name" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                                        
                                </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Enter your address</label>
                               <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Address" TextMode="MultiLine"></asp:TextBox>
                                              </div>
                                </div>
                                 <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter address" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                             
                                </div>
                            </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Enter Pincode</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Pincode" ></asp:TextBox>
                                      </div>
                                </div>
                                   <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage=" Please Enter Pincode" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter a Valid pincode" ControlToValidate="TextBox3" ValidationExpression="^\d{6,}$"></asp:RegularExpressionValidator>
                                       
                            </div>
                        </div>
                        <div class="row">
                            <label>City</label>
                             <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="City" ReadOnly="True"></asp:TextBox>
                                      </div>
                                </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>State</label>
                                 <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="state" ReadOnly="True"></asp:TextBox>
                                      </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-5">
                                  <asp:Label ID="Label16" runat="server" Text="Payment Option"></asp:Label>
    <br />
    <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" OnCheckedChanged="RadioButton1_CheckedChanged" Text="PayPal" />
  
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">

    <asp:Button ID="Button1" runat="server" Text="Check Out" OnClick="Button1_Click" />

    <br />
    <asp:Label ID="Label15" runat="server" ></asp:Label>
                              </div>
                        </div>
                            </div>
                        </div>
                    </div>
            <div class="col">
                <div class="card">
                   <div class="card-body">
                       <asp:Label ID="Label1" runat="server" Text="Order Id"></asp:Label>
    <asp:Label ID="Label3" runat="server" ></asp:Label>
                        <asp:Label ID="Label2" runat="server" Text="Order Date"></asp:Label>
    <asp:Label ID="Label4" runat="server" ></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellSpacing="30" GridLines="Horizontal" Height="146px" Width="1000" CellPadding="20" EmptyDataText="No Records Found" BorderStyle="Dashed" ShowFooter="True">
         <Columns>
                      <asp:BoundField DataField="sno" HeaderText="srno" />
                    <asp:BoundField DataField="PId" HeaderText="ProductId" />

                    <asp:BoundField DataField="PName" HeaderText="ProductName" />
                    <asp:ImageField DataImageUrlField="PImage" HeaderText="Product image" ItemStyle-Width="200" ItemStyle-Height="100">
                  <ItemStyle Height="100px" Width="200px"></ItemStyle>
                    </asp:ImageField>
                     <asp:BoundField DataField="month" HeaderText="Month" />
                    <asp:BoundField DataField="PPrice" HeaderText="Price" />
                    <asp:BoundField DataField="totalprice" HeaderText="Total price" />
                     <asp:BoundField DataField="quantity1" HeaderText="Quantity" SortExpression="quantity1" />
            
                     
                </Columns>
                <EditRowStyle Height="50px" />
                <HeaderStyle Height="50px" />
    </asp:GridView>


                     </div>
                </div>
                </div>
            
        </div>
  </div>
       

   



  

</asp:Content>
