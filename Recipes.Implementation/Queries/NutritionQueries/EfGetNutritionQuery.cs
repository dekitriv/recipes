using Recipes.Application.DataTransfer;
using Recipes.Application.Exceptions;
using Recipes.Application.Queries.Nutritions;
using Recipes.DataAccess;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Implementation.Queries.NutritionQueries
{
    public class EfGetNutritionQuery : IGetNutritionQuery
    {
        private readonly RecipesContext _context;

        public EfGetNutritionQuery(RecipesContext context)
        {
            _context = context;
        }
        public int Id => 17;

        public string Name => "Search Nutrition EF";

        public NutritionDto Execute(int search)
        {
            var nutrition = _context.Nutritions.Find(search);

            if (nutrition == null)
            {
                throw new EntityNotFoundException(search, typeof(Nutrition));
            }

            return new NutritionDto
            {
                Id = nutrition.Id,
                Name = nutrition.Name
            };
        }
    }
}
