using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Mail;
using System.Configuration;

namespace Kadmiel.BusKadmiel.UtilityKadmiel
{
    public static class UtiCorreo
    {

        /// <summary>
        /// 
        /// </summary>
        /// <param name="direccionAQuienSeManda"></param>
        /// <param name="tituloCorreo"></param>
        /// <param name="cuerpoCorreo"></param>
        public static void MandarCorreo(string direccionAQuienSeManda, string tituloCorreo, string cuerpoCorreo)
        {
            try
            {
                MailMessage mensaje = new MailMessage();

                string direccionQuienManda = ConfigurationManager.AppSettings["MAIL_DE"];

                mensaje.From = new MailAddress("mail@verificentrosdehidalgo.com"); //Aquí puede ir cualquier correo electrónico
                mensaje.To.Add(new MailAddress(direccionAQuienSeManda));
                mensaje.Subject = tituloCorreo;
                mensaje.Body = cuerpoCorreo;
                //Attachment at = new Attachment("Imagenes/espera_hotmail2.gif");
                //mensaje.Attachments.Add(at);

                mensaje.Priority = MailPriority.Normal;
                SmtpClient smtl = new SmtpClient();
                //smtl.EnableSsl = true;
                smtl.Host = ConfigurationManager.AppSettings["MAIL_SMTP"];       //"mail.tag-tic.com.mx";
                smtl.Port = Convert.ToInt32(ConfigurationManager.AppSettings["MAIL_PUERTO"]);  //26;
                string usuario = ConfigurationManager.AppSettings["MAIL_USUARIO"];
                string contraseña = ConfigurationManager.AppSettings["MAIL_PASSWORD"];
                smtl.Credentials = new System.Net.NetworkCredential(usuario, contraseña); //new System.Net.NetworkCredential("fill@tag-tic.com.mx", "fill");
                smtl.Send(mensaje);
            }
            catch (Exception ex)
            {
                ApplicationException a = new ApplicationException("No se mando el correo electrónico",ex);
                a.Data.Add("1", "DejarPasar");
                //throw a;
            }
        }

    }
}
