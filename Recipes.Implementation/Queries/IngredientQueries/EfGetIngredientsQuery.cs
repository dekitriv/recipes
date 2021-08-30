using Recipes.Application.DataTransfer;
using Recipes.Application.Queries;
using Recipes.Application.Queries.Ingredients;
using Recipes.Application.Searches;
using Recipes.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Recipes.Implementation.Queries.IngredientQueries
{
    public class EfGetIngredientsQuery : IGetIngredientsQuery
    {
        private readonly RecipesContext _context;

        public EfGetIngredientsQuery(RecipesContext context)
        {
            _context = context;
        }
        public int Id => 16;

        public string Name => "Search Ingredients EF";

        public PagedResponse<IngredientDto> Execute(IngredientSearchDto search)
        {
            var query = _context.Ingredients.AsQueryable();

            if (!string.IsNullOrEmpty(search.Keyword) && !string.IsNullOrWhiteSpace(search.Keyword))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Keyword.ToLower()));
            }

            var skipCount = search.PerPage * (search.Page - 1);

            return new PagedResponse<IngredientDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Data = query.Skip(skipCount).Take(search.PerPage).Select(x => new IngredientDto
                {
                    Id = x.Id,
                    Name = x.Name
                }).ToList()
            };
        }
    }
}
