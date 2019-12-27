<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="RENTAL.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
            height: 226px;
        }
        .auto-style4 {
            height: 38px;
            text-align: center;
        }
        .auto-style5 {
            height: 51px;
        }
        .auto-style6 {
            height: 45px;
            text-align: center;
        }
        .auto-style7 {
            text-align: center;
        }
        .auto-style8 {
            margin-right: 244;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
       
     <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">LinkButton</asp:LinkButton>
        &nbsp;&nbsp;&nbsp; <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">LinkButton</asp:LinkButton>
        &nbsp;&nbsp;&nbsp; <asp:LinkButton ID="LinkButton3" runat="server">LinkButton</asp:LinkButton>
         &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">LinkButton</asp:LinkButton>
    </p>
    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
    <asp:DataList ID="DataList1" runat="server" CssClass="auto-style8" DataSourceID="SqlDataSource1" RepeatColumns="2" RepeatDirection="Horizontal">
        <ItemTemplate>
            <table class="auto-style2">
                <tr>
                    <td class="auto-style6">Product id
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("primage") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="296px" ImageUrl="~/Imag/5.jpg" Width="213px" />
                    </td>
                </tr>
            </table>
            <br />
        </ItemTemplate>
    </asp:DataList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:demoConnectionString %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:demoConnectionString %>" SelectCommand="SELECT * FROM [Product] WHERE ([category] = @category)">
        <SelectParameters>
            <asp:QueryStringParameter Name="category" QueryStringField="cat" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>
