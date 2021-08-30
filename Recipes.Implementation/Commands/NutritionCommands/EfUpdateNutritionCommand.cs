using Recipes.Application.Commands.Nutrition;
using Recipes.Application.DataTransfer;
using Recipes.Application.Exceptions;
using Recipes.DataAccess;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Implementation.Commands.NutritionCommands
{
    public class EfUpdateNutritionCommand : IUpdateNutritionCommand
    {
        private readonly RecipesContext _context;

        public EfUpdateNutritionCommand(RecipesContext context)
        {
            _context = context;
        }

        public int Id => 9;

        public string Name => "Update Nutrition EF";

        public void Execute(NutritionDto request)
        {
            var nutrition = _context.Nutritions.Find(request.Id);

            if (nutrition == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Nutrition));
            }

            nutrition.Name = request.Name;

            _context.SaveChanges();
        }
    }
}
