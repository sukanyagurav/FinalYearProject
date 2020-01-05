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
    <asp:DataList ID="DataList1" runat="server" DataKeyField="PId" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal">
        <ItemTemplate>
       <div class="datalist">
            <div class="imagecss">
                 <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("PImage") %>' />
                  <div class="quickview">Quick View</div>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FURNITUREConnectionString4 %>" SelectCommand="GetProductDetails" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="CityName" SessionField="CityName" Type="String" />
            <asp:Parameter DefaultValue="Office furniture" Name="PCategory" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>




</asp:Content>
