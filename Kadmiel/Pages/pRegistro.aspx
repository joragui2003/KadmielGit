<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pRegistro.aspx.cs" Inherits="Pages_Registro" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <header>
        <div>
            <asp:Panel ID="pnlSalir" Visible="false" runat="server">
                <asp:Label ID="lblUser" runat="server" Text=""></asp:Label>
                <asp:LinkButton ID="lnkLogout" runat="server" OnClick="lnkLogout_Click">[Cerrar Sesion]</asp:LinkButton>
            </asp:Panel>
        </div>
    </header>
    <section>
        <article>
            <div class="input-group input-group-sm">
                Nombre:<asp:TextBox ID="txtNombre" ValidationGroup="ValReg" MaxLength="50" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ControlToValidate="txtNombre" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server" ErrorMessage="Nombre Requerido"></asp:RequiredFieldValidator>
            </div>
            <div class="input-group input-group-sm">
                Apellido Paterno:<asp:TextBox ID="txtPaterno" ValidationGroup="ValReg" MaxLength="50" runat="server" ValidateRequestMode="Enabled"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPaterno" Display="Dynamic" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server" ErrorMessage="Apellido Paterno requerido"></asp:RequiredFieldValidator>
            </div>
            <div class="input-group input-group-sm">
                Apellido Materno:<asp:TextBox ID="txtMaterno" MaxLength="50" runat="server"></asp:TextBox>
            </div>
            <div class="input-group input-group-sm">
                Correo Electrónico:<asp:TextBox ID="txtCorreo" ValidationGroup="ValReg" placeholder="correo@mail.com" TextMode="Email" MaxLength="50" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RequiredFieldValidator3" ControlToValidate="txtCorreo" Display="Dynamic" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server" ErrorMessage="Ejemplo somthing@someserver.com " SetFocusOnError="True" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" ValidateRequestMode="Enabled"></asp:RegularExpressionValidator>
            </div>
            <div class="input-group input-group-sm">
                Teléfono:<asp:TextBox ID="txtTelefono" ValidationGroup="ValReg" MaxLength="10" TextMode="Phone" placeholder="10 dígitos" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RequiredFieldValidator4" ControlToValidate="txtTelefono" Display="Dynamic" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server" ErrorMessage="Teléfono a 10 Dígitos" SetFocusOnError="True" ValidationExpression="^(1\s*[-\/\.]?)?(\((\d{3})\)|(\d{3}))\s*[-\/\.]?\s*(\d{3})\s*[-\/\.]?\s*(\d{4})\s*(([xX]|[eE][xX][tT])\.?\s*(\d+))*$"></asp:RegularExpressionValidator>
            </div>
            <div class="input-group input-group-sm">
                Empresa:<asp:TextBox ID="txtEmpresa" MaxLength="50" runat="server"></asp:TextBox>
            </div>
            <div class="input-group input-group-sm">
                Usuario:<asp:TextBox ID="txtUsuario" ValidationGroup="ValReg" MaxLength="50" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RequiredFieldValidator5" ControlToValidate="txtUsuario" Display="Dynamic" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server" ErrorMessage="Usuario inválido" SetFocusOnError="True" ToolTip="Mínimo 6 caracteres" ValidationExpression="(\w(\s)?)+"></asp:RegularExpressionValidator>
            </div>
            <div class="input-group input-group-sm">
                Contraseña:<asp:TextBox ID="txtPassword" ValidationGroup="ValReg" TextMode="Password" MaxLength="50" runat="server" ToolTip="Mínimo 6 caracteres"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RequiredFieldValidator6" ControlToValidate="txtPassword" Display="Dynamic" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server" ErrorMessage="Debe tener de 4 a 8   caracteres,  una mayúscula, una minúscual, y un dígito" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,8}$"></asp:RegularExpressionValidator>
            </div>
            <div class="input-group input-group-sm">
                Confirmar Contraseña:<asp:TextBox ID="txtConfPass" ValidationGroup="ValReg" TextMode="Password" MaxLength="50" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="RequiredFieldValidator7" ControlToValidate="txtConfPass" ControlToCompare="txtPassword" Display="Dynamic" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server" ErrorMessage="Los password son diferentes"></asp:CompareValidator>
            </div>
            <div class="input-group input-group-sm">
                Fecha de Nacimiento:
                    <asp:TextBox runat="server" ID="txtFechNaci" ValidationGroup="ValReg" MaxLength="10" />
                <asp:ImageButton runat="Server" ID="Image1" Width="25px" ImageUrl="~/images/calendar.png" AlternateText="Click para mostrar el calendario" />
                <asp:CalendarExtender ID="calendarButtonExtender" runat="server" TargetControlID="txtFechNaci"
                    PopupButtonID="Image1" />
                <asp:RegularExpressionValidator ID="RequiredFieldValidator8" ControlToValidate="txtFechNaci" Display="Dynamic" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server" ErrorMessage="Fecha Inválida  29/02/1972 " Type="Date" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>
            </div>
            <div class="boton">
                <asp:Button ID="btnAgregar" runat="server" Text="Registrar" ValidationGroup="ValReg" OnClick="btnAgregar_Click" />
            </div>
            <div>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="ValReg" ForeColor="Red" />
            </div>
            <div>
                <asp:Panel ID="pnlEntrar" Visible="true" runat="server">
                    Usuario:<asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                    Password:<asp:TextBox ID="txtPass" TextMode="Password" runat="server"></asp:TextBox>
                    <asp:Button ID="btnEntrar" runat="server" Text="Entrar" OnClick="btnEntrar_Click1" />
                    &nbsp;
                </asp:Panel>
            </div>
        </article>
    </section>
</asp:Content>
    </form>
</body>
</html>




    