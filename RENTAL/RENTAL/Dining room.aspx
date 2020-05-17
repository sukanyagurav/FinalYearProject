<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Dining room.aspx.cs" Inherits="RENTAL.Dining_room" EnableEventValidation="false" ValidateRequest="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    
     <!-- Bootstrap -->
<script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
<script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
<link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css' media="screen" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
     <hr />
    <style>
         .cssdatalist{
             height:365px;
             width:355px;
          box-shadow:0px 7px 10px rgba(0,0,0,0.5);
          transition:0.5s ease-in-out;
    min-height:100%;
          }
      .cssdatalist:hover{
          transform:translateY(20px);

      }
      
     
      .cssdatalist:before{
          content:"";
          position:absolute;
          top:0;
          left:0;
          display:block;
          opacity:0;
      }
      .cssdatalist:hover::before{
          opacity:1;

      }
   .check{
       color:rgba(255,120,0,0.9);
       font-size:20px;

   }


   .example{
        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
          border-style: solid;
  border-color: dodgerblue;
   }
   .n1{
color: rgba(255,120,0,0.9);
 
    font-family: "Verdana";
    font-weight: bold;
    font-size: 29px;
   }
        .mon {
            font-family: "Verdana";
    font-weight: bold;
    font-size: 14px;
    text-align:center;
        }
        .qty {
            font-family: "Verdana";
    font-weight: bold;
    font-size: 14px;
     text-align:center;
        }
        .rs{
border: 1px ;

 
        }
        .mcost{
            font-family: "Verdana";
     color: rgba(255,120,0,0.9);
    font-size: 24px;
    text-align:center;
     font-weight: bold;
        }
        .del{
            font-family: "Verdana";
     color: black;
      font-size: 16px;
        }

        .add{

width:200px;
height:37px;
font-family:"Verdana";
text-align: center;

font-size:14px;

}
        .warn{
 font-family: "Verdana";
     color: black;
      font-size: 14px;
        }
        .doc{
            font-family: "Verdana";
     color: black;
      font-size: 15px;
      text-align:justify;
        }

        .imgchange{
            float:left;
             border-style: solid;
            border-color: dodgerblue;
            margin-left:50px;
        }
        .card1{
            height:180px;
            width:180px;
            padding:2rem 1rem;
            position:relative;
            display:inline;
            align-items:flex-end;
        }

        .descp{
             font-family: "Verdana";
     color: rgba(255,120,0,0.9);
      font-size: 18px;
      text-align:left;
    font-weight: bold;    }



        .dimension{
            font-family: "Verdana";
     color: black;
      font-size: 18px;
      text-align:left;
    font-weight: bold; 

        }
        .lbldimension{
             font-family: "Verdana";
     color: rgba(255,120,0,0.9);
      font-size: 18px;
      text-align:left;

        }
        .di{
          text-align:center;
        }
    </style>
    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="Label3" runat="server" Font-Bold="True"></asp:Label>  
    
<div class="row">
      <div class="col-md-2">
          <div class="card">
              <div class="card-body">

              
        <center> <h3>Sort By</h3></center> 
          <br />
          <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="PCategory" DataValueField="PCategory"  AutoPostBack="True" OnSelectedIndexChanged="checked_changed"  Font-Bold="True"  font-family="Verdana" CssClass="check"></asp:CheckBoxList>
          <asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>

          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT DISTINCT [PCategory] FROM [Products] ORDER BY [PCategory]"></asp:SqlDataSource>
          </div>
          </div>
         
      </div>
      <div class="col-md-10">
        
          <asp:DataList runat="server" DataKeyField="PId" DataSourceID="SqlDataSource3" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" Font-Bold="True" OnItemDataBound="DataList1_ItemDataBound" ID="DataList1">
              <ItemTemplate>
                    <div class="cssdatalist">
           <div class="imagecss">
                    <asp:Label ID="id" runat="server" Text='<%# Eval("PId") %>' Visible="false" ></asp:Label>
               <asp:Image ID ="image1" runat="server" ImageUrl ='<%# Eval("PImage") %>'  class="img-responsive"   />
            <asp:Image ID="ImageButton1" Enabled="false" runat="server" Visible="false" Width="100" Height="100" CssClass="overlay"/>
                   <asp:Button ID="btnShowPopup" runat="server" Text="Quickview" OnClick="ShowPopup" CommandName="id" CommandArgument='<%# Eval("PId") %>'  CssClass="quickview" />
                </div>
                               <div class="nameprice">
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("PName") %>' CssClass="name" />
                 <br />
                <h3>Price :<span><asp:Label ID="Label5" runat="server" Text='<%# Eval("PPrice") %>' Cssclass="price"/></span>/Mon
                    
                    </div>
      </div>        
</ItemTemplate>
</asp:DataList>
                  <asp:DataList ID="DataList2" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"  OnItemCommand="DataList1_ItemCommand"  OnItemDataBound="DataList1_ItemDataBound" >
                <ItemTemplate>
               <div class="cssdatalist">
           <div class="imagecss">
                    <asp:Label
                        ID="id" runat="server" Text='<%# Eval("PId") %>' Visible="false" ></asp:Label>
               <asp:Image ID ="image1" runat="server" ImageUrl ='<%# Eval("PImage") %>'  class="img-responsive"/>
            <asp:Image ID="ImageButton1" Enabled="false" runat="server" Visible="false" CssClass="overlay"  Width="100" Height="100"/>
                   <asp:Button ID="btnShowPopup" runat="server" Text="Quickview" OnClick="ShowPopup" CommandName="id" CommandArgument='<%# Eval("PId") %>'  CssClass="quickview" />
                </div>
                               <div class="nameprice">
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("PName") %>' CssClass="name" />
                 <br />
                <h3>Price :<span><asp:Label ID="Label5" runat="server" Text='<%# Eval("PPrice") %>' Cssclass="price"/></span>/Mon
                    
                    </div>
      </div>      
</ItemTemplate>
          </asp:DataList>
         </div>
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
                 <div class="row">
                    <div class="col-md-7 p-3 my-3">
                      <div class="example">
                        <asp:Image ID="pimage" runat="server" CssClass="img-fluid" height="600" Width="938" />
                        </div>                
                    </div>
                       <div class="col-md-5">
                           <div class="container-fluid">
                               <div class="card">
                   <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                         <ContentTemplate>
                             <div class="row">
                                 <div class="col">
                                     
                                           <h2 class="n1" ><asp:Label ID="id" runat="server" Text='<%# Eval("PId") %>' Visible="false" ></asp:Label>
                                     
                                           <asp:Label ID="namep" runat="server" ></asp:Label>
                                         </h2>

                                     
                                 </div>
                                
                             </div>
                             <div class="row">
                                 <div class="col-md-4">

                                 </div>
                                  <div class="col-md-3 col-centred">
                                     <asp:Rating ID="Rating1" runat="server" StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star" FilledStarCssClass="FilledStar">
                                    </asp:Rating>
                                 </div>
                                 <div class="col-md-5">

                                 </div>
                             </div>

                        <div class="row">
                            <div class="col mon">
                               <center> <h4 class="mon">Choose Your Duration Month</h4></center>

                                <asp:DropDownList ID="ddl" runat="server" AutoPostBack="true" OnSelectedIndexChanged="OnSelectedIndexChanged" ValidationGroup="pop" ViewStateMode="Enabled">
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                    <asp:ListItem>18</asp:ListItem>
                                    <asp:ListItem Selected="True">24</asp:ListItem>
                                </asp:DropDownList>
                               <center> <h4 class="qty">Select Quantity</h4></center>
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlquantity">
                                    <asp:ListItem Text="1" Value="1" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                                </div>
                             <div class="row">
                                  <div class="col-md-1">
</div>
                           <div class="col-md-5">
                               <div class="rs">
                                   <h4 class="cost"><label>Monthly Rent<label> </h4>
                                     <i class="fa fa-rupee" style="font-size:24px"></i>   <asp:Label ID="price" runat="server"  Visible="true"  CssClass="mcost"></asp:Label>
                                   
                                   </div>
                               </div>
                                 <div class="col-md-5">
                               <div class="rs">
                                               <h4 class="cost"> <label>Refundable Deposit<label></h4>
                                          <i class="fa fa-rupee" style="font-size:24px"></i>         <asp:Label ID="refprice" runat="server" CssClass="mcost" ></asp:Label>
                                                 
                                             
                                         
                                    </div>
                                  </div>
                                  <div class="col-md-1">
</div>
                             </div>
                             <div class="row">
                                 <div class="col col-centered">
                                    <h5 class="del">Free Delivery and Setup in 2-3 days</h5> 
                                 </div>
                             </div>
           

                             <div class="row">
                                 <div class="col-md-12">
                                     <asp:Label ID="Label15" runat="server" CssClass="warn"></asp:Label><br /><br />
                                 </div>
                             </div>

<div class="row">
    <div class="col-md-2">

    </div>
                <div class="col-md-4">
                    <asp:Button ID="Button1" runat="server" Text="Add To Cart" CssClass="btn btn-danger add center btn-sm" OnClick="addbtn_Click" />
                    
            </div>
 
                <div class="col-md-4">
                 
                    <asp:Button ID="Button2" runat="server" Text="Add To Wishlist" CssClass="btn btn-danger add center btn-sm" OnClick="wishbtn_Click" ValidationGroup="pop" CausesValidation="False" />
                      <asp:Label ID="lbwishlist" runat="server"></asp:Label>
                </div>
                  <div class="col-md-2">

    </div>

</div>
                            <div class="row">
                                <div class="col">
                                   
                           
            <asp:Label ID="lbresult" runat="server" Text="" Visible="false"></asp:Label>
                                   
                                 
     </div>
                                </div>
                            
                                 
                                    
                             
                     </ContentTemplate>
                     <Triggers>
                     <asp:AsyncPostbackTrigger ControlId="ddl" EventName="SelectedIndexChanged" />
                         </Triggers>
                     </asp:UpdatePanel>
<div class="row">
                      <div class="col">
                          <h5  class="doc"><img src="images/ky.JPG"/> &nbsp;&nbsp;&nbsp;&nbsp;KYC Documents to be submitted before Delivery.</h5>
            <h5  class="doc"> <img src="images/medal.png"  height="32" width="23"/>&nbsp;&nbsp;&nbsp;&nbsp; All Products are in Mint Condition. </h5>
                        </div></div> 
<div class="row">
                          <div class="col">
                                </div>
                        </div>          
                                
                  <div class="row">
                      <div class="col">
                           <asp:TextBox runat="server" ID="txtreview" TextMode="MultiLine"></asp:TextBox>
               <asp:Button runat="server" Text="Submit Review" ID="btnsubmit" OnClick="btnsubmit_Click" ValidationGroup="pop" CausesValidation="False" />
                <asp:Label ID="Label1" runat="server" ></asp:Label>      
         
                      </div>
                  </div>
         </div>    
                     </div>

                  </div>
                 </div>  
                
                <div class="row">
 <br />
    <br />
                <div class="col">
                    <div class="card1">
                         <asp:ImageButton ID="ImageButton2" runat="server" height="100" Width="100" CssClass="imgchange" OnClick="ImageButton2_Click"/>

                    </div>

                     <div class="card1">
                           <asp:ImageButton ID="ImageButton3" runat="server" height="100" Width="100" CssClass="imgchange" OnClick="ImageButton3_Click"/>

                    </div>
                     <div class="card1">
                         <asp:ImageButton ID="ImageButton4" runat="server" height="100" Width="100" CssClass="imgchange" OnClick="ImageButton4_Click"/>

                    </div>
                </div>       </div>
                   <div class="row">
                       <div class="col-md-7">
<br />
    <br />
<p class="descp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <asp:Label ID="Description" runat="server" CssClass="descp"></asp:Label>
  </p> 
    
    </div>
                      
                   </div>

                <div class="row di">
                       <div class="col-md-6">
<br />
    
            <h5 class="dimension">Dimensions:&nbsp;&nbsp;<asp:Label ID="Dimension" runat="server" CssClass="lbldimension"></asp:Label></h5>
                       </div>
                       
                   </div>

                <div class="row">
                       <div class="col-md-6">

            <h5 class="dimension">Color:&nbsp;&nbsp;<asp:Label ID="Color" runat="server" CssClass="lbldimension"></asp:Label></h5>
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
   
    


    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="GetProductDetails" SelectCommandType="StoredProcedure">
                  <SelectParameters>
                      <asp:SessionParameter Name="CityName" SessionField="CityName" Type="String" />
                      <asp:Parameter DefaultValue="Bedroom" Name="PCategory" Type="String" />
                  </SelectParameters>
              </asp:SqlDataSource>
  

</asp:Content>
