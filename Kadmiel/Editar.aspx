<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Editar.aspx.cs" Inherits="Editar" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        /*Modal Popup*/
        .modalBackground {
            background-color: gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }

        .modalPopup {
            -webkit-box-shadow: 0 5px 15px rgba(0,0,0,0.5);
            box-shadow: 0 5px 15px rgba(0,0,0,0.5);
            width: 300px;
            border-radius: 6px;
            background-color: #fff;
            border: 1px solid rgba(0,0,0,0.2);
            padding: 3px;
        }

            .modalPopup p {
                padding: 5px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div id="wrap">
        <!-- Start Header -->
        <header class="visible">
            <a href="index.html" id="logo">Verificentros de Hidalgo</a>
            <!-- Start Navigation -->
            <div id="menu">
                <ul id="nav2">
                    <li class="external" style="margin: 0; display: inline; padding: 0px;"><a href="index.html">Inicio</a></li>
                    <li class="external" style="margin: 0; padding: 0px;"><a href="Autos.aspx">Mis Autos</a></li>
                    <asp:LinkButton ID="lnkLogOut" class="external" runat="server" OnClick="lnkLogOut_Click">Salir</asp:LinkButton>
                </ul>
            </div>
            <!-- End Navigation -->
        </header>
        <!-- End Header -->
        <!-- Start Tables Section -->
        <%--    <div class="row"> --%>
        <br />
        <br />
        <br />
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
        <h3 style="text-align: center;">Edita tu perfil
            <asp:Label ID="lblBienvenido" ForeColor="#414141" runat="server"></asp:Label></h3>
        <!-- Start Table -->
        <div class="PanelReg" id="Registro">
            <div style="padding: 2px; margin: auto;" class="panel panel-default formulario">
                <!-- Default panel contents -->
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
                                        ErrorMessage="Campo Paterno requerido" ValidationGroup="ValReg" Text="***" ForeColor="Red"
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
                <%--<div class="input-group" style="width: 88%; margin: auto;">
                    <span class="input-group-addon" style="width: 15%">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtFechNaci"
                            Display="Dynamic" Text="***" ForeColor="Red" ValidationGroup="ValReg"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtFechNaci"
                            Display="Dynamic" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server"
                            ErrorMessage="Fecha Inválida -- ejemplo  31/01/1990 " Type="Date" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>
                    </span>
                    <asp:TextBox runat="server" ID="txtFechNaci" placeholder="Fecha de Nacimiento" autocomplete="off" />
                    <asp:CalendarExtender ID="CalendarExtender1" Format="dd/MM/yyyy" runat="server" TargetControlID="txtFechNaci" />
                </div>--%>
                <table class="table">
                    <%--<tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtFechNaci"
                                        Display="Dynamic" Text="***" ForeColor="Red" ValidationGroup="ValReg"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtFechNaci"
                                        Display="Dynamic" ValidationGroup="ValReg" Text="***" ForeColor="Red" runat="server"
                                        ErrorMessage="Fecha Inválida -- ejemplo  31/01/1990 " Type="Date" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>
                                </span>
                                <asp:TextBox runat="server" ID="txtFechNaci" placeholder="Fecha Nac dd/mm/aaaa" class="form-control"
                                    ValidationGroup="ValReg" MaxLength="10" />
                            </div>
                        </td>
                    </tr>--%>
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
                    </tr>--%>
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%">Estatus de Cuenta</span>
                                <asp:CheckBox ID="chkEstatus" class="form-control" ToolTip="Deshabilita para dar de baja!!" Checked="true" runat="server"></asp:CheckBox>
                            </div>
                        </td>
                    </tr>
                </table>
                <div style="padding: 5px; font-size: 0.8em; text-align: center;">
                    <p style="color:orange;"><strong>Sí deshabilitas tu cuenta, dejarás de recibir los correos para el aviso de tu verificación, sí deseas volver a habilitarla, Sólo ingresa nuevamente al sistema con tu usuario y contraseña y automáticamente se habilitará tu cuenta</strong></p>
                </div>
                <div class="boton" style="text-align: center; padding: 10px">
                    <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" ValidationGroup="ValReg"
                        OnClick="btnActualizar_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" ValidationGroup="ValReg"
                        OnClick="btnCancelar_Click" />
                </div>
                <div>
                    <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" CssClass="table" runat="server"
                        ValidationGroup="ValReg" />
                </div>
                <div style="padding: 5px; font-size: 0.8em; text-align: center;">
                    <asp:LinkButton ID="lnkCambCont" runat="server" OnClick="lnkCambCont_Click" Font-Size="Large">Cambiar contraseña</asp:LinkButton>
                </div>
                <div>
                    <asp:Panel ID="pnlPassword" runat="server" Visible="false">
                        <div class="PanelReg" id="Div1">
                            <div style="padding: 2px; margin: auto;" class="panel panel-default formulario">
                                <!-- Table -->
                                <table class="table">
                                    <tr>
                                        <td style="width: 48%">
                                            <div class="input-group" style="margin: auto; width: 90%">
                                                <span class="input-group-addon" style="width: 15%">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtPasswordActual"
                                                        Display="Dynamic" Text="***" ForeColor="Red" ValidationGroup="ValPass"></asp:RequiredFieldValidator>
                                                </span>
                                                <asp:TextBox ID="txtPasswordActual" TextMode="Password" MaxLength="50" class="form-control"
                                                    placeholder="Contraseña Actual" ValidationGroup="ValPass" runat="server"></asp:TextBox>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 48%">
                                            <div class="input-group" style="margin: auto; width: 90%">
                                                <span class="input-group-addon" style="width: 15%">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPasswordNuevo"
                                                        Display="Dynamic" Text="***" ForeColor="Red" ValidationGroup="ValPass"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtPasswordNuevo"
                                                        Display="Dynamic" ValidationGroup="ValPass" Text="***" ForeColor="Red" runat="server"
                                                        ErrorMessage="Debe tener de 4 a 10 caracteres y por lo menos una mayúscula, una minúscula, y un dígito"
                                                        ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,10}$"></asp:RegularExpressionValidator>
                                                </span>
                                                <asp:TextBox ID="txtPasswordNuevo" TextMode="Password" MaxLength="50" class="form-control"
                                                    placeholder="Contraseña Nueva" ValidationGroup="ValPass" runat="server"></asp:TextBox>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 48%">
                                            <div class="input-group" style="margin: auto; width: 90%">
                                                <span class="input-group-addon" style="width: 15%">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtConfPass"
                                                        Display="Dynamic" Text="***" ForeColor="Red" ValidationGroup="ValPass"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtConfPass" ControlToCompare="txtPasswordNuevo"
                                                        Display="Dynamic" ValidationGroup="ValPass" Text="***" ForeColor="Red" runat="server"
                                                        ErrorMessage="Los password son diferentes"></asp:CompareValidator>
                                                </span>
                                                <asp:TextBox ID="txtConfPass" TextMode="Password" MaxLength="50" class="form-control"
                                                    placeholder="Confirmar Contraseña" ValidationGroup="ValPass" runat="server"></asp:TextBox>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <div class="boton" style="text-align: center;">
                                    <asp:Button ID="btnCambiarP" runat="server" Text="Cambiar" ValidationGroup="ValPass"
                                        OnClick="btnCambiarP_Click" />
                                </div>
                                <div>
                                    <asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red" CssClass="table" runat="server"
                                        ValidationGroup="ValPass" />
                                </div>
                                <div style="padding: 5px; font-size: 0.8em; text-align: center;">
                                    <asp:LinkButton ID="lnkCancCont" runat="server" OnClick="lnkCancCont_Click">Cancelar</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
    <!-- End Table -->
    <!-- End Tab Section -->
    <div>
        <asp:HiddenField ID="hfIdCliente" runat="server" />
        <asp:HiddenField ID="hfPassNvo" runat="server" />
    </div>
    <%--INICIA MODAL--%>
    <asp:Button runat="server" ID="hiddenTargetControlForModalPopup" Style="display: none" />
    <asp:ModalPopupExtender ID="programmaticModalPopup" runat="server" BehaviorID="programmaticModalPopupBehavior"
        TargetControlID="hiddenTargetControlForModalPopup" PopupControlID="programmaticPopup"
        BackgroundCssClass="modalBackground" DropShadow="True" PopupDragHandleControlID="programmaticPopupDragHandle"
        RepositionMode="RepositionOnWindowScroll">
    </asp:ModalPopupExtender>
    <asp:Panel runat="server" CssClass="modalPopup" ID="programmaticPopup" Style="display: none; width: 300px; padding: 10px">
        <asp:Panel runat="Server" ID="programmaticPopupDragHandle" Style="cursor: move; background-color: #FFF; color: Black; text-align: center;">
            <div class="form-control" style="color: Gray">
                [Mensaje]
            </div>
        </asp:Panel>
        <hr />
        <div style="text-align: center">
            <span>Cambio de contraseña exitoso !!!</span>
            <asp:LinkButton runat="server" ID="lnkCerrar" Text="Cerrar" CssClass="form-control"
                OnClick="lnkCerrar_Click" />
            <br />
        </div>
    </asp:Panel>
    <%--TERMINA MODAL--%>



</asp:Content>

