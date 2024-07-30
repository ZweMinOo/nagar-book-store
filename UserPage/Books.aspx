<%@ Page Title="Books" Language="C#" MasterPageFile="User.Master" AutoEventWireup="true" CodeFile="Books.aspx.cs" Inherits="Books" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <asp:Panel ID="Panel1" CssClass="row" runat="server">
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnTitleSearch" runat="server" Text="Title Search" OnClick="btnTitleSearch_Click" />
        <asp:Button ID="btnCategorySearch" runat="server" Text="Category Search" OnClick="btnCategorySearch_Click" />
        <asp:Button ID="btnAuthorSearch" runat="server" Text="Author Search" OnClick="btnAuthorSearch_Click" />
        <asp:Button ID="btnShowAll" runat="server" OnClick="btnShowAll_Click" style="height: 26px" Text="Show All" />
    </asp:Panel>
    <br />
    <asp:Panel ID="Panel2" CssClass="row" runat="server">
        <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataKeyField="book_id" DataSourceID="BooksTB" ForeColor="#333333" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False" GridLines="Horizontal"  OnItemCommand="DataList1_ItemCommand" RepeatDirection="Horizontal">
            <AlternatingItemStyle BackColor="White" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#339933" Font-Bold="True" ForeColor="White" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
            <ItemStyle BackColor="#E3EAEB" />
            <ItemTemplate>
                book_id:
                <asp:Label ID="book_idLabel" runat="server" Text='<%# Eval("book_id") %>' />
                <br />
                <asp:Image ID="Image1" runat="server" Width="120px" Height="150px" ImageUrl='<%# Eval("cover_image") %>' />
                <br />
                title:
                <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                <br />
                price:
                <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                <br />
                instock:
                <asp:Label ID="instockLabel" runat="server" Text='<%# Eval("instock") %>' />
                <br />
                publication_year:
                <asp:Label ID="publication_yearLabel" runat="server" Text='<%# Eval("publication_year") %>' />
                <br />
                category_name:
                <asp:Label ID="category_nameLabel" runat="server" Text='<%# Eval("category_name") %>' />
                <br />
                author_name:
                <asp:Label ID="author_nameLabel" runat="server" Text='<%# Eval("author_name") %>' />
                <br />
                <asp:Button ID="btnAddToCart" CommandName="AddToCart" CssClass="btn btn-primary" runat="server" Text="Add to Cart" />
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="BooksTB" runat="server" ConnectionString="<%$ ConnectionStrings:NagarBookStore %>" SelectCommand="SELECT b.book_id,b.cover_image, b.title, b.price, b.instock, b.publication_year, c.category_name, a.author_name FROM Authors AS a INNER JOIN Books AS b ON a.author_id = b.author_id INNER JOIN Categories AS c ON c.category_id = b.category_id"></asp:SqlDataSource>
    </asp:Panel>
</asp:Content>
