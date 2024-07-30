<%@ Page Title="Feedback" Language="C#" MasterPageFile="User.Master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Feedback form</h3>
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    <div class="row">     
        <div class="col-md-4">
            <asp:Label ID="Label1" runat="server" Text="Subject"></asp:Label>
        </div>
        <div class="col-md-4">
            <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div> <br />
    <div class="row">
        <div class="col-md-4">
            <asp:Label ID="Label2" runat="server" Text="Mail"></asp:Label>
        </div>
        <div class="col-md-4">
            <asp:TextBox ID="txtMail" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
        </div>
    </div> <br />
    <div class="row">
        <div class="col-md-4">

        </div>
        <div class="col-md-4">
            <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" CssClass="btn btn-primary" />
        </div>
    </div>
    <div class="row">
        <h3>Replys for you</h3>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataSourceID="Replys" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
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
        <asp:SqlDataSource ID="Replys" runat="server" ConnectionString="<%$ ConnectionStrings:NagarBookStore %>" SelectCommand=""></asp:SqlDataSource>
    </div>
</asp:Content>