<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm7.aspx.cs" Inherits="RENTAL.WebForm7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <asp:DataList ID="DataList1" runat="server" DataKeyField="PId" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal">
             <ItemTemplate>
                 
              
                 <img id="myimage1" runat="server" src='<%# Eval("PImage") %>'  />
                 <asp:Button ID="btnShowPopup" runat="server" Text="Quickview" OnClick="ShowPopup"  CommandName="id" CommandArgument='<%# Eval("PId") %>'  CssClass="quickview" />

              
             </ItemTemplate>
         </asp:DataList>

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
                          
                        <asp:Image ID="image" runat="server" ></asp:Image>
                        </div>                                           
                    </div>
  
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
   
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js">
  </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="zoomsl.min.js"></script>
    <script>
        $('#image').imagezoomsl({
            zoomrange: [1, 12],
            zoomstart: 4,
            innerzoom: true,
            maginfierborder: none
        });


    </script>
    
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="GetProductDetails" SelectCommandType="StoredProcedure">
             <SelectParameters>
                 <asp:SessionParameter DefaultValue="Mumbai" Name="CityName" SessionField="CityName" Type="String" />
                 <asp:Parameter DefaultValue="bedroom" Name="PCategory" Type="String" />
             </SelectParameters>
         </asp:SqlDataSource>
        
    </form>
  
</body>
</html>
