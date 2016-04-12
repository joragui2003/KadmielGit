using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;

/// <summary>
/// Descripción breve de EnviarCorreo
/// </summary>
public static class EnviarCorreo
{
    public static string Enviar(string para, string asunto, string cuerpo)
    {
        MailMessage email = new MailMessage();
        email.To.Add(new MailAddress(para));
        email.From = new MailAddress("mail@verificentrosdehidalgo.com");
        email.Subject = "Asunto :" + asunto;
        email.Body = cuerpo;
        email.IsBodyHtml = false;
        email.Priority = MailPriority.High;

        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtpout.secureserver.net";
        smtp.Port = 25;
        smtp.EnableSsl = false;
        smtp.UseDefaultCredentials = false;
        smtp.Credentials = new NetworkCredential("mail@verificentrosdehidalgo.com", "P@ssw0rd02");

        string output = null;
        try
        {
            smtp.Send(email);
            email.Dispose();
            return output = "Corre electrónico fue enviado satisfactoriamente.";
        }
        catch (Exception ex)
        {
            email.Dispose();
            return output = "Error enviando correo electrónico: " + ex.Message;
        }
    }
}