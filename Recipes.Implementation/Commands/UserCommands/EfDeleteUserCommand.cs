using Recipes.Application.Commands.User;
using Recipes.Application.Exceptions;
using Recipes.DataAccess;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Implementation.Commands.UserCommands
{
    public class EfDeleteUserCommand : IDeleteUserCommand
    {
        private readonly RecipesContext _context;

        public EfDeleteUserCommand(RecipesContext context)
        {
            _context = context;
        }

        public int Id => 22;

        public string Name => "Delete User EF";

        public void Execute(int request)
        {
            var user = _context.Users.Find(request);

            if (user == null)
            {
                throw new EntityNotFoundException(request, typeof(User));
            }

            user.IsDeleted = true;
            user.DeletedAt = DateTime.Now;

            _context.SaveChanges();
        }
    }
}
