<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Bed.aspx.cs" Inherits="RENTAL.Bed" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
       <br />
    <br />
     <!-- Bootstrap -->
<script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
<script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
<link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css'
    media="screen" />
    <hr />

    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="Label3" runat="server" Font-Bold="True"></asp:Label>  
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AddtoCart.aspx">Show cart</asp:HyperLink>
    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">sign out</asp:LinkButton>

    <asp:LinkButton ID="LinkButton2" runat="server">View Cart</asp:LinkButton>
   
    <div class="row">
      <div class="col-sm-4">
          <!--checkbox sort details division-->
          <h3>Sort By</h3>
          <br />
          <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="PCategory" DataValueField="PCategory"  AutoPostBack="True" OnSelectedIndexChanged="checked_changed"></asp:CheckBoxList>
          <asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>

          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT DISTINCT [PCategory] FROM [Products] ORDER BY [PCategory]"></asp:SqlDataSource>
          
          <!--close checkbox sort details division-->
      </div>
<div class="col-sm-8">
   
 <div class="datalist3">
  <!--datalist 1-->
 <asp:DataList ID="DataList1" runat="server" DataKeyField="PId" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" CssClass="datalistinfo" OnItemCommand="DataList1_ItemCommand" Font-Bold="True" OnItemDataBound="DataList1_ItemDataBound">
    <ItemTemplate>
     
    <div class="datalist">
   
           <div class="imagecss">
                    <asp:Label ID="id" runat="server" Text='<%# Eval("PId") %>' Visible="false" ></asp:Label>
              
                <asp:Image ID ="image1" runat="server" ImageUrl ='<%# Eval("PImage") %>'   />
              
                   <asp:Button ID="btnShowPopup" runat="server" Text="Quickview" OnClick="ShowPopup"  CommandName="id" CommandArgument='<%# Eval("PId") %>'  CssClass="quickview" />

              
            </div>
                
            <div class="nameprice">
                    <asp:Label ID="PNameLabel" runat="server" Text='<%# Eval("PName") %>' CssClass="name" />
                 <br />
                <h3>Price :<span><asp:Label ID="PPriceLabel" runat="server" Text='<%# Eval("PPrice") %>' Cssclass="price"/></span>/Mon</h3>
             </div> 
  
        <asp:ImageButton ID="ImageButton1" runat="server" Visible="false" />

         
        </div>
        
     </ItemTemplate>
    </asp:DataList>
        <!--close datalist 1-->
 </div>
    <!--start the datalist 2 for checkbox-->
 <asp:DataList ID="DataList2" runat="server" Visible="false" RepeatColumns="3" RepeatDirection="Horizontal" CssClass="datalistinfo" OnItemCommand="DataList1_ItemCommand" Font-Bold="True" OnItemDataBound="DataList1_ItemDataBound">
   <ItemTemplate>
   <asp:Label ID="id" runat="server" Text='<%# Eval("PId") %>' Visible="false" ></asp:Label>
         
   <div class="datalist">
           <div class="imagecss">
                <asp:Image ID ="image1" runat="server" ImageUrl ='<%# Eval("PImage") %>'   />
              
                   <asp:Button ID="btnShowPopup" runat="server" Text="Quickview" OnClick="ShowPopup"  CommandName="id" CommandArgument='<%# Eval("PId") %>'  CssClass="quickview" />
            </div>
            
            <div class="nameprice">
                    <asp:Label ID="PNameLabel" runat="server" Text='<%# Eval("PName") %>' CssClass="name" />
                     <br />
                    <h3>Price :<span><asp:Label ID="PPriceLabel" runat="server" Text='<%# Eval("PPrice") %>' Cssclass="price"/></span>/Mon</h3>
           </div>    
    </div>

</ItemTemplate>
</asp:DataList>
       <!--end the datalist 2 for checkbox-->
    

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
                        
                      <div class="example">
                        <asp:Image ID="pimage" runat="server" Width="800px" Height="500px" class="imagezoom" />
                        </div>                                           
                    </div>
  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                         <ContentTemplate>
                 <div class="col-md-6 product_content">
                       <h2>
                      <asp:Label ID="namep" runat="server" ></asp:Label>
                      </h2>  
                   
                     <h3 class="cost">Price:
                      <asp:Label ID="price" runat="server"  Visible="true" ></asp:Label>
                      <asp:Label ID="ddlprice" runat="server" Visible="false"></asp:Label>
                      </h3>
                        <div class="row">
                            <div class="col-md-4 col-sm-6 col-xs-12">
                                
                             Select Months:<asp:DropDownList ID="ddl" runat="server" AutoPostBack="true" OnSelectedIndexChanged="OnSelectedIndexChanged" ValidationGroup="pop" ViewStateMode="Enabled">

                                 <asp:ListItem>3</asp:ListItem>
                                 <asp:ListItem>6</asp:ListItem>
                                 <asp:ListItem>12</asp:ListItem>
                                <asp:ListItem>18</asp:ListItem>
                                <asp:ListItem Selected="True">24</asp:ListItem>

                                </asp:DropDownList>
                               Select Quantity <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlquantity" >
                                    <asp:ListItem Text="1" Value="1" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                   </asp:DropDownList><br />
                              <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/addtocart.jpg"  CommandArgument='<%# Eval("PId") %>' CommandName="addtocart" Width="165px" Height="37px" />
                            
                            </div>      
                    </div>
                     </ContentTemplate>
                     <Triggers>
                     <asp:AsyncPostbackTrigger ControlId="ddl" EventName="SelectedIndexChanged" />
                     </Triggers>
                     </asp:UpdatePanel>
                </div> 
                
                <asp:Rating ID="Rating1" runat="server" ValidationGroup="pop" StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star" FilledStarCssClass="FilledStar">

                </asp:Rating>

       
            <asp:Label ID="lbresult" runat="server" Text=""></asp:Label>
        <br />
        <asp:TextBox runat="server" ID="txtreview" TextMode="MultiLine"></asp:TextBox>
        <br />
        <asp:Button runat="server" Text="Submit Review" ID="btnsubmit" OnClick="btnsubmit_Click" CommandArgument='<%# Eval("PId") %>' CommandName="ratingproduct" ValidationGroup="pop" />

                <asp:Label ID="Label1" runat="server"></asp:Label>
</div>    
    </div>
 </div>


            
      </div>
  </div>


 <style type="text/css">
        .Star {
            background-image: url(images/Star.gif);
            height: 17px;
            width: 17px;
        }

        .WaitingStar {
            background-image: url(images/WaitingStar.gif);
            height: 17px;
            width: 17px;
        }

        .FilledStar {
            background-image: url(images/FilledStar.gif);
            height: 17px;
            width: 17px;
        }
        </style>

   
   
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
            <asp:Parameter DefaultValue="bedroom" Name="PCategory" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource> 

</asp:Content>
