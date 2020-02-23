<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Office Furniture.aspx.cs" Inherits="RENTAL.Office_Furniture" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
 <br />
<br />
 <br />
  <br />
<hr />
     <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="Label3" runat="server" Font-Bold="True"></asp:Label>  
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AddtoCart.aspx">Show cart</asp:HyperLink>
<div style="float:right">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="PId" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
       <div class="datalist">
            <div class="imagecss">
                 <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("PImage") %>' />
                  <asp:Button ID="btnShowPopup" runat="server" Text="Quickview" OnClick="ShowPopup"  CommandName="id" CommandArgument='<%# Eval("PId") %>'  CssClass="quickview" />
            </div>
            <br />
            <div class="nameprice">
                 <asp:Label ID="PNameLabel" runat="server" Text='<%# Eval("PName") %>' CssClass="name" />
                    <br />
                 <h3>Price:<span><asp:Label ID="PPriceLabel" runat="server" Text='<%# Eval("PPrice") %>' CssClass="price"/></span></h3> 
             </div>
         </div>

        </ItemTemplate>
</asp:DataList>
</div>


    <!-- Modal Popup -->

<div id="MyPopup" class="modal fade productview" role="dialog">
    
    <!-- Modal content-->
         <div class="modal-content">
            <!--Header-->
               <div class="modal-header">
                    <button type="button" class="close class pull-right" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" class="white-text">&times;</span>
                     </button>
                </div>
             <!-- close header -->
           <!-- modal body -->
            <div class="modal-body">
                 <div class="row" style="background-color:pink">
                    <div class="col-md-6 p-3 my-3 product_img">
                               <asp:Image ID="pimage" runat="server" Width="500px" Height="500px" CssClass="pimage" />
                    </div>
  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                         <ContentTemplate>
                 <div class="col-md-6 product_content">
                       <h2>
                      <asp:Label ID="namep" runat="server"></asp:Label>
                      </h2>  
                   
                     <h3 class="cost">Price:
                      <asp:Label ID="price" runat="server"  Visible="true" ></asp:Label>
                      <asp:Label ID="ddlprice" runat="server" Visible="false"></asp:Label>
                      </h3>
                        <div class="row">
                            <div class="col-md-4 col-sm-6 col-xs-12">
                                
                                <asp:DropDownList ID="ddl" runat="server" AutoPostBack="true" OnSelectedIndexChanged="OnSelectedIndexChanged" ValidationGroup="pop" ViewStateMode="Enabled">

                                 <asp:ListItem>3</asp:ListItem>
                                 <asp:ListItem>6</asp:ListItem>
                                 <asp:ListItem>12</asp:ListItem>
                                <asp:ListItem>18</asp:ListItem>
                                <asp:ListItem Selected="True">24</asp:ListItem>

                                </asp:DropDownList>
                                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/addtocart.jpg"  CommandArgument='<%# Eval("PId") %>' CommandName="addtocart" Width="165px" Height="37px" />
                            </div>      
                    </div>
                     </ContentTemplate>
                     <Triggers>
                     <asp:AsyncPostbackTrigger ControlId="ddl" EventName="SelectedIndexChanged" />
                     </Triggers>
                     </asp:UpdatePanel>
                </div>        
         </div>
    </div>
 </div>


  <!-- Bootstrap -->
<script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
<script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
<link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css'
    media="screen" />
   
<!-- Bootstrap -->
<!-- Modal Popup -->
        <script type="text/javascript">
            function ShowPopup() {
                //  $("#MyPopup .modal-title").html(title);
                //  $("#MyPopup .modal-body").html(body);
                $("#MyPopup").modal("show");
                
            }


</script> 
    




    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FURNITUREConnectionString4 %>" SelectCommand="GetProductDetails" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="CityName" SessionField="CityName" Type="String" />
            <asp:Parameter DefaultValue="Office furniture" Name="PCategory" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>




</asp:Content>
