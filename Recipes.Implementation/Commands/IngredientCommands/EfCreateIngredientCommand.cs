using Recipes.Application.Commands.Ingredient;
using Recipes.Application.DataTransfer;
using Recipes.DataAccess;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Implementation.Commands.IngredientCommands
{
    public class EfCreateIngredientCommand : ICreateIngredientCommand
    {
        private readonly RecipesContext _context;

        public EfCreateIngredientCommand(RecipesContext context)
        {
            _context = context;
        }

        public int Id => 4;

        public string Name => "Create Ingredient EF";

        public void Execute(IngredientDto request)
        {
            var ingredient = new Ingredient
            {
                Name = request.Name
            };

            _context.Ingredients.Add(ingredient);
            _context.SaveChanges();
        }
    }
}
