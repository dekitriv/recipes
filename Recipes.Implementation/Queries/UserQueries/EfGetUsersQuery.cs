using Microsoft.EntityFrameworkCore;
using Recipes.Application.DataTransfer;
using Recipes.Application.Queries;
using Recipes.Application.Queries.User;
using Recipes.Application.Searches;
using Recipes.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Recipes.Implementation.Queries.UserQueries
{
    public class EfGetUsersQuery : IGetUsersQuery
    {
        public readonly RecipesContext _context;

        public EfGetUsersQuery(RecipesContext context)
        {
            _context = context;
        }

        public int Id => 26;

        public string Name => "Get Users EF";

        public PagedResponse<UserDto> Execute(UserSearchDto search)
        {
            var users = _context.Users.Include(x => x.UserUseCases).AsQueryable();

            var skipCount = search.PerPage * (search.Page - 1);

            if (!string.IsNullOrEmpty(search.FirstName) || !string.IsNullOrWhiteSpace(search.FirstName))
            {
                users = users.Where(x => x.FirstName.ToLower().Contains(search.FirstName.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.LastName) || !string.IsNullOrWhiteSpace(search.LastName))
            {
                users = users.Where(x => x.LastName.ToLower().Contains(search.LastName.ToLower()));
            }

            if (search.UseCaseIds.Count() > 0)
            {
                users = users.Where(x => x.UserUseCases.Any(x => search.UseCaseIds.Contains(x.UseCaseId)));
            }

            var response = new PagedResponse<UserDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = users.Count(),
                Data = users.Skip(skipCount).Take(search.PerPage).Select(x => new UserDto
                {
                    Id = x.Id,
                    FirstName = x.FirstName,
                    LastName = x.LastName,
                    Email = x.Email,
                    AllowedUseCases = x.UserUseCases.Select(x => x.UseCaseId).ToList()
                }).ToList()
            };

            return response;
        }
    }
}
