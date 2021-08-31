using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Application.Email
{
    public interface IEmailSender
    {
        void Send(SendEmail send);
    }
}
