<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Recuperar.aspx.cs" Inherits="Recuperar" %>

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
                    <li class="current"><a href="Registro.aspx">Regresar</a></li>
                </ul>
            </div>
        </header>
        <%--<div class="PanelLog">
            <div class="panel panel-default formulario">
                <!-- Default panel contents -->
                <div class="panel-heading" style="text-align: center">
                    Recuperar Usuario</div>
                <div class="panel-body" style="text-align: center">
                    <p>
                        Por favor introduce tu correo electrónico
                    </p>
                </div>
                <!-- Table -->
                <table class="table">
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%">
                                    <asp:RequiredFieldValidator ControlToValidate="txtUser" ID="RequiredFieldValidator3"
                                        ValidationGroup="ValUser" runat="server" ErrorMessage="Campo Requerido" Text="***"
                                        ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator100" ControlToValidate="txtUser"
                                        Display="Dynamic" ValidationGroup="ValUser" Text="***" ForeColor="Red" runat="server"
                                        ErrorMessage="Correo inválido -- ejemplo something@someserver.com " ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$"
                                        ValidateRequestMode="Enabled"></asp:RegularExpressionValidator>
                                </span>
                                <asp:TextBox ID="txtUser" MaxLength="50" class="form-control" placeholder="Correo Electrónico"
                                    ValidationGroup="ValUser" runat="server"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center">
                            <asp:Button ID="btnEnviarUser" runat="server" ValidationGroup="ValUser" CssClass="bottom"
                                Text="Enviar" onclick="btnEnviarUser_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>--%>
        <div class="PanelLog">
            <div class="panel panel-default formulario">
                <!-- Default panel contents -->
                <div class="panel-heading" style="text-align: center">
                    Recuperar Password</div>
                <div class="panel-body" style="text-align: center">
                    <p>
                        Por favor introduce tu correo electrónico
                    </p>
                </div>
                <!-- Table -->
                <table class="table">
                    <tr>
                        <td style="width: 48%">
                            <div class="input-group" style="margin: auto; width: 90%">
                                <span class="input-group-addon" style="width: 15%">
                                    <asp:RequiredFieldValidator ControlToValidate="txtPass" ID="RequiredFieldValidator1"
                                        ValidationGroup="ValPass" runat="server" ErrorMessage="Campo Requerido" Text="***"
                                        ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </span>
                                <asp:TextBox ID="txtPass" MaxLength="50" class="form-control" placeholder="Correo Electrónico"
                                    ValidationGroup="ValPass" runat="server"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center">
                            <asp:Button ID="btnEnviarPass" runat="server" ValidationGroup="ValPass" CssClass="bottom"
                                Text="Enviar" onclick="btnEnviarPass_Click" />
                        </td>
                    </tr>
                </table>
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
            <span>Datos correctos !!!
                <br />
                Te hemos enviado un correo a <asp:Label ID="lblCorreo" runat="server"></asp:Label> con tu dato solicitado,<strong> no olvides revisar tu bandeja de spam </strong> </span>
            <asp:LinkButton runat="server" ID="lnkCerrar" Text="Cerrar" CssClass="form-control"
                OnClick="lnkCerrar_Click" />
            <br />
        </div>
    </asp:Panel>
    <%--TERMINA MODAL--%>
</asp:Content>

