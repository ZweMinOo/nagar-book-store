<%@ Page Title="Categories Page" Language="C#" MasterPageFile="Admin.Master" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="Categories" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" CssClass="row" runat="server">
        <asp:Panel ID="Panel2" CssClass="col-md-5" runat="server">
            <asp:GridView ID="GridViewCategory" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="category_id" DataSourceID="CategoryTB" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="category_id" HeaderText="category_id" ReadOnly="True" SortExpression="category_id" />
                    <asp:BoundField DataField="category_name" HeaderText="category_name" SortExpression="category_name" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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
            <asp:SqlDataSource ID="CategoryTB" runat="server" ConnectionString="<%$ ConnectionStrings:NagarBookStore %>" DeleteCommand="DELETE FROM [Categories] WHERE [category_id] = @category_id" SelectCommand="SELECT * FROM [Categories]" UpdateCommand="UPDATE [Categories] SET [category_name] = @category_name WHERE [category_id] = @category_id">
                <DeleteParameters>
                    <asp:Parameter Name="category_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="category_id" Type="Int32" />
                    <asp:Parameter Name="category_name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="category_name" Type="String" />
                    <asp:Parameter Name="category_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        <asp:Panel ID="Panel3" CssClass="col-md-5" runat="server">
            New Category
            <asp:Panel ID="Panel4" CssClass="row" runat="server">
                <asp:Panel ID="Panel5" CssClass="col-md-5" runat="server">
                    <asp:Label ID="Label1" runat="server" Text="Category Name"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="Panel6" CssClass="col-md-5" runat="server">
                    <asp:TextBox ID="txtCategoryName" runat="server"></asp:TextBox>
                </asp:Panel>
            </asp:Panel>
            <asp:Panel ID="Panel7" CssClass="row" runat="server">
                <asp:Panel ID="Panel8" CssClass="col-md-5" runat="server">
            
                </asp:Panel>
                <asp:Panel ID="Panel9" CssClass="col-md-5" runat="server">
                    <asp:Button ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click" />
                </asp:Panel>
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
</asp:Content>
