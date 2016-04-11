using Kadmiel.BusKadmiel;
using Kadmiel.BusKadmiel.EntityKadmiel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Verificentro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                cargarGvAutos();
                cargarClase();
                cargarEstados();
            }
            if (Session["123"] == null)
            {
                Response.Redirect("~/Pages/Registro.aspx");
            }
            EntCliente ent = new EntCliente();
            ent = (EntCliente)Session["123"];
            Title = "Bienvenido " + ent.Nombre;
        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }
    }
    public void mostrarMensaje(string mensaje)
    {
        string script = "alert('" + mensaje.Replace("'", "\"") + "');";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Error", script, true);
    }

    public void cargarGvAutos()
    {
        BusAutos obj = new BusAutos();
        gvAutos.DataSource = obj.obtenerAutos();
        gvAutos.DataBind();
        gvAutos.FooterRow.Cells[10].ColumnSpan = 2;
        gvAutos.FooterRow.Cells[11].Visible = false;
    }
    public void cargarClase()
    {
        BusClase obj = new BusClase();
        DropDownList ddl = (DropDownList)gvAutos.FooterRow.FindControl("ddlClaseFT");
        ddl.DataTextField = "Clase";
        ddl.DataValueField = "IdClase";
        ddl.DataSource = obj.obtenerClase();
        ddl.DataBind();
    }
    public void cargarMarca(int valor)
    {
        BusMarca obj = new BusMarca();
        DropDownList ddl = (DropDownList)gvAutos.FooterRow.FindControl("ddlMarcaFT");
        ddl.Items.Clear();
        ddl.Items.Add(new ListItem ("[Marca]", "-1"));
        ddl.DataTextField = "Marca";
        ddl.DataValueField = "IdMarca";
        switch (valor)
        {
            case 1:
            case 2:
                {
                    ddl.DataSource = obj.obtenerMarca(1);
                    ddl.DataBind();
                    break;
                }
            case 3:
            case 4:
            case 5:
            case 6:
            case 97:
            case 98:
            case 99:
                {
                    ddl.DataSource = obj.obtenerMarca(2);
                    ddl.DataBind();
                    break;
                }
            default:
                break;
        }
    }
    public void cargarMarcaEIT(int valor, int fila)
    {
        BusMarca obj = new BusMarca();
        DropDownList ddl = (DropDownList)gvAutos.Rows[fila].FindControl("ddlMarcaEIT");
        ddl.Items.Clear();
        ddl.Items.Add(new ListItem("[Marca]", "-1"));
        ddl.DataTextField = "Marca";
        ddl.DataValueField = "IdMarca";
        switch (valor)
        {
            case 1:
            case 2:
                {
                    ddl.DataSource = obj.obtenerMarca(1);
                    ddl.DataBind();
                    break;
                }
            case 3:
            case 4:
            case 5:
            case 6:
            case 97:
            case 98:
            case 99:
                {
                    ddl.DataSource = obj.obtenerMarca(2);
                    ddl.DataBind();
                    break;
                }
            default:
                break;
        }
    }
    public void cargarSubmarca(string valor)
    {
        BusSubmarca obj = new BusSubmarca();
        DropDownList ddl = (DropDownList)gvAutos.FooterRow.FindControl("ddlSubmarcaFT");
        ddl.Items.Clear();
        ddl.Items.Add(new ListItem("[Submarca]", "-1"));
        ddl.DataTextField = "Submarca";
        ddl.DataValueField = "IdSubmarca";
        ddl.DataSource = obj.obtenerSubmarca(valor);
        ddl.DataBind();
    }
    public void cargarSubmarcaEIT(string valor, int fila)
    {
        BusSubmarca obj = new BusSubmarca();
        DropDownList ddl = (DropDownList)gvAutos.Rows[fila].FindControl("ddlSubmarcaEIT");
        ddl.Items.Clear();
        ddl.Items.Add(new ListItem("[Submarca]", "-1"));
        ddl.DataTextField = "Submarca";
        ddl.DataValueField = "IdSubmarca";
        ddl.DataSource = obj.obtenerSubmarca(valor);
        ddl.DataBind();
    }
    public void cargarEstados()
    {
        BusEstado obj = new BusEstado();
        DropDownList ddl = (DropDownList)gvAutos.FooterRow.FindControl("ddlEstadoFT");
        ddl.DataTextField = "Estado";
        ddl.DataValueField = "IdEstado";
        ddl.DataSource = obj.obtenerEstados();
        ddl.DataBind();
    }

    protected void gvAutos_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int idAutos = Convert.ToInt32(gvAutos.DataKeys[e.RowIndex].Values["IdAutos"]);
            EntAutos auto = new EntAutos();
            auto.IdAutos = idAutos;
            BusAutos obj = new BusAutos();
            obj.eliminarAutos(auto);
            Response.Redirect(Request.CurrentExecutionFilePath);
        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }

    }
    protected void gvAutos_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            gvAutos.EditIndex = e.NewEditIndex;
            cargarGvAutos();

            DropDownList ddlClase = (DropDownList)gvAutos.Rows[e.NewEditIndex].FindControl("ddlClaseEIT");
            ddlClase.DataTextField = "Clase";
            ddlClase.DataValueField = "IdClase";
            ddlClase.DataSource = new BusClase().obtenerClase();
            ddlClase.DataBind();
            ddlClase.SelectedValue = (gvAutos.DataKeys[e.NewEditIndex].Values["ClaseAuto"]).ToString();
            
            DropDownList ddlMarca = (DropDownList)gvAutos.Rows[e.NewEditIndex].FindControl("ddlMarcaEIT");
            ddlMarca.DataTextField = "Marca";
            ddlMarca.DataValueField = "IdMarca";
            int idMarca = Convert.ToInt32(gvAutos.DataKeys[e.NewEditIndex].Values["MarcaAuto"]);
            ddlMarca.DataSource = new BusMarca().obtenerMarca();
            ddlMarca.DataBind();
            ddlMarca.SelectedValue = idMarca.ToString();

            string marca = idMarca.ToString();

            DropDownList ddlSubmarca = (DropDownList)gvAutos.Rows[e.NewEditIndex].FindControl("ddlSubmarcaEIT");
            ddlSubmarca.DataTextField = "Submarca";
            ddlSubmarca.DataValueField = "IdSubmarca";
            ddlSubmarca.DataSource = new BusSubmarca().obtenerSubmarca(marca);
            ddlSubmarca.DataBind();
            ddlSubmarca.SelectedValue = (gvAutos.DataKeys[e.NewEditIndex].Values["SubmarcaAuto"]).ToString();

            DropDownList ddlEstado = (DropDownList)gvAutos.Rows[e.NewEditIndex].FindControl("ddlEstadoEIT");
            ddlEstado.DataTextField = "Estado";
            ddlEstado.DataValueField = "IdEstado";
            ddlEstado.DataSource = new BusEstado().obtenerEstados();
            ddlEstado.DataBind();
            ddlEstado.SelectedValue = (gvAutos.DataKeys[e.NewEditIndex].Values["EstadoAuto"]).ToString();
        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }
    }
    protected void gvAutos_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            EntAutos aut = new EntAutos();
            aut.IdAutos = Convert.ToInt32(gvAutos.DataKeys[e.RowIndex].Values["IdAutos"]);
            aut.ClaseAuto = Convert.ToInt32((((DropDownList)gvAutos.Rows[e.RowIndex].FindControl("ddlClaseEIT")).SelectedItem.Value));
            aut.MarcaAuto = Convert.ToInt32((((DropDownList)gvAutos.Rows[e.RowIndex].FindControl("ddlMarcaEIT")).SelectedItem.Value));
            aut.SubmarcaAuto = Convert.ToInt32((((DropDownList)gvAutos.Rows[e.RowIndex].FindControl("ddlSubmarcaEIT")).SelectedItem.Value));
            aut.Placa = ((TextBox)gvAutos.Rows[e.RowIndex].FindControl("txtPlacaEIT")).Text;
            aut.Modelo = ((TextBox)gvAutos.Rows[e.RowIndex].FindControl("txtModeloEIT")).Text;
            int periodo = new BusAutos().periodo(aut.Placa);
            aut.Periodo = periodo;
            int digito = new BusAutos().digito(aut.Placa);
            aut.Digito = digito;
            aut.EstadoAuto = Convert.ToInt32((((DropDownList)gvAutos.Rows[e.RowIndex].FindControl("ddlEstadoEIT")).SelectedItem.Value));
            aut.Estatus = Convert.ToBoolean(((CheckBox)gvAutos.Rows[e.RowIndex].FindControl("chkEstaEIT")).Checked);
            BusAutos obj = new BusAutos();
            obj.actualizarAutos(aut);
            Response.Redirect(Request.CurrentExecutionFilePath);
        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }
    }
    protected void gvAutos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            gvAutos.EditIndex = -1;
            cargarGvAutos();
            cargarClase();
            cargarEstados();
        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }
    }
    protected void lnkAgreFT_Click(object sender, EventArgs e)
    {
        try
        {
            EntAutos aut = new EntAutos();
            aut.ClaseAuto = Convert.ToInt32(((DropDownList)gvAutos.FooterRow.FindControl("ddlClaseFT")).SelectedItem.Value);
            aut.MarcaAuto = Convert.ToInt32(((DropDownList)gvAutos.FooterRow.FindControl("ddlMarcaFT")).SelectedItem.Value);
            aut.SubmarcaAuto = Convert.ToInt32(((DropDownList)gvAutos.FooterRow.FindControl("ddlSubmarcaFT")).SelectedItem.Value);
            aut.Modelo = ((TextBox)gvAutos.FooterRow.FindControl("txtModeloFT")).Text;
            aut.Placa = ((TextBox)gvAutos.FooterRow.FindControl("txtPlacaFT")).Text;
            int periodo = new BusAutos().periodo(aut.Placa);
            aut.Periodo = periodo;
            int digito = new BusAutos().digito(aut.Placa);
            aut.Digito = digito;
            aut.EstadoAuto = Convert.ToInt32(((DropDownList)gvAutos.FooterRow.FindControl("ddlEstadoFT")).SelectedItem.Value);
            aut.Estatus = Convert.ToBoolean(((CheckBox)gvAutos.FooterRow.FindControl("chkEstaFT")).Checked);
            new BusAutos().agregarAutos(aut);
            Response.Redirect(Request.CurrentExecutionFilePath);
        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }
    }
    protected void ddlClaseFT_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownList ddl = (DropDownList)sender;
            int valor = Convert.ToInt32(ddl.SelectedValue);
            cargarMarca(valor);
            cargarSubmarca(valor.ToString());
        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }
    }
    protected void ddlClaseEIT_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownList ddl = (DropDownList)sender;
            int valor = Convert.ToInt32(ddl.SelectedValue);
            int fil = Convert.ToInt32(ddl.ValidationGroup);
            cargarMarcaEIT(valor, fil);
            cargarSubmarcaEIT(valor.ToString(), fil);
        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }
    }

    protected void ddlMarcaFT_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownList ddl = (DropDownList)sender;
            string marca = ddl.SelectedValue;
            cargarSubmarca(marca);
        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }
    }
    protected void ddlMarcaEIT_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownList ddl = (DropDownList)sender;
            int fila = Convert.ToInt32(ddl.ValidationGroup);
            string marca = ddl.SelectedValue;
            cargarSubmarcaEIT(marca, fila);
        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }
    }
}