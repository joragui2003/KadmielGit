using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Kadmiel.BusKadmiel.EntityKadmiel;
using Kadmiel.BusKadmiel;
using Kadmiel.BusKadmiel.UtilityKadmiel;

public partial class Recuperar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //protected void btnEnviarUser_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        EntCliente cli = new BusCliente().Obtener(txtUser.Text);
    //        lblCorreo.Text = cli.Email;
    //        UtiCorreo.MandarCorreo(cli.Email, "Recuperación de Usuario/Contraseña", "Haz solicitado recuperar tu nombre de usuario, \n Tu nombre de usuario es:  " + cli.Usuario + " \n \nRecuerda que puedes editar tus datos dentro de \"Mis Autos\"");
    //        this.programmaticModalPopup.Show();
    //    }
    //    catch (Exception ex)
    //    {
    //        MostrarMensaje(ex.Message);
    //    }
    //}
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
    public void MostrarMensaje(string mensaje)
    {
        string script = "alert('" + mensaje.Replace("\"", "'") + "');";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "error", script, true);
    }
    protected void btnEnviarPass_Click(object sender, EventArgs e)
    {
        try
        {
            EntCliente cli = new BusCliente().Obtener(txtPass.Text);
            lblCorreo.Text = cli.Email;
            string pass = UtiCrypto.DesEncriptar(cli.Password);
            UtiCorreo.MandarCorreo(cli.Email, "Recuperación de Contraseña", "Haz solicitado recuperar tu contraseña, \n Tu contraseña es:  " + pass + " \n\nRecuerda que puedes editar tus datos dentro de \"Mis Autos\" \n www.verificentrosdehidalgo.com");
            this.programmaticModalPopup.Show();
        }
        catch (Exception ex)
        {
            MostrarMensaje(ex.Message);
        }
    }
}