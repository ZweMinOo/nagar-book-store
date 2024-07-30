<%@ Page Title="Cart" Language="C#" MasterPageFile="User.Master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <asp:Button ID="btnOrder" runat="server" Text="Order" CssClass="btn btn-success" OnClick="btnOrder_Click" />
    <asp:Panel ID="pnlOrder" runat="server" CssClass="row" Visible="False">
        <div class="row">
            <div class="col-md-4">
                <asp:Label ID="Label2" runat="server" Text="Ship region and city"></asp:Label>
            </div>
            <div class="col-md-4">
                <asp:DropDownList ID="ddlShipDetails" runat="server" DataSourceID="Ship" DataTextField="address" DataValueField="ship_id" OnSelectedIndexChanged="ddlShipDetails_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True">
                    <asp:ListItem Value="-1" >---- Select  Region And City ----</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="Ship" runat="server" ConnectionString="<%$ ConnectionStrings:NagarBookStore %>" SelectCommand="SELECT ship_id, CONCAT (ship_region,', ' ,ship_city) AS address, ship_fee FROM Shipping"></asp:SqlDataSource>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <asp:Label ID="Label3" runat="server" Text="Ship fee"></asp:Label>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txtShipFee" runat="server" ReadOnly="True">0</asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <asp:Label ID="Label4" runat="server" Text="Ship address"></asp:Label>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txtShipAddress" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel Check Out" OnClick="btnCancel_Click" />
            </div>
            <div class="col-md-4">
                <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" OnClick="btnCheckOut_Click" />
            </div>
        </div>
    </asp:Panel>
    <asp:GridView ID="GridViewCart" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="CartTB" OnRowUpdating="GridViewCart_OnRowUpdating" OnRowDeleting="GridViewCart_OnRowDeleting" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="book_id" HeaderText="book_id" InsertVisible="False" ReadOnly="True" SortExpression="book_id" />
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            <asp:TemplateField HeaderText="cover_image" SortExpression="cover_image">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" Width="120px" Height="130px" runat="server" Text='<%# Bind("cover_image") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" Width="120px" Height="130px" runat="server" ImageUrl='<%# Eval("cover_image") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="quantity" SortExpression="quantity">
                <EditItemTemplate>
                    <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("quantity") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("quantity") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="CartTB" runat="server"  ConnectionString="<%$ ConnectionStrings:NagarBookStore %>" SelectCommand="SELECT b.book_id, b.title, b.cover_image, c.quantity, b.price FROM Users AS u INNER JOIN Cart AS c ON u.user_id = c.user_id INNER JOIN Books AS b ON c.book_id = b.book_id"></asp:SqlDataSource>

</asp:Content>
