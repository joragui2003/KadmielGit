using Kadmiel.BusKadmiel;
using Kadmiel.BusKadmiel.EntityKadmiel;
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
        //if (Session["123"] == null)
        //{
        //    Response.Redirect("~/Pages/Login.aspx");
        //}
        //EntCliente ent = new EntCliente();
        //ent = (EntCliente)Session["123"];
        //pnlSalir.Visible = true;
        //lblUser.Text = string.Format("Bienvenido {0} ", ent.Nombre);
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
            cli.Password = txtPassword.Text;
            cli.FechaNaci = Convert.ToDateTime(txtFechNaci.Text);
            new BusCliente().Insertar(cli);
            Response.Redirect("~/Pages/Login.aspx");
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
            ent.Password = txtPass.Text;
            EntCliente log = new BusCliente().Obtener(ent.Usuario, ent.Password);
            if (log == null)
                throw new ApplicationException("Usuario y/o Contraseña incorrecta");
            Session["123"] = log;
            Response.Redirect("~/Pages/Verificentro.aspx");
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "error", "alert('" + ex.Message + "');", true);
        }
    }
}