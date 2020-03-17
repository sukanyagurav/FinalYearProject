    `   <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="RENTAL.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   

  

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <br />
    <br />
    <br />
     
    <style id="6">
        .carousel-inner > .item {
   height: 500px;
}

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
    </style>
    
    <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="2000">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
     <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" >
    <div class="item active">
      <img src="Imag/download (1).jpg" alt="Amazon Echo" style="width:100%;" class="center-block"/>
    </div>

    <div class="item">
      <img src="Imag/2.png" alt="PS4"  style="width:100%;" />
    </div>

    <div class="item">
      <img src="Imag/3.jpg" alt="Samsung"  style="width:100%;" />
    </div>
      <div class="item">
      <img src="Imag/4.jpg" alt="Samsung" style="width:100%;"/>
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
     <br />
    <br />
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
<div class="container">
    <div class="row">
        <div class="col-lg-4">
            <div class="card">
                <asp:Image ID="Image1" runat="server" ImageUrl="image/study.jpg" />
                <div class="card-body">
                    <div class="card-title">HAVE EVERYTHING, WITHOUT BUYING</div>
                    <p class="card-text">

                       Bed or sofa? It’s not a choice anymore. With our wallet-friendly packages, you can have that perfect home at a fraction of the cost and effort.
                    </p>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
             <div class="card">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/bedroom/belle_single_bed.jpg" />
                <div class="card-body">
                    <div class="card-title">CHANGE, AS YOUR NEEDS EVOLVE</div>
                    <p class="card-text">

                      
Upgrade as you evolve. Relocate for free. Pause your subscription at will. Things you can never do if you buy furniture.     </p>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
             <div class="card">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/bedroom/belle_single_bed.jpg" />
                <div class="card-body">
                    <div class="card-title">HAVE EVERYTHING, WITHOUT BUYING</div>
                    <p class="card-text">

                       Bed or sofa? It’s not a choice anymore. With our wallet-friendly packages, you can have that perfect home at a fraction of the cost and effort.
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

</asp:Content>

