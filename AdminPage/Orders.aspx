<%@ Page Title="Orders Page" Language="C#" MasterPageFile="Admin.Master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" CssClass="row" runat="server">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="OrderTB" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="order_id" HeaderText="order_id" InsertVisible="False" ReadOnly="True" SortExpression="order_id" />
                <asp:BoundField DataField="user_id" HeaderText="user_id" InsertVisible="False" ReadOnly="True" SortExpression="user_id" />
                <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                <asp:BoundField DataField="ordered_date" HeaderText="ordered_date" SortExpression="ordered_date" />
                <asp:BoundField DataField="ship_address" HeaderText="ship_address" SortExpression="ship_address" />
                <asp:BoundField DataField="ship_region" HeaderText="ship_region" SortExpression="ship_region" />
                <asp:BoundField DataField="ship_city" HeaderText="ship_city" SortExpression="ship_city" />
                <asp:BoundField DataField="shipped_date" HeaderText="shipped_date" SortExpression="shipped_date" />
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
        <asp:SqlDataSource ID="OrderTB" runat="server" ConnectionString="<%$ ConnectionStrings:NagarBookStore %>" SelectCommand="SELECT o.order_id,u.user_id,u.username,o.ordered_date,o.ship_address,s.ship_region,s.ship_city,o.shipped_date FROM Users AS u INNER JOIN Orders AS o ON u.user_id = o.user_id INNER JOIN Shipping AS s ON s.ship_id = o.ship_id"></asp:SqlDataSource>
    </asp:Panel>
</asp:Content>
