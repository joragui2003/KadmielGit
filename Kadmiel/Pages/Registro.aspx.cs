using Kadmiel.BusKadmiel;
using Kadmiel.BusKadmiel.EntityKadmiel;
using Kadmiel.BusKadmiel.UtilityKadmiel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Registro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            EntCliente cli = new EntCliente();
            cli.Nombre = txtNombre.Text;
            cli.Paterno = txtPaterno.Text;
            cli.Materno = txtMaterno.Text;
            cli.Email = txtCorreo.Text;
            cli.Telefono = txtTelefono.Text;
            cli.Empresa = txtEmpresa.Text;
            cli.Usuario = txtUsuario.Text;
            string pass = UtiCrypto.Encriptar(txtPassword.Text);
            cli.Password = pass;
            cli.FechaNaci = Convert.ToDateTime(txtFechNaci.Text);
            new BusCliente().Insertar(cli);
            Response.Redirect(Request.CurrentExecutionFilePath);
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

    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect(Request.CurrentExecutionFilePath);
    }

    protected void btnEntrar_Click1(object sender, EventArgs e)
    {
        try
        {
            EntCliente ent = new EntCliente();
            ent.Usuario = txtUser.Text;
            ent.Password = UtiCrypto.Encriptar(txtPass.Text);
            EntCliente log = new BusCliente().Obtener(ent.Usuario, ent.Password);
            if (log == null)
                throw new ApplicationException("Usuario y/o Contraseña incorrecta");
            Session["123"] = log;
            Response.Redirect("~/Pages/Autos.aspx");
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "error", "alert('" + ex.Message + "');", true);
        }
    }
}