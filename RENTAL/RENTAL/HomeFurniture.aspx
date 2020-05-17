<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HomeFurniture.aspx.cs" Inherits="RENTAL.HomFurniture" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">

     <link href="bootstrap-4.3.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
   
    <script src="bootstrap-4.3.1/dist/js/bootstrap.min.js"></script>

  <style>
      .card{
          box-shadow:0px 7px 10px rgba(0,0,0,0.5);
          transition:0.5s ease-in-out;
    min-height:100%;
          }
      .card:hover{
          transform:translateY(20px);

      }
      .card:before{
          content:"";
          position:absolute;
          top:0;
          left:0;
          display:block;
          opacity:0;
      }
      .card:hover::before{
          opacity:1;

      }
      .col{
          display:table-cell;
      }
      
  </style>
    <br />
    <br />
    <br />
    <br />
    <hr />

    <div class="container">
        <div  class="row">
            <div class="col-lg py-2" >
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">

        <div class="card">
            <center>  <asp:Image src="Imag/bed.JPG"  height="100" width="100" runat="server" /> 
  </center>
            <div class="card-body">
                              <h3>Bedroom</h3>
       
                     </div>
       </div>
             </asp:LinkButton>
</div>
            <div class="col-lg py-2">
  <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">
 
                <div class="card">
                     <center> <asp:Image src="Imag/living.JPG"  height="100" width="100" runat="server"/>         
                   </center> <div class="card-body">
                            <h3>Living Room</h3>
    
                        </div>
            </div>
                      </asp:LinkButton>
              </div>          
                   <div class="col-lg py-2">
                               <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">
   
                          <div class="card">
                            <center><asp:Image src="Imag/dining.JPG"  height="100" width="100" runat="server"/>
                  </center><div class="card-body">
                    <center>  <h3>Dining Room</h3></center>
        
                       </div>
                              </div>
         </asp:LinkButton>
                              </div>
                     <div class="col-lg py-2">
                          <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">

                         <div class="card">
                           <center><asp:Image src="Imag/study.JPG"  height="100" width="100" runat="server"/>
                             </center><div class="card-body">
                                 
                                    <h3>Study Room</h3>
                   
                             </div>
                         </div>
        </asp:LinkButton>

                     </div>  
            <div class="col-lg py-2">
                        <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click">

                <div class="card">
                    <center> <asp:Image src="Imag/storage.JPG"  height="100" width="100" runat="server"  />
          </center>
                    <div class="card-body">
         <h3>Storage</h3>
                  
                        </div>
                    </div>
                            </asp:LinkButton>

            </div>       
            
                       
            </div>
        </div>
    

   

</asp:Content>
