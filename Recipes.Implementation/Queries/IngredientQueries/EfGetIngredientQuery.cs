using Recipes.Application.DataTransfer;
using Recipes.Application.Exceptions;
using Recipes.Application.Queries.Ingredients;
using Recipes.DataAccess;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Implementation.Queries.IngredientQueries
{
    public class EfGetIngredientQuery : IGetIngredientQuery
    {
        private readonly RecipesContext _context;

        public EfGetIngredientQuery(RecipesContext context)
        {
            _context = context;
        }
        public int Id => 15;

        public string Name => "Search Ingredient EF";

        public IngredientDto Execute(int search)
        {
            var ingredient = _context.Ingredients.Find(search);

            if (ingredient == null)
            {
                throw new EntityNotFoundException(search, typeof(Ingredient));
            }

            return new IngredientDto
            {
                Id = ingredient.Id,
                Name = ingredient.Name
            };
        }
    }
}
