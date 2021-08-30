using Recipes.Application.Commands;
using Recipes.Application.Commands.Recipe;
using Recipes.Application.DataTransfer;
using Recipes.Application.Exceptions;
using Recipes.DataAccess;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Implementation.Commands.RecipeCommands
{
    public class EfDeleteRecipeCommand : IDeleteRecipeCommand
    {
        private readonly RecipesContext _context;

        public EfDeleteRecipeCommand(RecipesContext context)
        {
            _context = context;
        }

        public int Id => 11;

        public string Name => "Delete Recipe EF";

        public void Execute(int request)
        {
            var recipe = _context.Recipes.Find(request);

            if(recipe == null)
            {
                throw new EntityNotFoundException(request, typeof(Recipe));
            }

            recipe.IsDeleted = true;
            recipe.DeletedAt = DateTime.Now;

            _context.SaveChanges();
        }
    }
}
