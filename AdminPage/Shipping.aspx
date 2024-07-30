<%@ Page Title="Shipping Page" Language="C#" MasterPageFile="Admin.Master" AutoEventWireup="true" CodeFile="Shipping.aspx.cs" Inherits="Shipping" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" CssClass="row" runat="server">
        <asp:Panel ID="Panel2" CssClass="col-md-5" runat="server">
            <asp:GridView ID="GridViewShipping" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ship_id" DataSourceID="ShippingTB" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ship_id" HeaderText="ship_id" InsertVisible="False" ReadOnly="True" SortExpression="ship_id" />
                    <asp:BoundField DataField="ship_region" HeaderText="ship_region" SortExpression="ship_region" />
                    <asp:BoundField DataField="ship_city" HeaderText="ship_city" SortExpression="ship_city" />
                    <asp:BoundField DataField="ship_fee" HeaderText="ship_fee" SortExpression="ship_fee" />
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
            <asp:SqlDataSource ID="ShippingTB" runat="server" ConnectionString="<%$ ConnectionStrings:NagarBookStore %>" DeleteCommand="DELETE FROM [Shipping] WHERE [ship_id] = @ship_id" InsertCommand="INSERT INTO [Shipping] ([ship_region], [ship_city], [ship_fee]) VALUES (@ship_region, @ship_city, @ship_fee)" SelectCommand="SELECT * FROM [Shipping]" UpdateCommand="UPDATE [Shipping] SET [ship_region] = @ship_region, [ship_city] = @ship_city, [ship_fee] = @ship_fee WHERE [ship_id] = @ship_id">
                <DeleteParameters>
                    <asp:Parameter Name="ship_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ship_region" Type="String" />
                    <asp:Parameter Name="ship_city" Type="String" />
                    <asp:Parameter Name="ship_fee" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ship_region" Type="String" />
                    <asp:Parameter Name="ship_city" Type="String" />
                    <asp:Parameter Name="ship_fee" Type="Int32" />
                    <asp:Parameter Name="ship_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        <asp:Panel ID="Panel3" CssClass="col-md-5" runat="server">
            New Shipping
            <asp:Panel ID="Panel4" CssClass="row" runat="server">
                <asp:Panel ID="Panel5" CssClass="col-md-5" runat="server">
                    <asp:Label ID="Label1" runat="server" Text="Region"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="Panel6" CssClass="col-md-5" runat="server">
                    <asp:TextBox ID="txtRegion" runat="server"></asp:TextBox>
                </asp:Panel>
            </asp:Panel>
             <asp:Panel ID="Panel10" CssClass="row" runat="server">
                <asp:Panel ID="Panel11" CssClass="col-md-5" runat="server">
                    <asp:Label ID="Label2" runat="server" Text="City"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="Panel12" CssClass="col-md-5" runat="server">
                    <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                </asp:Panel>
            </asp:Panel>
             <asp:Panel ID="Panel13" CssClass="row" runat="server">
                <asp:Panel ID="Panel14" CssClass="col-md-5" runat="server">
                    <asp:Label ID="Label3" runat="server" Text="Fee"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="Panel15" CssClass="col-md-5" runat="server">
                    <asp:TextBox ID="txtFee" runat="server"></asp:TextBox>
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
