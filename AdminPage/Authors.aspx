<%@ Page Title="Authors Page" Language="C#" MasterPageFile="Admin.Master" AutoEventWireup="true" CodeFile="Authors.aspx.cs" Inherits="Authors" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" CssClass="row" runat="server">
        <asp:Panel ID="Panel2" CssClass="col-md-5" runat="server">
            <asp:GridView ID="GridViewAuthor" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="author_id" DataSourceID="AuthorTB" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="author_id" HeaderText="author_id" ReadOnly="True" SortExpression="author_id" />
                    <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
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
            <asp:SqlDataSource ID="AuthorTB" runat="server" ConnectionString="<%$ ConnectionStrings:NagarBookStore %>" DeleteCommand="DELETE FROM [Authors] WHERE [author_id] = @author_id" InsertCommand="INSERT INTO [Authors] ([author_id], [author_name]) VALUES (@author_id, @author_name)" SelectCommand="SELECT * FROM [Authors]" UpdateCommand="UPDATE [Authors] SET [author_name] = @author_name WHERE [author_id] = @author_id">
                <DeleteParameters>
                    <asp:Parameter Name="author_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="author_id" Type="Int32" />
                    <asp:Parameter Name="author_name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="author_name" Type="String" />
                    <asp:Parameter Name="author_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        <asp:Panel ID="Panel3" CssClass="col-md-5" runat="server">
            New Author
            <asp:Panel ID="Panel4" CssClass="row" runat="server">
                <asp:Panel ID="Panel5" CssClass="col-md-5" runat="server">
                    <asp:Label ID="Label1" runat="server" Text="Author Name"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="Panel6" CssClass="col-md-5" runat="server">
                    <asp:TextBox ID="txtAuthorName" runat="server"></asp:TextBox>
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
