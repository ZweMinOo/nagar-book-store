<%@ Page Title="Feedback Page" Language="C#" MasterPageFile="Admin.Master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" CssClass="row" runat="server">
        <h3>Feedback</h3>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataSourceID="Feedbacks" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView1_OnRowDeleting">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                <asp:BoundField DataField="from_id" HeaderText="from_id" SortExpression="from_id" />
                <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject" />
                <asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail" />
                <asp:CommandField SelectText="Reply" ShowSelectButton="True" ButtonType="Button" />
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
        <asp:SqlDataSource ID="Feedbacks" runat="server" ConnectionString="<%$ ConnectionStrings:NagarBookStore %>" SelectCommand="SELECT from_id,subject,mail FROM Feedback WHERE from_role = '0' " DeleteCommand=""></asp:SqlDataSource>      
    </asp:Panel>
    <asp:Panel ID="Panel2" CssClass="row" runat="server" Visible="false">
        <h3>Reply Form</h3>
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <div class="row">    
            <div class="col-md-4">
                <asp:Label ID="Label1" runat="server" Text="To id"></asp:Label>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txtUser" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
            </div>
        </div><br />
        <div class="row">
            <div class="col-md-4">
                <asp:Label ID="Label3" runat="server" Text="Subject"></asp:Label>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div> <br />
        <div class="row">
            <div class="col-md-4">
                <asp:Label ID="Label5" runat="server" Text="Mail"></asp:Label>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txtMail" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            </div>
        </div> <br />
        <div class="row">
            <div class="col-md-4">
            </div>
            <div class="col-md-4">
                <asp:Button ID="btnSend" runat="server" CssClass="btn btn-primary" Text="Send" OnClick="btnSend_Click" />
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="Panel3" CssClass="row" runat="server">
        <h3>Replys</h3>
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" DataSourceID="Replys" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView2_OnRowDeleting">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="to_id" HeaderText="to_id" SortExpression="to_id" />
                <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject" />
                <asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
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
        <asp:SqlDataSource ID="Replys" runat="server" ConnectionString="<%$ ConnectionStrings:NagarBookStore %>" SelectCommand="SELECT to_id,subject,mail FROM Feedback WHERE from_role = 1" DeleteCommand=""></asp:SqlDataSource>
    </asp:Panel>
</asp:Content>
