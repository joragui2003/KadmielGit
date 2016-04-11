using Kadmiel.BusKadmiel;
using Kadmiel.BusKadmiel.EntityKadmiel;
using Kadmiel.BusKadmiel.UtilityKadmiel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EnviarAlertas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["123"] == null)
            {
                Response.Redirect("Registro.aspx");
            }
            EntCliente ent = new EntCliente();
            ent = (EntCliente)Session["123"];
            if (ent.Id != 1)
            {
                mostrarMensaje(string.Format("Tu cuenta de \"{0}\" no tiene acceso a esta página", ent.Email));
                Session.Clear();
            }
            lblBienvenido.Text = "Bienvenid@ " + ent.Email;

            hfIdCliente.Value = ent.Id.ToString();
            if (!IsPostBack)
            {
                //cargarGvAvisados();
                //cargarClase();
                //cargarAnio();
                //cargarEstados();
            }
        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }
    }

    private void cargarGvAvisados(int periodo)
    {
        gvAvisados.DataSource = new BusCliente().ObtenerAvisados(periodo);
        gvAvisados.DataBind();
    }
    public void CargarGvAutos(int periodo)
    {
        gvAutos.DataSource = new BusCliente().ObtenerAlertas(periodo);
        gvAutos.DataBind();
    }
    public void mostrarMensaje(string mensaje)
    {
        string script = "alert('" + mensaje.Replace("'", "\"").Replace("\n", "").Replace("\r", "") + "');";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Error", script, true);
    }
    protected void lnkLogOut_Click(object sender, EventArgs e)
    {
        try
        {
            Session.Clear();
            Response.Redirect("index.html#about");
        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }
    }
    protected void ddlPeriodo_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownList ddl = (DropDownList)sender;
            int periodo = Convert.ToInt32(ddl.SelectedItem.Value);
            hfPeriodo.Value = periodo.ToString();
            CargarGvAutos(periodo);
            cargarGvAvisados(periodo);
        }
        catch (Exception ex)
        {
            gvAutos.DataSource = new List<EntCliente>();
            gvAutos.DataBind();
            gvAvisados.DataSource = new List<EntCliente>();
            gvAvisados.DataBind();
            mostrarMensaje(ex.Message);
        }
    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        try
        {
            List<EntCliente> lst = new BusCliente().ObtenerAlertas(Convert.ToInt32(hfPeriodo.Value));
            foreach (EntCliente ent in lst)
            {
                UtiCorreo.MandarCorreo(ent.Email, "Recordatorio de Verificación", string.Format("Hola {0} te recordamos que tu vehículo marca {1} {2},  modelo {5} con placa {3} del estado de {4} está próximo a vencer su periodo de verificación. \n Agradeceremos su preferencia en cualquiera de nuestros verificentros. \n Atte. \n www.verificentrosdehidalgo.com ", ent.Email, ent.Marca, ent.Submarca, ent.Placa, ent.Estado, ent.Modelo));
                new BusAutos().ActualizarAviso(ent.IdAuto, true);
            }
            this.programmaticModalPopup.Show();
        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }
    }
    protected void lnkCerrar_Click(object sender, EventArgs e)
    {
        try
        {
            this.programmaticModalPopup.Hide();
            Response.Redirect(Request.CurrentExecutionFilePath);
        }
        catch (Exception ex)
        {
            mostrarMensaje(ex.Message);
        }
    }
}