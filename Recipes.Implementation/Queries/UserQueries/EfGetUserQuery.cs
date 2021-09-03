using Microsoft.EntityFrameworkCore;
using Recipes.Application.DataTransfer;
using Recipes.Application.Exceptions;
using Recipes.Application.Queries.User;
using Recipes.DataAccess;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Recipes.Implementation.Queries.UserQueries
{
    public class EfGetUserQuery : IGetUserQuery
    {
        public readonly RecipesContext _context;

        public EfGetUserQuery(RecipesContext context)
        {
            _context = context;
        }

        public int Id => 25;

        public string Name => "Get User EF";

        public UserDto Execute(int search)
        {
            var user = _context.Users.Include(u => u.UserUseCases).FirstOrDefault(u => u.Id == search);

            if (user == null)
            {
                throw new EntityNotFoundException(search, typeof(User));
            }

            return new UserDto
            {
                Id = user.Id,
                FirstName = user.FirstName,
                LastName = user.LastName,
                Email = user.Email,
                AllowedUseCases = user.UserUseCases.Select(x => x.UseCaseId).ToList()
            };
        }
    }
}
