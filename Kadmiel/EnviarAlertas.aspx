<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EnviarAlertas.aspx.cs" Inherits="EnviarAlertas" %>
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

        .MyCalendar .ajax__calendar_container {
            border: 1px solid #646464;
            background-color: lemonchiffon;
            color: red;
        }

        .MyCalendar .ajax__calendar_other .ajax__calendar_day, .MyCalendar .ajax__calendar_other .ajax__calendar_year {
            color: black;
        }

        .MyCalendar .ajax__calendar_hover .ajax__calendar_day, .MyCalendar .ajax__calendar_hover .ajax__calendar_month, .MyCalendar .ajax__calendar_hover .ajax__calendar_year {
            color: black;
        }

        .MyCalendar .ajax__calendar_active .ajax__calendar_day, .MyCalendar .ajax__calendar_active .ajax__calendar_month, .MyCalendar .ajax__calendar_active .ajax__calendar_year {
            color: black;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div id="wrap">
        <!-- Start Header -->
        <header class="visible">
            <a href="../index.html" id="logo">Verificentros de Hidalgo</a>
            <!-- Start Navigation -->
            <div id="menu">
                <ul id="nav2">
                    <li class="external"><a href="index.html">Inicio</a></li>
                    <li class="external"><a href="Autos.aspx">Mis Autos</a></li>
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
        <p style="text-align: center; padding: 5px; font-size: 20px;">
            <asp:Label ID="lblBienvenido" Font-Size="Small" ForeColor="#414141" runat="server" Text=""></asp:Label>
        </p>
        <h3 style="text-align: center;">Envío de Correos a Clientes</h3>
        <!-- Start Table -->
        <div class="row" style="margin: auto; padding: 15px;">
            <div class="col col-md-3 hidden-xs"></div>
            <div class="col col-xs-12 col-md-6">
                <div role="form">
                    <div class="input-group">
                        <span class="input-group-addon">Color</span>
                        <asp:DropDownList runat="server" class="form-control" ID="ddlPeriodo" ValidationGroup="Form" AutoPostBack="True" OnSelectedIndexChanged="ddlPeriodo_SelectedIndexChanged">
                            <asp:ListItem Text="[Color]" Value="-1" />
                            <asp:ListItem Text="Amarillo" style="background: yellow;" Value="1" />
                            <asp:ListItem Text="Rosa" style="background: pink;" Value="2" />
                            <asp:ListItem Text="Rojo" style="background: red;" Value="3" />
                            <asp:ListItem Text="Verde" style="background: green;" Value="4" />
                            <asp:ListItem Text="Azul" style="background: blue;" Value="5" />
                        </asp:DropDownList>
                        <span class="input-group-addon">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Elige una opción válida" ControlToValidate="ddlPeriodo" InitialValue="-1" ValidationGroup="Form" runat="server" Text="***" ForeColor="#CC0000">
                            </asp:RequiredFieldValidator>
                        </span>
                    </div>
                </div>
                <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="Form" ForeColor="Red" runat="server" />
                <br />
                <asp:GridView ID="gvAutos" runat="server" CssClass="table table-hover" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="[EMail]">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="[Marca]">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Marca") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="[Submarca]">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Submarca") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="[Placa]">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Placa") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="[Modelo]">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Modelo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="[Envío]">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Aviso") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
                <div style="text-align: center;">
                    <asp:Button runat="server" ID="btnEnviar" ValidationGroup="Form" class="btn btn-default" Text="Enviar" OnClick="btnEnviar_Click"></asp:Button>

                </div>
                <br />
                <br />
                <asp:GridView ID="gvAvisados" runat="server" CssClass="table table-hover" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="[EMail]">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="[Marca]">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Marca") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="[Submarca]">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Submarca") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="[Placa]">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Placa") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="[Modelo]">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Modelo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="[Envío]">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Aviso") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="col col-md-3 hidden-xs"></div>
        </div>



        <!-- End Table -->
        <!-- End Tab Section -->
        <div>
            <asp:HiddenField ID="hfIdCliente" runat="server" />
            <asp:HiddenField ID="hfPeriodo" runat="server" />
        </div>
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
            <span>Envío de avisos correcto !!!
                <br />
                Se ha notificado a todos los usuario con esta terminación
                <asp:Label ID="lblDigito" runat="server"></asp:Label>
                Muchas gracias</span>
            <asp:LinkButton runat="server" ID="lnkCerrar" Text="Cerrar" CssClass="form-control"
                OnClick="lnkCerrar_Click" />
            <br />
        </div>
    </asp:Panel>
    <%--TERMINA MODAL--%>
</asp:Content>

