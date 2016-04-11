using Kadmiel.BusKadmiel;
using Kadmiel.BusKadmiel.EntityKadmiel;
using Kadmiel.BusKadmiel.UtilityKadmiel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Reflection;
using System.Text;

public partial class Registro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        try
        {
            //The code that causes the error goes here.
        }
        catch (ReflectionTypeLoadException ex)
        {
            StringBuilder sb = new StringBuilder();
            foreach (Exception exSub in ex.LoaderExceptions)
            {
                sb.AppendLine(exSub.Message);
                if (exSub is FileNotFoundException)
                {
                    FileNotFoundException exFileNotFound = exSub as FileNotFoundException;
                    if (!string.IsNullOrEmpty(exFileNotFound.FusionLog))
                    {
                        sb.AppendLine("Fusion Log:");
                        sb.AppendLine(exFileNotFound.FusionLog);
                    }
                }
                sb.AppendLine();
            }
            string errorMessage = sb.ToString();
            Title = errorMessage;
            //Display or log the error based on your application.
        }
    }
    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            EntCliente cli = new EntCliente();
            cli.Nombre = "";
            cli.Paterno = "";
            cli.Materno = "";
            cli.Email = txtCorreo.Text;
            cli.Telefono = "";
            cli.Empresa = "";
            cli.Usuario = "";
            string pass = UtiCrypto.Encriptar(txtPassword.Text);
            cli.Password = pass;
            cli.FechaNaci = Convert.ToDateTime("01/01/1990");
            //int mayor = CalculateAge.Calcular(Convert.ToDateTime(txtFechNaci.Text));
            //if (mayor >= 18)
            //    cli.FechaNaci = Convert.ToDateTime(txtFechNaci.Text);
            //else
            //    throw new ApplicationException("Debe de ser mayor de edad");
            if (!chkAviso.Checked)
                throw new ApplicationException("Se deben de aceptar los términos y condiciones para registrarse!!!");

            new BusCliente().Insertar(cli);
            string asunto = "Confirmación de Alta";
            string cuerpo = "Gracias por registrarte " + cli.Email + ", ahora agrega tus vehículos en el menú Mis Autos. \n www.verificentrosdehidalgo.com/Autos.aspx";
            UtiCorreo.MandarCorreo(cli.Email, asunto, cuerpo);
            UtiCorreo.MandarCorreo("verificentrosdehidalgo@gmail.com", "Alta de Usuario", "Se agregó un nuevo cliente a tu página web: " + cli.Email);
            this.programmaticModalPopup.Show();
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
        Response.Redirect("Registro.aspx");
    }
    protected void btnEntrar_Click1(object sender, EventArgs e)
    {
        try
        {
            EntCliente ent = new EntCliente();
            ent.Email = txtMailEnt.Text;
            ent.Password = UtiCrypto.Encriptar(txtPass.Text);
            EntCliente log = new BusCliente().Obtener(ent.Email, ent.Password);
            if (log == null)
                throw new ApplicationException("Correo electrónico y/o Contraseña incorrecta");
            log.Estatus = true;
            new BusCliente().ActualizarEsta(log);
            Session["123"] = log;
            Response.Redirect("Autos.aspx");
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "error", "alert('" + ex.Message + "');", true);
        }
    }
    protected void lnkCerrar_Click(object sender, EventArgs e)
    {
        try
        {
            this.programmaticModalPopup.Hide();
            Response.Redirect("Autos.aspx");
        }
        catch (Exception ex)
        {
            MostrarMensaje(ex.Message);
        }
    }
    //protected void lnkRecuUser_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        Response.Redirect("Recuperar.aspx");
    //    }
    //    catch (Exception ex)
    //    {
    //        MostrarMensaje(ex.Message);
    //    }
    //}
    protected void lnkRecuPass_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("Recuperar.aspx#lnkRecuPass");
        }
        catch (Exception ex)
        {
            MostrarMensaje(ex.Message);
        }
    }
}