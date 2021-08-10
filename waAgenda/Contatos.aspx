<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.Master" AutoEventWireup="true" CodeBehind="Contatos.aspx.cs" Inherits="waAgenda.Contatos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        margin-right: 80px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Larger" Text="Inserir um novo contato"></asp:Label>
<br />
<br />
<asp:Label ID="lblNome" runat="server" Text="Nome"></asp:Label>
<br />
<asp:TextBox ID="tbNome" runat="server" Width="248px"></asp:TextBox>
<br />
<br />
<asp:Label ID="lblEmail" runat="server" Text="E-mail"></asp:Label>
<br />
<asp:TextBox ID="tbEmail" runat="server" Width="243px"></asp:TextBox>
<br />
<br />
<asp:Label ID="lblTelefone" runat="server" Text="Telefone"></asp:Label>
<br />
<asp:TextBox ID="tbTelefone" runat="server" Width="173px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
<asp:Button ID="btnSalvar" runat="server" OnClick="btnSalvar_Click" Text="Inserir" />
<br />
<br />
<asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger" Text="Lista de Contatos"></asp:Label>
<br />
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style1" DataKeyNames="Id" DataSourceID="SqlDataSourceContatos" GridLines="Horizontal" Width="674px">
    <AlternatingRowStyle BackColor="#F7F7F7" />
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        <asp:BoundField DataField="Telefone" HeaderText="Telefone" SortExpression="Telefone" />
    </Columns>
    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
    <SortedAscendingCellStyle BackColor="#F4F4FD" />
    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
    <SortedDescendingCellStyle BackColor="#D8D8F0" />
    <SortedDescendingHeaderStyle BackColor="#3E3277" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSourceContatos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Contato] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Contato] ([Nome], [Email], [Telefone]) VALUES (@Nome, @Email, @Telefone)" SelectCommand="SELECT * FROM [Contato]" UpdateCommand="UPDATE [Contato] SET [Nome] = @Nome, [Email] = @Email, [Telefone] = @Telefone WHERE [Id] = @Id">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Nome" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="Telefone" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Nome" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="Telefone" Type="String" />
        <asp:Parameter Name="Id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:Label ID="lblMsg" runat="server"></asp:Label>
<br />
</asp:Content>
