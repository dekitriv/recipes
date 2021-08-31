using Recipes.Application.Email;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace Recipes.Implementation.Email
{
    public class SmtpEmailSender : IEmailSender
    {
        public void Send(SendEmail send)
        {
            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential("recipes.asp@gmail.com", "sifrasifrica!")
            };

            var message = new MailMessage("recipes.asp@gmail.com", send.SendTo);
            message.Subject = send.Subject;
            message.Body = send.Content;
            message.IsBodyHtml = true;
            smtp.Send(message);
        }
    }
}
