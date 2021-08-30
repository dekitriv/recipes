using Recipes.Application.DataTransfer;
using Recipes.Application.Queries;
using Recipes.Application.Queries.Nutritions;
using Recipes.Application.Searches;
using Recipes.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Recipes.Implementation.Queries.NutritionQueries
{
    public class EfGetNutritionsQuery : IGetNutritionsQuery
    {
        private readonly RecipesContext _context;

        public EfGetNutritionsQuery(RecipesContext context)
        {
            _context = context;
        }
        public int Id => 18;

        public string Name => "Search Nutritions EF";

        public PagedResponse<NutritionDto> Execute(NutritionSearchDto search)
        {
            var query = _context.Nutritions.AsQueryable();

            if (!string.IsNullOrEmpty(search.Keyword) && !string.IsNullOrWhiteSpace(search.Keyword))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Keyword.ToLower()));
            }

            var skipCount = search.PerPage * (search.Page - 1);

            return new PagedResponse<NutritionDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Data = query.Skip(skipCount).Take(search.PerPage).Select(x => new NutritionDto
                {
                    Id = x.Id,
                    Name = x.Name
                }).ToList()
            };
        }
    }
}
