<%@ Page Title="Books page" Language="C#" MasterPageFile="Admin.Master" AutoEventWireup="true" CodeFile="Books.aspx.cs" Inherits="Books" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" CssClass="row" runat="server">
        <asp:Panel ID="Panel2" CssClass="col-md-4" runat="server">
            <asp:GridView ID="GridViewBook" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="book_id" DataSourceID="BooksTB" ForeColor="#333333" GridLines="None" OnRowDeleting="GridViewBook_OnRowDeleting" OnRowUpdating="GridViewBook_OnRowUpdating">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="book_id" HeaderText="book_id" ReadOnly="True" SortExpression="book_id" />
                    <asp:TemplateField HeaderText="cover_image" SortExpression="cover_image">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Width="120px" Height="150px" Text='<%# Bind("cover_image") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Width="120px" Height="150px" ImageUrl='<%# Eval("cover_image") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="instock" HeaderText="instock" SortExpression="instock" />
                    <asp:BoundField DataField="publication_year" HeaderText="publication_year" SortExpression="publication_year" />
                    <asp:TemplateField HeaderText="category_name" SortExpression="category_name">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEditCategory" runat="server" DataSourceID="Category" DataTextField="category_name" DataValueField="category_id">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("category_name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="author_name" SortExpression="author_name">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEditAuthor" runat="server" DataSourceID="Author" DataTextField="author_name" DataValueField="author_id">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("author_name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
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
            <asp:SqlDataSource ID="BooksTB" runat="server" ConnectionString="<%$ ConnectionStrings:NagarBookStore %>" SelectCommand="SELECT b.book_id,b.cover_image, b.title, b.price, b.instock, b.publication_year, c.category_name, a.author_name FROM Authors AS a INNER JOIN Books AS b ON a.author_id = b.author_id INNER JOIN Categories AS c ON c.category_id = b.category_id" UpdateCommand="" DeleteCommand="" InsertCommand=""></asp:SqlDataSource>
        </asp:Panel>
    </asp:Panel>
        <asp:Panel ID="Panel4" CssClass="row" runat="server">
                <asp:Panel ID="Panel5" CssClass="col-md-6" runat="server">
                    <asp:Label ID="Label1" runat="server" Text="Cover Image"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="Panel6" CssClass="col-md-6" runat="server">
                    <asp:FileUpload ID="fuCoverImage" runat="server" />
                </asp:Panel>
        </asp:Panel>
        <asp:Panel ID="Panel7" CssClass="row" runat="server">
                <asp:Panel ID="Panel8" CssClass="col-md-6" runat="server">
                    <asp:Label ID="Label2" runat="server" Text="Title"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="Panel9" CssClass="col-md-6" runat="server">
                    <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                </asp:Panel>
        </asp:Panel>
        <asp:Panel ID="Panel3" CssClass="row" runat="server">
                <asp:Panel ID="Panel10" CssClass="col-md-6" runat="server">
                    <asp:Label ID="Label3" runat="server" Text="Price"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="Panel11" CssClass="col-md-6" runat="server">
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                </asp:Panel>
            </asp:Panel>
        <asp:Panel ID="Panel12" CssClass="row" runat="server">
                <asp:Panel ID="Panel13" CssClass="col-md-6" runat="server">
                    <asp:Label ID="Label4" runat="server" Text="Instock"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="Panel14" CssClass="col-md-6" runat="server">
                    <asp:TextBox ID="txtInstock" runat="server"></asp:TextBox>
                </asp:Panel>
        </asp:Panel>
        <asp:Panel ID="Panel24" CssClass="row" runat="server">
                <asp:Panel ID="Panel25" CssClass="col-md-6" runat="server">
                    <asp:Label ID="Label7" runat="server" Text="Publication Year"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="Panel26" CssClass="col-md-6" runat="server">
                    <asp:TextBox ID="txtPublicationYear" runat="server"></asp:TextBox>
                </asp:Panel>
        </asp:Panel>
        <asp:Panel ID="Panel15" CssClass="row" runat="server">
                <asp:Panel ID="Panel16" CssClass="col-md-6" runat="server">
                    <asp:Label ID="Label5" runat="server" Text="Category"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="Panel17" CssClass="col-md-6" runat="server">
                    <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="Category" DataTextField="category_name" DataValueField="category_id" style="width: 83px"></asp:DropDownList>
                    <asp:SqlDataSource ID="Category" runat="server" ConnectionString="<%$ ConnectionStrings:NagarBookStore %>" SelectCommand="SELECT * FROM [Categories]"></asp:SqlDataSource>
                </asp:Panel>
        </asp:Panel>
        <asp:Panel ID="Panel18" CssClass="row" runat="server">
                <asp:Panel ID="Panel19" CssClass="col-md-6" runat="server">
                    <asp:Label ID="Label6" runat="server" Text="Author"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="Panel20" CssClass="col-md-6" runat="server">
                    <asp:DropDownList ID="ddlAuthor" runat="server" DataSourceID="Author" DataTextField="author_name" DataValueField="author_id"></asp:DropDownList>
                    <asp:SqlDataSource ID="Author" runat="server" ConnectionString="<%$ ConnectionStrings:NagarBookStore %>" SelectCommand="SELECT * FROM [Authors]"></asp:SqlDataSource>
                </asp:Panel>
        </asp:Panel>
        <asp:Panel ID="Panel21" CssClass="row" runat="server">
                <asp:Panel ID="Panel22" CssClass="col-md-6" runat="server">

                </asp:Panel>
                <asp:Panel ID="Panel23" CssClass="col-md-6" runat="server">
                    <asp:Button ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click" />
                </asp:Panel>
       </asp:Panel>

</asp:Content>
