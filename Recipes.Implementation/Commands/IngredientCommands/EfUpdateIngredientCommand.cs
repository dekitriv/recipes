using Recipes.Application.Commands.Ingredient;
using Recipes.Application.DataTransfer;
using Recipes.Application.Exceptions;
using Recipes.DataAccess;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Implementation.Commands.IngredientCommands
{
    public class EfUpdateIngredientCommand : IUpdateIngredientCommand
    {
        private readonly RecipesContext _context;

        public EfUpdateIngredientCommand(RecipesContext context)
        {
            _context = context;
        }

        public int Id => 6;

        public string Name => "Update Ingredient EF";

        public void Execute(IngredientDto request)
        {
            var ingredient = _context.Ingredients.Find(request.Id);

            if (ingredient == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Ingredient));
            }

            ingredient.Name = request.Name;

            _context.SaveChanges();
        }
    }
}
