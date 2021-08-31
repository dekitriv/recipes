using Recipes.Application.DataTransfer;
using Recipes.Application.Queries;
using Recipes.Application.Queries.Category;
using Recipes.Application.Searches;
using Recipes.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Recipes.Implementation.Queries.CategoryQueries
{
    public class EfGetCategoriesQuery : IGetCategoriesQuery
    {
        private readonly RecipesContext _context;

        public EfGetCategoriesQuery(RecipesContext context)
        {
            _context = context;
        }
        public int Id => 13;

        public string Name => "Search Categories EF";

        public PagedResponse<CategoryDto> Execute(CategorySearchDto search)
        {
            var query = _context.Categories.AsQueryable();

            if (!string.IsNullOrEmpty(search.Keyword) && !string.IsNullOrWhiteSpace(search.Keyword))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Keyword.ToLower()));
            }

            var skipCount = search.PerPage * (search.Page - 1);

            return new PagedResponse<CategoryDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Data = query.Skip(skipCount).Take(search.PerPage).Select(x => new CategoryDto
                {
                    Id = x.Id,
                    Name = x.Name
                }).ToList()
            };
        }
    }
}
