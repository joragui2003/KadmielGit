<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Registro.aspx.cs" Inherits="Registro" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        /*Modal Popup*/
        .modalBackground
        {
            background-color: gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }
        .modalPopup
        {
            -webkit-box-shadow: 0 5px 15px rgba(0,0,0,0.5);
            box-shadow: 0 5px 15px rgba(0,0,0,0.5);
            width: 300px;
            border-radius: 6px;
            background-color: #fff;
            border: 1px solid rgba(0,0,0,0.2);
            padding: 3px;
        }
        .modalPopup p
        {
            padding: 5px;
        }
        .MyCalendar .ajax__calendar_container
        {
            border: 1px solid #646464;
            background-color: lemonchiffon;
            color: red;
        }
        .MyCalendar .ajax__calendar_other .ajax__calendar_day, .MyCalendar .ajax__calendar_other .ajax__calendar_year
        {
            color: black;
        }
        .MyCalendar .ajax__calendar_hover .ajax__calendar_day, .MyCalendar .ajax__calendar_hover .ajax__calendar_month, .MyCalendar .ajax__calendar_hover .ajax__calendar_year
        {
            color: black;
        }
        .MyCalendar .ajax__calendar_active .ajax__calendar_day, .MyCalendar .ajax__calendar_active .ajax__calendar_month, .MyCalendar .ajax__calendar_active .ajax__calendar_year
        {
            color: black;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div id="wrap">
        <header class="visible">
            <a href="../index.html" id="logo">El King</a>
            <div id="menu">
                <ul id="nav2">
                    <li><a href="index.html" class="external">Inicio</a></li>
                    <li class="current"><a href="#Registro">Registro</a></li>
                </ul>
            </div>
        </header>
        <section class="well" style="margin:0px;">
            <div class="row">
                <div class="col-xs-12">
                    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                    <!-- Prueba Uno -->
                    <ins class="adsbygoogle"
                         style="display:block"
                         data-ad-client="ca-pub-7945717682890660"
                         data-ad-slot="9835980630"
                         data-ad-format="auto"></ins>
                    <script>
                        (adsbygoogle = window.adsbygoogle || []).push({});
                    </script>
                </div>
            </div>
        </section>
        <div class="PanelLog">
            <div class="panel panel-default formulario">
                <!-- Default panel contents -->
                <div class="panel-heading" style="text-align: center">
                    Entrar al Sistema</div>
                <div class="panel-body" style="text-align: center">
                    <p>
                        Por favor introduce tu correo electrónico y contraseña!!
                    </p>
                </div>
                <!-- Table -->
                <table class="table">
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%">
                                    <asp:RequiredFieldValidator ControlToValidate="txtMailEnt" ID="RequiredFieldValidator3"
                                        ValidationGroup="ValLog" runat="server" ErrorMessage="Campo Requerido" Text="***"
                                        ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </span>
                                <asp:TextBox ID="txtMailEnt" MaxLength="50" class="form-control" placeholder="Correo Electrónico"
                                    ValidationGroup="ValLog" runat="server"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%">
                                    <asp:RequiredFieldValidator ControlToValidate="txtPass" ID="RequiredFieldValidator4"
                                        ValidationGroup="ValLog" runat="server" ErrorMessage="Campo Requerido" Text="***"
                                        ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></span>
                                <asp:TextBox ID="txtPass" TextMode="Password" MaxLength="10" class="form-control"
                                    placeholder="Contraseña" ValidationGroup="ValLog" runat="server"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center">
                            <asp:Button ID="btnEntrar" runat="server" ValidationGroup="ValLog" Text="Entrar"
                                OnClick="btnEntrar_Click1" />
                        </td>
                    </tr>
                </table>
               <%-- <div style="padding: 5px; font-size: 0.8em; text-align: center;">
                    <asp:LinkButton ID="lnkRecuUser" runat="server" OnClick="lnkRecuUser_Click">Recuperar usuario</asp:LinkButton></div>--%>
                <div style="padding: 5px; font-size: 0.8em; text-align: center;">
                    <asp:LinkButton ID="lnkRecuPass" runat="server" onclick="lnkRecuPass_Click" >Recuperar contraseña</asp:LinkButton></div>
            </div>
        </div>
        <div class="PanelReg" id="Registro">
            <div style="padding: 2px; margin: 100px auto;" class="panel panel-default formulario">
                <!-- Default panel contents -->
                <div class="panel-heading" style="text-align: center">
                    Registro</div>
                <div class="panel-body" style="text-align: center">
                    <p>
                        Sí cuentas con un correo electrónico y contraseña favor de ingresarlo para agregar y/o administrar
                        tus vehículos, si aún no te has registrado, Aquí puedes iniciar tu registro.
                        <br />
                        Cualquier duda puedes contactarnos al correo <a>opinion@verificentrosdehidalgo.com</a>
                        ,gracias.
                    </p>
                </div>
                <!-- Table -->
                <%--<table class="table">
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ControlToValidate="txtNombre"
                                        ValidationGroup="ValReg" Text="***" ErrorMessage="Campo Nombre requerido" ForeColor="Red"
                                        runat="server"></asp:RequiredFieldValidator>
                                </span>
                                <asp:TextBox ID="txtNombre" MaxLength="50" class="form-control" placeholder="Nombre"
                                    ValidationGroup="ValReg" runat="server"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ControlToValidate="txtPaterno"
                                        ErrorMessage="Campo requerido" ValidationGroup="ValReg" Text="***" ForeColor="Red"
                                        runat="server"></asp:RequiredFieldValidator>
                                </span>
                                <asp:TextBox ID="txtPaterno" MaxLength="50" class="form-control" placeholder="Apellido Paterno"
                                    ValidationGroup="ValReg" runat="server"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%;"></span>
                                <asp:TextBox ID="txtMaterno" MaxLength="50" class="form-control" placeholder="Apellido Materno"
                                    runat="server" ValidationGroup="ValReg"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                </table>--%>
                <%--<tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtFechNaci"
                                        Display="Dynamic" Text="***" ForeColor="Red" ValidationGroup="ValReg"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtFechNaci"
                                        Display="Dynamic" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server"
                                        ErrorMessage="Fecha Inválida -- ejemplo  31/01/1990 " Type="Date" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>
                                </span><span class="form-control" style="width: 100%">
                                    <asp:TextBox runat="server" ID="txtFechNaci" placeholder="Fecha de Nacimiento" autocomplete="off" /><br />
                                    <asp:CalendarExtender ID="defaultCalendarExtender" CssClass="MyCalendar" runat="server"
                                        ViewStateMode="Disabled" TargetControlID="txtFechNaci" />
                                </span>
                            </div>
                        </td>
                    </tr>--%>
                <%--<div class="input-group" style="width: 88%; margin: auto;">
                    <span class="input-group-addon" style="width: 15%">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtFechNaci"
                            Display="Dynamic" Text="***" ForeColor="Red" ValidationGroup="ValReg"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtFechNaci"
                            Display="Dynamic" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server"
                            ErrorMessage="Fecha Inválida -- ejemplo  31/01/1990 " Type="Date" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>
                    </span>
                    <asp:TextBox runat="server" ID="txtFechNaci" placeholder="Fecha de Nacimiento" autocomplete="off" />
                    <asp:CalendarExtender ID="CalendarExtender1" SelectedDate="01/01/1990" DefaultView="Years" Format="dd/MM/yyyy" runat="server" TargetControlID="txtFechNaci" />
                </div>--%>
                <table class="table">
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCorreo"
                                        Display="Dynamic" Text="***" ForeColor="Red" ValidationGroup="ValReg"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator100" ControlToValidate="txtCorreo"
                                        Display="Dynamic" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server"
                                        ErrorMessage="Correo inválido -- ejemplo something@someserver.com " ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$"
                                        ValidateRequestMode="Enabled"></asp:RegularExpressionValidator>
                                </span>
                                <asp:TextBox ID="txtCorreo" MaxLength="50" class="form-control" placeholder="Correo Electrónico"
                                    ValidationGroup="ValReg" runat="server"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                   <%-- <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtTelefono"
                                        Display="Dynamic" Text="***" ForeColor="Red" ValidationGroup="ValReg"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator101" ControlToValidate="txtTelefono"
                                        Display="Dynamic" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server"
                                        ErrorMessage="Número de Teléfono a 10 Dígitos" SetFocusOnError="True" ValidationExpression="^(1\s*[-\/\.]?)?(\((\d{3})\)|(\d{3}))\s*[-\/\.]?\s*(\d{3})\s*[-\/\.]?\s*(\d{4})\s*(([xX]|[eE][xX][tT])\.?\s*(\d+))*$"></asp:RegularExpressionValidator>
                                </span>
                                <asp:TextBox ID="txtTelefono" MaxLength="10" class="form-control" placeholder="Teléfono"
                                    ValidationGroup="ValReg" runat="server"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%"></span>
                                <asp:TextBox ID="txtEmpresa" MaxLength="50" class="form-control" placeholder="Empresa"
                                    ValidationGroup="ValReg" runat="server"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtUsuario"
                                        Display="Dynamic" Text="***" ForeColor="Red" ValidationGroup="ValReg"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RequiredFieldValidator500" ControlToValidate="txtUsuario"
                                        Display="Dynamic" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server"
                                        ErrorMessage="Usuario inválido" ToolTip="Mínimo con 6 caracteres" ValidationExpression="(\w(\s)?)+"></asp:RegularExpressionValidator>
                                </span>
                                <asp:TextBox ID="txtUsuario" MaxLength="50" class="form-control" placeholder="Usuario"
                                    ValidationGroup="ValReg" runat="server"></asp:TextBox>
                            </div>
                        </td>
                    </tr>--%>
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtPassword"
                                        Display="Dynamic" Text="***" ForeColor="Red" ValidationGroup="ValReg"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RequiredFieldValidator600" ControlToValidate="txtPassword"
                                        Display="Dynamic" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server"
                                        ErrorMessage="Debe tener de 4 a 10 caracteres y por lo menos una mayúscula, una minúscula, y un dígito"
                                        ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,10}$"></asp:RegularExpressionValidator>
                                </span>
                                <asp:TextBox ID="txtPassword" TextMode="Password" MaxLength="10" class="form-control"
                                     placeholder="Contraseña" ValidationGroup="ValReg" runat="server"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtConfPass"
                                        Display="Dynamic" Text="***" ForeColor="Red" ValidationGroup="ValReg"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="RequiredFieldValidator7" ControlToValidate="txtConfPass"
                                        ControlToCompare="txtPassword" Display="Dynamic" ValidationGroup="ValReg" Text="***"
                                        ForeColor="Red" runat="server" ErrorMessage="Los password son diferentes"></asp:CompareValidator>
                                </span>
                                <asp:TextBox ID="txtConfPass" TextMode="Password" MaxLength="10" class="form-control"
                                     placeholder="Confirmar Contraseña" ValidationGroup="ValReg" runat="server"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%; text-align: center">
                                He leído y acepto los términos y condiciones establecidos en el <a href="AVISO DE PRIVACIDAD.pdf" target="_blank">Aviso de Privacidad</a>
                                <br />
                                <asp:CheckBox ID="chkAviso" Checked="false" Height="20px" Width="20px" BorderStyle="Solid" ValidationGroup="ValReg" runat="server">
                                </asp:CheckBox>
                            </div>
                        </td>
                    </tr>
                </table>
                <div class="boton" style="text-align: center;">
                    <asp:Button ID="btnAgregar" runat="server" Text="Registrar" ValidationGroup="ValReg"
                        OnClick="btnAgregar_Click" />
                </div>
                <div>
                    <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" CssClass="table" runat="server"
                        ValidationGroup="ValReg" />
                </div>
            </div>
        </div>
    </div>
    <%--INICIA MODAL--%>
    <asp:Button runat="server" ID="hiddenTargetControlForModalPopup" Style="display: none" />
    <asp:ModalPopupExtender ID="programmaticModalPopup" runat="server" BehaviorID="programmaticModalPopupBehavior"
        TargetControlID="hiddenTargetControlForModalPopup" PopupControlID="programmaticPopup"
        BackgroundCssClass="modalBackground" DropShadow="True" PopupDragHandleControlID="programmaticPopupDragHandle"
        RepositionMode="RepositionOnWindowScroll">
    </asp:ModalPopupExtender>
    <asp:Panel runat="server" CssClass="modalPopup" ID="programmaticPopup" Style="display: none;
        width: 300px; padding: 10px">
        <asp:Panel runat="Server" ID="programmaticPopupDragHandle" Style="cursor: move; background-color: #FFF;
            color: Black; text-align: center;">
            <div class="form-control" style="color: Gray">
                [Mensaje]
            </div>
        </asp:Panel>
        <hr />
        <div style="text-align: center">
            <span>Registrado con Éxito !!!
                <br />
                Te hemos enviado un correo de confirmación, no olvides revisar tu bandeja de spam</span>
            <asp:LinkButton runat="server" ID="lnkCerrar" Text="Cerrar" CssClass="form-control"
                OnClick="lnkCerrar_Click" />
            <br />
        </div>
    </asp:Panel>
    <%--TERMINA MODAL--%>
</asp:Content>

