<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddtoCart.aspx.cs" Inherits="RENTAL.AddtoCart1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div  class="cart">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Bed.aspx">continue </asp:HyperLink>
            <br />
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">LinkButton</asp:LinkButton>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <br />
            <br />
             <div class="container-fluid">
                 <div class="card" >
                 <div class="card-body"><center>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" ShowFooter="True" Height="146px" Width="1000" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellSpacing="30" GridLines="Horizontal" CellPadding="20" EmptyDataText="No Records Found" BorderStyle="Dashed">
                <Columns>
                      <asp:BoundField DataField="sno" HeaderText="srno" />
                    <asp:BoundField DataField="PId" HeaderText="ProductId" Visible="False" />

                    <asp:BoundField DataField="PName" HeaderText="ProductName" />
                    <asp:ImageField DataImageUrlField="PImage" HeaderText="Product image" ItemStyle-Width="200" ItemStyle-Height="100">
<ItemStyle Height="100px" Width="200px"></ItemStyle>
                    </asp:ImageField>
                     <asp:BoundField DataField="month" HeaderText="Month" />
                    <asp:BoundField DataField="PPrice" HeaderText="Price" />
                    <asp:BoundField DataField="totalprice" HeaderText="Total price" />
                     <asp:BoundField DataField="quantity1" HeaderText="Quantity" SortExpression="quantity1" />
                 
                    <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" />
                  
                     
                      <asp:CommandField SelectText="Modify" ShowSelectButton="True" />
                  
                     
                     
                     
                </Columns>
                <EditRowStyle Height="50px" />
                <HeaderStyle Height="50px" />
            </asp:GridView>
</center>
                     
            <asp:LinkButton ID="LinkButton2" runat="server"></asp:LinkButton>
            
            <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Clear Cart</asp:LinkButton>
            <br />
            <br />
            <asp:Label ID="Label15" runat="server"></asp:Label>
            <br />
            <asp:Button ID="Button5" runat="server" Height="36px" OnClick="Button5_Click" Text="Place Order" Width="151px" />
            <br />
                     </div>
                                          </div>

             </div>
             
          
          <asp:Label ID="checkuser" runat="server"></asp:Label>
            <asp:Panel ID="Panel1" runat="server" Height="267px" Width="434px" Style="display:none" BackColor="#FF66FF">
                <br />
                <br />
                <br />
               
              <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <asp:Label ID="Label4" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="Label1" runat="server" Text="Product Name"></asp:Label>
                        <asp:Label ID="Label3" runat="server" ></asp:Label>
                        <br />
                <asp:Label ID="Label8" runat="server" Text="Month"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                </asp:DropDownList>
               <br />
                        <br />
                <asp:Label ID="Label9" runat="server" Text="Price"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label12" runat="server"></asp:Label>
                <br />
                <br />
                <br />
                          <asp:Label ID="Label14" runat="server" Text="Quantity"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList2" runat="server"  OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                </asp:DropDownList>
              <br />
                <br />
                <asp:Label ID="Label11" runat="server" Text="Total Price"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label13" runat="server"></asp:Label>
                <br />

              <asp:Label ID="Label5" runat="server" Text="Order Date" Visible="False"></asp:Label>
                        <asp:Label ID="Label6" runat="server" Visible="False"></asp:Label><br />
                        <asp:Label ID="Label7" runat="server" Text="Return Date" Visible="False"></asp:Label>
                        <asp:Label ID="Label10" runat="server" Visible="False"></asp:Label>


              
               
                       

                          </ContentTemplate>
                    </asp:UpdatePanel>
                <asp:Button ID="Button3" runat="server" Text="Update" OnClick="Button3_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button4" runat="server" Text="Close" />
                      
            </asp:Panel>
         <ajaxtoolkit:modalpopupextender ID="ModalPopupExtender1" runat="server"  TargetControlID="LinkButton2" PopupControlID="Panel1" CancelControlID="Button2" BackgroundCssClass="modalBackground" ></ajaxtoolkit:modalpopupextender>
            <br />
            <br />
        </div>




</asp:Content>
