<%@ Page Title="" Language="C#" MasterPageFile="~\MasterPage.master" AutoEventWireup="true" CodeFile="Autos.aspx.cs" Inherits="Pages_Autos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div id="wrap">
        <!-- Start Header -->
        <header>
            <a href="../index.html" id="logo">Verificentros de Hidalgo</a>
            <!-- Start Navigation -->
            <div id="menu">
                <ul id="nav2">
                    <li class="external"><a href="../index.html">Inicio</a></li>
                    <li class="external"><a href="#">Editar</a></li>
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
        <p style="text-align: center; padding: 5px; font-size: 20px;">
            <asp:Label ID="lblBienvenido" Font-Size="Small" ForeColor="#414141" runat="server" Text=""></asp:Label></p>
        <h3 style="text-align: center;">Mis Autos Registrados</h3>
        <!-- Start Table -->
        <asp:GridView ID="gvAutos" CssClass="table-hover table" Font-Size="12px" runat="server" AutoGenerateColumns="False" DataKeyNames="IdAutos,IdCliente,ClaseAuto,MarcaAuto,SubmarcaAuto,EstadoAuto" OnRowDeleting="gvAutos_RowDeleting"
            ShowFooter="True" OnRowCancelingEdit="gvAutos_RowCancelingEdit" OnRowEditing="gvAutos_RowEditing"
            OnRowUpdating="gvAutos_RowUpdating" AllowPaging="True" OnPageIndexChanging="gvAutos_PageIndexChanging" ShowHeaderWhenEmpty="True">
            <Columns>
                <asp:TemplateField ItemStyle-HorizontalAlign="Center" FooterStyle-BackColor="#373C3F" FooterStyle-ForeColor="White" HeaderText="Estatus">
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkEstaEIT" runat="server" Checked='<%# Bind("Estatus") %>'></asp:CheckBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="Label10" runat="server" Enabled="false" Checked='<%# Bind("Estatus") %>'></asp:CheckBox>
                    </ItemTemplate>
                    <FooterTemplate>
                        Estatus:<br />
                        <asp:CheckBox ID="chkEstaFT" runat="server" Checked="true" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField FooterStyle-BackColor="#373C3F" FooterStyle-ForeColor="White" HeaderText="Clase">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlClaseEIT" ValidationGroup='<%# Container.DataItemIndex %>' Font-Size="10px" Width="150px" AutoPostBack="true" runat="server" AppendDataBoundItems="true"
                            OnSelectedIndexChanged="ddlClaseEIT_SelectedIndexChanged">
                            <asp:ListItem Value="-1">[Clase]</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Clase.Clase") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        Clase:<br />
                        <asp:DropDownList ID="ddlClaseFT" Font-Size="10px" Width="150px" AutoPostBack="true" runat="server" AppendDataBoundItems="true"
                            ValidationGroup="Validar"
                            OnSelectedIndexChanged="ddlClaseFT_SelectedIndexChanged">
                            <asp:ListItem Value="-1">[Clase]</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvddlClaseFT" Text="**" ForeColor="Red" Display="Dynamic"
                            ValidationGroup="Validar" InitialValue="-1" ControlToValidate="ddlClaseFT" runat="server" />
                        <%-- <asp:HiddenField ID="hfvIdClase" runat="server" Value='<%# Bind("Clase.IdClase") %>' />--%>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField FooterStyle-BackColor="#373C3F" FooterStyle-ForeColor="White" HeaderText="Marca">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlMarcaEIT"
                            ValidationGroup='<%# Container.DataItemIndex %>' Font-Size="10px" Width="100px"
                            AutoPostBack="true" runat="server"
                            OnSelectedIndexChanged="ddlMarcaEIT_SelectedIndexChanged"
                            AppendDataBoundItems="True">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Marca.Marca") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        Marca:<br />
                        <asp:DropDownList ID="ddlMarcaFT" Font-Size="10px" Width="100px" AutoPostBack="true" runat="server" ValidationGroup="Validar"
                            AppendDataBoundItems="true"
                            OnSelectedIndexChanged="ddlMarcaFT_SelectedIndexChanged">
                            <asp:ListItem Value="-1">[Marca]</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvddlMarcaFT" Text="**" ForeColor="Red" Display="Dynamic"
                            ValidationGroup="Validar" ControlToValidate="ddlMarcaFT" runat="server" InitialValue="-1" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField FooterStyle-BackColor="#373C3F" FooterStyle-ForeColor="White" HeaderText="Submarca">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlSubmarcaEIT" Font-Size="10px" Width="150px"
                            runat="server" AppendDataBoundItems="True">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Submarca.Submarca") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        Submarca:<br />
                        <asp:DropDownList ID="ddlSubmarcaFT" Font-Size="10px" Width="150px" runat="server" ValidationGroup="Validar"
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="-1">[Submarca]</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvddlSubmarcaFT" Text="**" ForeColor="Red" Display="Dynamic"
                            ValidationGroup="Validar" ControlToValidate="ddlSubmarcaFT" runat="server" InitialValue="-1" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField FooterStyle-BackColor="#373C3F" FooterStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center" HeaderText="Placa">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPlacaEIT" Width="70px" MaxLength="7" runat="server" Text='<%# Bind("Placa") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" Width="70px" runat="server" Text='<%# Bind("Placa") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        Placa:<br />
                        <asp:TextBox Width="90px" ID="txtPlacaFT" placeholder="[Placa]" MaxLength="7"
                            runat="server" ValidationGroup="Validar"> </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvtxtPlacaFT" Text="**" ForeColor="Red" Display="Dynamic"
                            ValidationGroup="Validar" ControlToValidate="txtPlacaFT" runat="server" />
                    </FooterTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField FooterStyle-BackColor="#373C3F" FooterStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center" HeaderText="Modelo">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtModeloEIT" MaxLength="4" Width="50px" runat="server" Text='<%# Bind("Modelo") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Modelo") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        Modelo:<br />
                        <asp:TextBox ID="txtModeloFT" placeholder="[1999]" ValidationGroup="Validar" Width="90px" Text="" runat="server"
                            MaxLength="4"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTxtModeloFT" Text="**" ForeColor="Red" Display="Dynamic"
                            ValidationGroup="Validar" ControlToValidate="txtModeloFT" runat="server" />
                    </FooterTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField FooterStyle-BackColor="#373C3F" FooterStyle-ForeColor="White" HeaderText="Periodo">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Periodo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField FooterStyle-BackColor="#373C3F" FooterStyle-ForeColor="White" HeaderText="Dígito">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Digito") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField FooterStyle-BackColor="#373C3F" FooterStyle-ForeColor="White" HeaderText="Estado">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlEstadoEIT" Font-Size="10px" Width="120px" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Estado.Estado") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        Estado:<br />
                        <asp:DropDownList ID="ddlEstadoFT" Font-Size="10px" Width="120px" runat="server" ValidationGroup="Validar"
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="-1">[Estado]</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvddlEstadoFT" Text="**" ForeColor="Red" Display="Dynamic"
                            ValidationGroup="Validar" ControlToValidate="ddlEstadoFT" runat="server" InitialValue="-1" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField FooterStyle-BackColor="#373C3F" FooterStyle-ForeColor="White" HeaderText="Fecha Alta">
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("FechaAlta", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField FooterStyle-BackColor="#373C3F" FooterStyle-ForeColor="White" HeaderText="Eliminar" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEmiliminarIT" OnClientClick='<%# string.Format ("return confirm(\"Se eliminará al vehículo {0}\");",Eval("Marca.Marca")) %>'
                            runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar"></asp:LinkButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="lnkAgreFT" runat="server" ValidationGroup="Validar" Text="Agregar" OnClick="lnkAgreFT_Click"></asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField FooterStyle-BackColor="#373C3F" FooterStyle-ForeColor="White" HeaderText="Edición" ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="lnkActuEIT" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Actualizar"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="lnkCancEIT" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancelar"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEditEIT" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Editar"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <!-- End Table -->
        <!-- End Tab Section -->
        <div>
            <asp:HiddenField ID="hfIdCliente" runat="server" />
        </div>
    </div>
</asp:Content>

