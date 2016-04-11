using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_cPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void MostrarMensaje(string mensaje)
    {
        string script = "alert('" + mensaje.Replace("\"","'") + "');";
        ScriptManager.RegisterStartupScript(this,this.GetType(),"error", script, true);
    }
}