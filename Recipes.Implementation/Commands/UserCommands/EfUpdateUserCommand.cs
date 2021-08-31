using FluentValidation;
using Recipes.Application.Commands.User;
using Recipes.Application.DataTransfer;
using Recipes.Application.Exceptions;
using Recipes.DataAccess;
using Recipes.Domain;
using Recipes.Implementation.Helpers;
using Recipes.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Recipes.Implementation.Commands.UserCommands
{
    public class EfUpdateUserCommand : IUpdateUserCommand
    {
        private readonly RecipesContext _context;
        private readonly UpdateUserValidator _validator;

        public EfUpdateUserCommand(RecipesContext context, UpdateUserValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 23;

        public string Name => "Update User EF";

        public void Execute(UserDto request)
        {
            var user = _context.Users.Find(request.Id);
            var oldPassword = user.Password;

            if (user == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(User));
            }

            _validator.ValidateAndThrow(request);


            if (!string.IsNullOrWhiteSpace(request.Password))
            {
                user.Password = request.Password.ComputeSHA256Hash();
            }
            else
            {
                user.Password = oldPassword;
            }

            user.FirstName = request.FirstName;
            user.LastName = request.LastName;
            user.Email = request.Email;

            user.UserUseCases
                .Where(uuc => !request.AllowedUseCases.Contains(uuc.UseCaseId))
                .ToList()
                .ForEach(uc => user.UserUseCases.Remove(uc));

            var existingUserUseCaseIds = user.UserUseCases.Select(uuc => uuc.UseCaseId);

            request.AllowedUseCases.Except(existingUserUseCaseIds).ToList().ForEach(useCaseId => _context.UserUseCase.Add(new UserUseCase
            {
                User = user,
                UseCaseId = useCaseId
            }));


            _context.SaveChanges();
        }
    }
}
