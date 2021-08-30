using Recipes.Application.Commands.Nutrition;
using Recipes.Application.Exceptions;
using Recipes.DataAccess;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Implementation.Commands.NutritionCommands
{
    public class EfDeleteNutritionCommand : IDeleteNutritionCommand
    {
        private readonly RecipesContext _context;

        public EfDeleteNutritionCommand(RecipesContext context)
        {
            _context = context;
        }

        public int Id => 9;

        public string Name => "Delete Nutrition EF";

        public void Execute(int request)
        {
            var nutrition = _context.Nutritions.Find(request);

            if (nutrition == null)
            {
                throw new EntityNotFoundException(request, typeof(Nutrition));
            }

            nutrition.IsDeleted = true;
            nutrition.DeletedAt = DateTime.Now;

            _context.SaveChanges();
        }
    }
}
