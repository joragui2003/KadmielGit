using Kadmiel.BusKadmiel;
using Kadmiel.BusKadmiel.EntityKadmiel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
            Response.Redirect("~/Pages/Registro.aspx");
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "error", "alert('" + ex.Message + "');", true);
        }
    }
}