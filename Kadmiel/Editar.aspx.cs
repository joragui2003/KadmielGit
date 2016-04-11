using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Kadmiel.BusKadmiel.EntityKadmiel;
using Kadmiel.BusKadmiel;
using Kadmiel.BusKadmiel.UtilityKadmiel;

public partial class Editar : System.Web.UI.Page
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
            pnlPassword.Visible = false;
            ent = (EntCliente)Session["123"];
            lblBienvenido.Text = ent.Email;
            hfIdCliente.Value = ent.Id.ToString();
            if (!IsPostBack)
            {
                txtCorreo.Text = ent.Email;             
            }
        }
        catch (Exception ex)
        {
            MostrarMensaje(ex.Message);
        }
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
            MostrarMensaje(ex.Message);
        }
    }
    public void MostrarMensaje(string mensaje)
    {
        string script = "alert('" + mensaje.Replace("\"", "'") + "');";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "error", script, true);
    }
    protected void lnkCambCont_Click(object sender, EventArgs e)
    {
        pnlPassword.Visible = true;
    }
    protected void lnkCancCont_Click(object sender, EventArgs e)
    {
        pnlPassword.Visible = false;
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        try
        {
            EntCliente cli = (EntCliente)Session["123"];
            //txtNombre.Text = cli.Nombre;
            //txtPaterno.Text = cli.Paterno;
            //txtMaterno.Text = cli.Materno;
            txtCorreo.Text = cli.Email;
            //txtTelefono.Text = cli.Telefono;
            //txtEmpresa.Text = cli.Empresa;
            //txtFechNaci.Text = cli.FechaNaci.ToString("dd/MM/yyyy");
            Response.Redirect("Autos.aspx");
        }
        catch (Exception ex)
        {
            MostrarMensaje(ex.Message);
        }
    }
    protected void btnActualizar_Click(object sender, EventArgs e)
    {
        try
        {
            EntCliente cli = (EntCliente)Session["123"];
            cli.Id = Convert.ToInt32(hfIdCliente.Value);
            cli.Nombre = "";
            cli.Paterno = "";
            cli.Materno = "";
            cli.Email = txtCorreo.Text.ToLower();
            cli.Telefono = "";
            cli.Empresa = "";
            cli.FechaNaci = Convert.ToDateTime("01/01/1990");
            //int mayor = CalculateAge.Calcular(Convert.ToDateTime(txtFechNaci.Text));
            //if (mayor >= 18)
            //    cli.FechaNaci = Convert.ToDateTime(txtFechNaci.Text);
            //else
            //    throw new ApplicationException("Debe de ser mayor de edad");
            cli.Estatus = chkEstatus.Checked;
            new BusCliente().Actualizar(cli);
            if (cli.Estatus == false)
            {
                Session.Clear();
                Response.Redirect("Editar.aspx");
            }
            //EntCliente log = new BusCliente().Obtener(cli.Email, cli.Password);
            //Session["123"] = log;
            Response.Redirect("Editar.aspx");
        }
        catch (Exception ex)
        {
            MostrarMensaje(ex.Message);
        }
    }
    protected void btnCambiarP_Click(object sender, EventArgs e)
    {
        try
        {
            EntCliente ent = (EntCliente)Session["123"];
            string passEncr = UtiCrypto.Encriptar(txtPasswordActual.Text);
            if (ent.Password == passEncr)
            {
                EntCliente cli = new EntCliente();
                cli.Id = Convert.ToInt32(hfIdCliente.Value);
                cli.Password = UtiCrypto.Encriptar(txtPasswordNuevo.Text);
                new BusCliente().ActualizarPass(cli);
                hfPassNvo.Value = cli.Password;
                this.programmaticModalPopup.Show();
            }
            else
                throw new ApplicationException("Contraseña Actual inválida");
        }
        catch (Exception ex)
        {
            MostrarMensaje(ex.Message);
        }
    }
    protected void lnkCerrar_Click(object sender, EventArgs e)
    {
        try
        {
            EntCliente ent = (EntCliente)Session["123"];
            string mailold = ent.Email;
            EntCliente nvo = new EntCliente();
            nvo.Email = mailold;
            nvo.Password = hfPassNvo.Value;
            EntCliente log = new BusCliente().Obtener(nvo.Email, nvo.Password);
            Session["123"] = log;
            this.programmaticModalPopup.Hide();
            Response.Redirect("Editar.aspx");
        }
        catch (Exception ex)
        {
            MostrarMensaje(ex.Message);
        }
    }
}