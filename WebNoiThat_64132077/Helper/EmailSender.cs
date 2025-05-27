using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;

namespace WebNoiThat_64132077.Helper
{
    public class EmailSender
    {
        public static void SendEmail(string toEmail, string subject, string body)
        {
            var message = new MailMessage("tai.nm.64cntt@ntu.edu.vn", toEmail);
            message.Subject = subject;
            message.Body = body;
            message.IsBodyHtml = true;

            using (var smtp = new SmtpClient("smtp.gmail.com", 587))
            {
                smtp.Credentials = new NetworkCredential("tai.nm.64cntt@ntu.edu.vn", "spkp eczd byoo hprm");
                smtp.EnableSsl = true;
                smtp.Send(message);
            }
        }
    }
}