using Recipes.Application.Commands.Ingredient;
using Recipes.Application.Exceptions;
using Recipes.DataAccess;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Implementation.Commands.IngredientCommands
{
    public class EfDeleteIngredientCommand : IDeleteIngredientCommand
    {
        private readonly RecipesContext _context;

        public EfDeleteIngredientCommand(RecipesContext context)
        {
            _context = context;
        }

        public int Id => 5;

        public string Name => "Delete Ingredient EF";

        public void Execute(int request)
        {
            var ingredient = _context.Ingredients.Find(request);

            if (ingredient == null)
            {
                throw new EntityNotFoundException(request, typeof(Ingredient));
            }

            ingredient.IsDeleted = true;
            ingredient.DeletedAt = DateTime.Now;

            _context.SaveChanges();
        }
    }
}
