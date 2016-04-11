<%@ Page Title="" Language="C#" MasterPageFile="~\MasterPage.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="Registro.aspx.cs" Inherits="Pages_Registro" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>

    <div id="wrap">
        <header class="visible">
            <a href="../index.html" id="logo">El King</a>

            <div id="menu">
                <ul id="nav2">
                    <li><a href="../index.html" class="external">Inicio</a></li>
                    <li class="current"><a href="#">Registro</a></li>
                </ul>
            </div>
        </header>

        <div class="PanelLog">
            <div class="panel panel-default formulario">
                <!-- Default panel contents -->
                <div class="panel-heading" style="text-align: center">Entrar al Sistema</div>
                <div class="panel-body" style="text-align: center">
                    <p>
                        Por favor inserta tu nombre de usuario y contraseña
                    </p>
                </div>

                <!-- Table -->
                <table class="table">
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%">
                                    <asp:RequiredFieldValidator ControlToValidate="txtUser" ID="RequiredFieldValidator3" ValidationGroup="ValLog" runat="server" ErrorMessage="Campo Requerido" Text="***" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </span>
                                <asp:TextBox ID="txtUser" MaxLength="50" class="form-control" placeholder="Usuario" ValidationGroup="ValLog" runat="server"></asp:TextBox>

                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%">
                                    <asp:RequiredFieldValidator ControlToValidate="txtPass" ID="RequiredFieldValidator4" ValidationGroup="ValLog" runat="server" ErrorMessage="Campo Requerido" Text="***" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></span>
                                <asp:TextBox ID="txtPass" TextMode="Password" MaxLength="50" class="form-control" placeholder="Contraseña" ValidationGroup="ValLog" runat="server"></asp:TextBox>

                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center">
                            <asp:Button ID="btnEntrar" runat="server" ValidationGroup="ValLog" Text="Entrar" OnClick="btnEntrar_Click1" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="PanelReg">
            <div style="padding: 2px; margin: 100px auto;" class="panel panel-default formulario">
                <!-- Default panel contents -->
                <div class="panel-heading" style="text-align: center">Registro</div>
                <div class="panel-body" style="text-align: center">
                    <p>
                        Sí cuentas con un usuario y contraseña favor de ingresarlo para agregar y/o administrar tus vehícluos, si aún no te has registrado, Aquí puedes iniciar tu registro.
                    <br />
                        Cualquier duda puedes contactarnos al correo <a>opinion@verificentrosdehidalgo.com,  gracias.</a>
                    </p>
                </div>

                <!-- Table -->
                <table class="table">
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ControlToValidate="txtNombre" ValidationGroup="ValReg" Text="***" ErrorMessage="Campo Nombre requerido" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                </span>
                                <asp:TextBox ID="txtNombre" MaxLength="50" class="form-control" placeholder="Nombre" ValidationGroup="ValReg" runat="server"></asp:TextBox>

                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ControlToValidate="txtPaterno" ErrorMessage="Campo Paterno requerido" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                </span>
                                <asp:TextBox ID="txtPaterno" MaxLength="50" class="form-control" placeholder="Apellido Paterno" ValidationGroup="ValReg" runat="server"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%;"></span>
                                <asp:TextBox ID="txtMaterno" MaxLength="50" class="form-control" placeholder="Apellido Materno" runat="server" ValidationGroup="ValReg"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtFechNaci" Display="Dynamic" Text="***" ForeColor="Red" ValidationGroup="ValReg"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtFechNaci" Display="Dynamic" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server" ErrorMessage="Fecha Inválida -- ejemplo  31/01/1990 " Type="Date" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>
                                </span>
                                <span class="form-control" style="width: 100%">
                                    <asp:TextBox runat="server" ID="txtFechNaci" placeholder="Fecha Nacimiento" class="form-control" ValidationGroup="ValReg" MaxLength="10" /></span>
                                <span class="input-group-addon">
                                    <asp:ImageButton runat="Server" ID="Image1" Width="25px" ImageUrl="~/images/calendar.png" AlternateText="Click para mostrar el calendario" /></span>
                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtFechNaci" Animated="true"
                                    PopupButtonID="Image1" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCorreo" Display="Dynamic" Text="***" ForeColor="Red" ValidationGroup="ValReg"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator100" ControlToValidate="txtCorreo" Display="Dynamic" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server" ErrorMessage="Correo inválido -- ejemplo something@someserver.com " ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" ValidateRequestMode="Enabled"></asp:RegularExpressionValidator>
                                </span>
                                <asp:TextBox ID="txtCorreo" MaxLength="50" class="form-control" placeholder="Correo Electrónico" ValidationGroup="ValReg" runat="server"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtTelefono" Display="Dynamic" Text="***" ForeColor="Red" ValidationGroup="ValReg"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator101" ControlToValidate="txtTelefono" Display="Dynamic" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server" ErrorMessage="Número de Teléfono a 10 Dígitos" SetFocusOnError="True" ValidationExpression="^(1\s*[-\/\.]?)?(\((\d{3})\)|(\d{3}))\s*[-\/\.]?\s*(\d{3})\s*[-\/\.]?\s*(\d{4})\s*(([xX]|[eE][xX][tT])\.?\s*(\d+))*$"></asp:RegularExpressionValidator>
                                </span>
                                <asp:TextBox ID="txtTelefono" MaxLength="50" class="form-control" placeholder="Teléfono" ValidationGroup="ValReg" runat="server"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%"></span>
                                <asp:TextBox ID="txtEmpresa" MaxLength="50" class="form-control" placeholder="Empresa" ValidationGroup="ValReg" runat="server"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtUsuario" Display="Dynamic" Text="***" ForeColor="Red" ValidationGroup="ValReg"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RequiredFieldValidator500" ControlToValidate="txtUsuario" Display="Dynamic" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server" ErrorMessage="Usuario inválido" ToolTip="Mínimo con 6 caracteres" ValidationExpression="(\w(\s)?)+"></asp:RegularExpressionValidator>
                                </span>
                                <asp:TextBox ID="txtUsuario" MaxLength="50" class="form-control" placeholder="Usuario" ValidationGroup="ValReg" runat="server"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtPassword" Display="Dynamic" Text="***" ForeColor="Red" ValidationGroup="ValReg"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RequiredFieldValidator600" ControlToValidate="txtPassword" Display="Dynamic" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server" ErrorMessage="Debe tener de 4 a 8 caracteres, una mayúscula, una minúscula, y un dígito" ValidationExpression="(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{4,8}$"></asp:RegularExpressionValidator>
                                </span>
                                <asp:TextBox ID="txtPassword" TextMode="Password" MaxLength="50" class="form-control" placeholder="Contraseña" ValidationGroup="ValReg" runat="server"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtConfPass" Display="Dynamic" Text="***" ForeColor="Red" ValidationGroup="ValReg"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="RequiredFieldValidator7" ControlToValidate="txtConfPass" ControlToCompare="txtPassword" Display="Dynamic" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server" ErrorMessage="Los password son diferentes"></asp:CompareValidator>
                                </span>
                                <asp:TextBox ID="txtConfPass" TextMode="Password" MaxLength="50" class="form-control" placeholder="Confirmar Contraseña" ValidationGroup="ValReg" runat="server"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                </table>
                <div class="boton" style="text-align: center;">
                    <asp:Button ID="btnAgregar" runat="server" Text="Registrar" ValidationGroup="ValReg" OnClick="btnAgregar_Click" />
                </div>
                <div>
                    <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" CssClass="table" runat="server" ValidationGroup="ValReg" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

