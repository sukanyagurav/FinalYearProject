<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HomeFurniture.aspx.cs" Inherits="RENTAL.HomFurniture" %>
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
    <hr />
    <br />
    <br />
    <br />
    <br />

 <div class="catwrapper3" style="box-sizing:border-box;margin:0; padding :0;">
    <div class="item item1_1">
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">
            <img src="Imag/bed.JPG"  height="100" width="100" /><br />
            <h3>Bedroom</h3>
        </asp:LinkButton>
    </div>
     <div class="item item1_2">
         <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">
            <img src="Imag/living.JPG"  height="100" width="100" /><br />
            <h3>Living Room</h3>
      </asp:LinkButton>
    </div>
     <div class="item item1_3">
         <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">
            <img src="Imag/dining.JPG"  height="100" width="100" />
              <h3>Dining Room</h3>
         </asp:LinkButton>
     </div>
     <div class="item item1_4">
         <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">
            <img src="Imag/study.JPG"  height="100" width="100" /><br />
            <h3>Study Room</h3>
        </asp:LinkButton>
     </div>
        <div class="item item1_5">
            <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click">
            <img src="Imag/storage.JPG"  height="100" width="100" /><br />
            <h3>Storage</h3>
            </asp:LinkButton>
        </div>

</div>
   


</asp:Content>
