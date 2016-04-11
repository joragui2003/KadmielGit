<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Pages_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="pnlEntrar" Visible="true" runat="server">
                Usuario:<asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                Password:<asp:TextBox ID="txtPass" TextMode="Password" runat="server"></asp:TextBox>
                <asp:Button ID="btnEntrar" runat="server" Text="Entrar" OnClick="btnEntrar_Click1" />
                &nbsp;
            </asp:Panel>
        </div>
    </form>
</body>
</html>
