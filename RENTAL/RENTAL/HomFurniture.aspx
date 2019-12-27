<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HomFurniture.aspx.cs" Inherits="RENTAL.HomFurniture" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <style>

    .catwrapper3{
         width:auto;
         margin-top:120px;
         display:flex;
         justify-content:center;
         text-align:center;
         flex-wrap:wrap;
     }
        
     .catwrapper3 .item{
         width:180px;
         height:100px;
         margin:10px;
         background:#fff;
         padding:30px 20px 65px;
         border: 1px solid black;
         position:relative;

     }
     .catwrapper3 .item h3{
         letter-spacing:2px;
     }
     .catwrapper3 .item img{
         display:block;
         margin:10px auto;

     }
    </style>
    
     </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />

    <div class="catwrapper3" style="box-sizing:border-box;margin:0; padding :0;">
    <div class="item item1_1">
        <asp:LinkButton ID="LinkButton1" runat="server" >
            <img src="Imag/bed.JPG"  height="100" width="100" /><br />
           <h3>Bedroom</h3>
      </asp:LinkButton>
    </div>
     <div class="item item1_2">
         <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Home Furniture.aspx">
            <img src="Imag/living.JPG"  height="100" width="100" /><br />
            <h3>Living Room</h3>
      </asp:HyperLink>
    </div>
     <div class="item item1_3">
         <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Home Furniture.aspx">
            <img src="Imag/dining.JPG"  height="100" width="100" />&nbsp;&nbsp;
              <h3>Dining Room</h3>
        </asp:HyperLink>
    </div>
     <div class="item item1_4">
         <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Home Furniture.aspx">
            <img src="Imag/study.JPG"  height="100" width="100" /><br />
            <h3>Study Room</h3>
      </asp:HyperLink>
    </div>
        <div class="item item1_5">
         <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Home Furniture.aspx">
            <img src="Imag/storage.JPG"  height="100" width="100" /><br />
            <h3>Storage</h3>
             </asp:HyperLink>
           </div>

</div>

</asp:Content>
