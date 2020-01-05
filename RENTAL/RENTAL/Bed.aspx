<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Bed.aspx.cs" Inherits="RENTAL.Bed" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <style type="text/css">
    .auto-style2 {
        margin-right: 124;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
       <br />
    <br />
    <hr />
    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="linkclick">view wishlist</asp:LinkButton>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="PId" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" CssClass="datalistinfo" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound">
        <ItemTemplate>
     
    <div class="datalist">
            <div class="imagecss">
                <asp:Image ID ="image1" runat="server" ImageUrl ='<%# Eval("PImage") %>' />
                <div class="quickview" id="quickview">Quick View</div>
            </div>
                
           <div class="nameprice">
                    <asp:Label ID="PNameLabel" runat="server" Text='<%# Eval("PName") %>' CssClass="name" />
                 <br />
                <h3>Price :<span><asp:Label ID="PPriceLabel" runat="server" Text='<%# Eval("PPrice") %>' Cssclass="price"/></span>/Mon</h3>
           </div>    
     </div>
            <!--POPUP-->

    <div class="product-view" id="Productview">
        <span class="close">&times;</span>
        <div class="product-big-image">
            <asp:Label ID="Label4" runat="server" Text='<%# Eval("PId") %>' Visible="false" />
            <asp:Image ID="Image2" runat="server"  ImageUrl ='<%# Eval("PImage") %>' />
        </div>
        <div class="product-big-desc" id="ddl1">
           <h2> <asp:Label ID="Label2" runat="server" Text='<%# Eval("PName") %>' CssClass="name" /></h2>
            <br />
           
            <asp:DropDownList ID="ddlmonth" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drop_down_SelectedIndexChanged">
                <asp:ListItem Text="3" value="3"></asp:ListItem>
                <asp:ListItem Text="6" value="6"></asp:ListItem>
                <asp:ListItem Text="9" value="9"></asp:ListItem>
                <asp:ListItem Text="12" value="12"></asp:ListItem>
                <asp:ListItem Text="18" value="18"></asp:ListItem>
                <asp:ListItem Text="24" value="24" Selected="True"></asp:ListItem>
            </asp:DropDownList>   
            <h3>Price :<span><asp:Label ID="Label1" runat="server" Text='<%# Eval("PPrice") %>' Cssclass="price"/></span>/Mon</h3>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("PId")%>' CommandName="addtowishlist" />
           
            <br />
            <asp:Button ID="Button1" runat="server" Text="Click to Buy" CssClass="buybutton" />
        </div>
    </div>
            <!--call th popup-->
        <script type="text/javascript"  src="js/jquery-2.1.3.min.js"></script>
        <script type="text/javascript">
          $(document).ready(function () {
                $('.quickview').click(function () {
                    var $productview = $(this).parent().parent().next();
                    $($productview).fadeIn('1000');
                });
              $('.close').click(function () {
                  var $closebtn = $(this).parent();
                  $($closebtn).fadeOut('800');
              });
            });
          </script>
           

           
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FURNITUREConnectionString4 %>" SelectCommand="GetProductDetails" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="CityName" SessionField="CityName" Type="String" />
            <asp:Parameter DefaultValue="bedroom" Name="PCategory" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <script type="text/html"  src="js/jquery-2.1.3.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('.quickview').click(function () {
                    var $productview = $(this).parent().parent().next();
                    $($productview).fadeIn('1000');
                });
                $('.close-btn').click(function () {
                    var $closebtn = $(this).parent();
                    $($closebtn).fadeout('800');

                });
            });
            </script>

    
    
</asp:Content>
