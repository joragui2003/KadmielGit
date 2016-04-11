<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Verificentro.aspx.cs" Inherits="Verificentro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Alta de Vehículos</title>
    <style>
        .TextBox
        {
            font-size: small;
            text-align: center;
            width: 50px;
        }
        body
        {
            font-size: 12px;
            background-color: #FFC;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table style="width: 60%; margin: auto;">
        <tr>
            <td align="center" style="width: 600px" colspan="3">
                <asp:GridView ID="gvAutos" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    ForeColor="#333333" GridLines="None" DataKeyNames="IdAutos, ClaseAuto, MarcaAuto,SubmarcaAuto, EstadoAuto" OnRowDeleting="gvAutos_RowDeleting"
                    ShowFooter="True" OnRowCancelingEdit="gvAutos_RowCancelingEdit" OnRowEditing="gvAutos_RowEditing"
                    OnRowUpdating="gvAutos_RowUpdating">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="[Estatus]">
                            <EditItemTemplate>
                                <asp:CheckBox ID="chkEstaEIT" runat="server" Checked='<%# Bind("Estatus") %>'></asp:CheckBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="Label10" runat="server" Enabled="false" Checked='<%# Bind("Estatus") %>'>
                                </asp:CheckBox>
                            </ItemTemplate>
                            <FooterTemplate>
                                Estatus:<asp:CheckBox ID="chkEstaFT" runat="server" Checked="true" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="[Clase]"> 
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlClaseEIT"  ValidationGroup='<%# Container.DataItemIndex %>' Font-Size="10px" Width="150px" AutoPostBack="true" runat="server" AppendDataBoundItems="true"
                                    onselectedindexchanged="ddlClaseEIT_SelectedIndexChanged">
                                    <asp:ListItem Value="-1">[Clase]</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Clase.Clase") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                Clase:<asp:DropDownList ID="ddlClaseFT"  Font-Size="10px" Width="150px" AutoPostBack="true" runat="server" AppendDataBoundItems="true"
                                    ValidationGroup="Validar" 
                                    onselectedindexchanged="ddlClaseFT_SelectedIndexChanged">
                                    <asp:ListItem Value="-1">[Clase]</asp:ListItem> </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvddlClaseFT" Text="**" ForeColor="Red" Display="Dynamic"
                                    ValidationGroup="Validar" InitialValue="-1" ControlToValidate="ddlClaseFT" runat="server" />
                               <%-- <asp:HiddenField ID="hfvIdClase" runat="server" Value='<%# Bind("Clase.IdClase") %>' />--%>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="[Marca]">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlMarcaEIT" 
                                    ValidationGroup='<%# Container.DataItemIndex %>' Font-Size="10px" Width="100px" 
                                    AutoPostBack="true" runat="server" 
                                    onselectedindexchanged="ddlMarcaEIT_SelectedIndexChanged" 
                                    AppendDataBoundItems="True">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Marca.Marca") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                Marca:<asp:DropDownList ID="ddlMarcaFT" Font-Size="10px" Width="100px" AutoPostBack="true" runat="server" ValidationGroup="Validar"
                                    AppendDataBoundItems="true" 
                                    onselectedindexchanged="ddlMarcaFT_SelectedIndexChanged">
                                    <asp:ListItem Value="-1">[Marca]</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvddlMarcaFT" Text="**" ForeColor="Red" Display="Dynamic"
                                    ValidationGroup="Validar" ControlToValidate="ddlMarcaFT" runat="server" InitialValue="-1" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="[Submarca]">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlSubmarcaEIT" Font-Size="10px" Width="150px"  
                                    runat="server" AppendDataBoundItems="True"></asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Submarca.Submarca") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                Submarca:<asp:DropDownList ID="ddlSubmarcaFT" Font-Size="10px" Width="150px" runat="server" ValidationGroup="Validar"
                                    AppendDataBoundItems="true">
                                    <asp:ListItem Value="-1">[Submarca]</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvddlSubmarcaFT" Text="**" ForeColor="Red" Display="Dynamic"
                                    ValidationGroup="Validar" ControlToValidate="ddlSubmarcaFT" runat="server" InitialValue="-1" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="[Placa]">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPlacaEIT" Width="70px" MaxLength="7" runat="server" Text='<%# Bind("Placa") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" Width="70px" runat="server" Text='<%# Bind("Placa") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                Placa:<asp:TextBox Width="70px" ID="txtPlacaFT" placeholder="[Placa]" MaxLength="7"
                                    runat="server" ValidationGroup="Validar"> </asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvtxtPlacaFT" Text="**" ForeColor="Red" Display="Dynamic"
                                    ValidationGroup="Validar" ControlToValidate="txtPlacaFT" runat="server" />
                            </FooterTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="[Modelo]">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtModeloEIT" MaxLength="4" Width="50px" runat="server" Text='<%# Bind("Modelo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Modelo") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                Modelo:<asp:TextBox ID="txtModeloFT" placeholder="[1999]" ValidationGroup="Validar" Width="50px" Text="" runat="server"
                                    MaxLength="4"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvTxtModeloFT" Text="**" ForeColor="Red" Display="Dynamic"
                                    ValidationGroup="Validar" ControlToValidate="txtModeloFT" runat="server" />
                            </FooterTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="[Periodo]">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Periodo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="[Dígito]">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Digito") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="[Estado]">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlEstadoEIT" Font-Size="10px" Width="120px" runat="server"></asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Estado.Estado") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                Estado:<asp:DropDownList ID="ddlEstadoFT" Font-Size="10px" Width="120px" runat="server" ValidationGroup="Validar"
                                    AppendDataBoundItems="true">
                                    <asp:ListItem Value="-1">[Estado]</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvddlEstadoFT" Text="**" ForeColor="Red" Display="Dynamic"
                                    ValidationGroup="Validar" ControlToValidate="ddlEstadoFT" runat="server" InitialValue="-1" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="[Fecha Alta]">
                            <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("FechaAlta", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="[Eliminar]" ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEmiliminarIT" OnClientClick='<%# string.Format ("return confirm(\"Se eliminará al vehículo {0}\");",Eval("Marca.Marca")) %>'
                                    runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar"></asp:LinkButton>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="lnkAgreFT" runat="server" ValidationGroup="Validar" Text="Agregar" OnClick="lnkAgreFT_Click"></asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="[Edición]" ShowHeader="False">
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
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                &nbsp; &nbsp; &nbsp;
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
