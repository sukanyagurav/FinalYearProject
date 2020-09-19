<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.Master" AutoEventWireup="true" CodeBehind="demo.aspx.cs" Inherits="RENTAL.demo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="bootstrap-4.3.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
   
    <script src="bootstrap-4.3.1/dist/js/bootstrap.min.js"></script>

   <br />
    <br />
    <br />

     
    <style id="6">
  
     .catwrapper{
         width:auto;
         margin-top:120px;
         display:flex;
         justify-content:center;
         text-align:center;
         flex-wrap:wrap;

     }
        
     .catwrapper .item{
         width:220px;
         height:250px;
         margin:10px;
         background:#fff;
         padding:30px 20px 65px;
         border: 1px solid black;
         position:relative;

     }
     .catwrapper .item h3{
         letter-spacing:2px;
     }
     .catwrapper .item img{
         display:block;
         margin:10px auto;

     }
     .card{
    min-height:100%;
          }
        .card:hover {
            --webkit-box-shadow: -1px 9px 40px -12px rgba(0,0,0,0.75);
            --moz-box-shadow: -1px 9px 40px -12px rgba(0,0,0,0.75);
            box-shadow: -1px 9px 40px -12px rgba(0,0,0,0.75);
        }
    </style>
    <br />


   
     <br />
    <br />
    <br /><!--categories-->
 <div class="catwrapper" style="box-sizing:border-box;margin:0; padding :0;">
    <div class="item item_1">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Home Furniture.aspx">
            <img src="Imag/package.JPG"  height="100" width="100" /><br />
           <h3>Package</h3>
       </asp:HyperLink>
    </div>
     <div class="item item_2">
         <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="HomeFurniture.aspx">
            <img src="Imag/HomeFurniture.JPG"  height="100" width="100" /><br />
            <h3>Home Furniture</h3>
      </asp:HyperLink>
    </div>
     <div class="item item_3">
         <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="Office Furniture.aspx">
            <img src="Imag/OfficeFurniture.JPG"  height="100" width="100" />&nbsp;&nbsp;
              <h3>Office Furniture</h3>
        </asp:HyperLink>
    </div>
     <div class="item item_4">
         <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="Home F.aspx">
            <img src="Imag/Appliance.JPG"  height="100" width="100" /><br />
            <h3>Appliance</h3>
      </asp:HyperLink>
    </div>


</div>
    <hr />
<center>    <h2>WHY YOU SHOULD RENT !</h2></center>
<div class="container">
    <div class="row">
        <div class="col-lg-4 ">
        
            <div class="card">
                 <asp:Image ID="Image1" runat="server" ImageUrl="homepageimg/11.jpg" CssClass="card-img-top" />
                <div class="card-body">
                   <h3>
                    HAVE EVERYTHING, WITHOUT BUYING</h3>
                      <h4> <span>
                                           Bed or sofa? It’s not a choice anymore. With our wallet-friendly packages, you can have that perfect home at a fraction of the cost and effort.
         

              </span>
                          </h4>
                    </div>
            </div>
        </div>
        <div class="col-lg-4 ">
             <div class="card">
                  <asp:Image ID="Image2" runat="server" ImageUrl="homepageimg/22.jpg"  CssClass="card-img-top"/>
              
                  <div class="card-body">
                     <h3>                  CHANGE, AS YOUR NEEDS EVOLVE
                 </h3>
<h4><span>Upgrade as you evolve. Relocate for free. Pause your subscription at will. Things you can never do if you buy furniture.     </p>
   </span>
 </h4>            </div>
            </div>
        </div>
        <div class="col-lg-4" >
             <div class="card" >
                 <asp:Image ID="Image3" runat="server" ImageUrl="homepageimg/33.jpg" CssClass="card-img-top"/>
            
                   <div class="card-body">
                        
                    <h3>SWAP AND UPGRADE</h3>
                   <h4><span>
                       Upgrading your home? Tired of the same look? Bored with the furniture? Our free swap ensures that your home constantly evolves with your needs. And tastes.
                           </span></h4>                </div>
            </div>
        </div>
    </div>
</div>

</asp:Content>

