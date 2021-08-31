using FluentValidation;
using Recipes.Application.Commands.User;
using Recipes.Application.DataTransfer;
using Recipes.Application.Email;
using Recipes.DataAccess;
using Recipes.Domain;
using Recipes.Implementation.Helpers;
using Recipes.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Implementation.Commands.UserCommands
{
    public class EfCreateUserCommand : ICreateUserCommand
    {
        private readonly RecipesContext _context;
        private readonly CreateUserValidator _validator;
        private readonly IEmailSender _sender;


        public EfCreateUserCommand(RecipesContext context, CreateUserValidator validator, IEmailSender sender)
        {
            _context = context;
            _validator = validator;
            _sender = sender;
        }

        public int Id => 21;

        public string Name => "Create User EF";

        public void Execute(UserDto request)
        {
            _validator.ValidateAndThrow(request);

            var user = new User
            {
                FirstName = request.FirstName,
                LastName = request.LastName,
                Email = request.Email,
                Password = request.Password.ComputeSHA256Hash()
            };

            var userUseCases = new List<int> { 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 };

            userUseCases.ForEach(useCase => _context.UserUseCase.Add(new UserUseCase
            {
                User = user,
                UseCaseId = useCase
            }));

            _context.Users.Add(user);
            _context.SaveChanges();

            _sender.Send(new SendEmail
            {
                Subject = "Successful registration",
                Content = "<h1>You have successfully registered!</h1>",
                SendTo = request.Email

            });
        }

    }
}
