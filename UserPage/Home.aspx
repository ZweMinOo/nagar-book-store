<%@ Page Title="Home Page" Language="C#" MasterPageFile="User.Master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" CssClass="row" runat="server">
    <asp:Label ID="Label1" runat="server" CssClass="home-text" Text="Nagar Book Store"></asp:Label>
    <asp:Image ID="Image1" Width="100%"  Height="100%" runat="server" ImageUrl="~/Images/home.jpg" />
    </asp:Panel>
</asp:Content>
