using Recipes.Application.Commands.Nutrition;
using Recipes.Application.DataTransfer;
using Recipes.DataAccess;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Implementation.Commands.NutritionCommands
{
    public class EfCreateNutritionCommand : ICreateNutritionCommand
    {
        private readonly RecipesContext _context;

        public EfCreateNutritionCommand(RecipesContext context)
        {
            _context = context;
        }

        public int Id => 7;

        public string Name => "Create Nutrition EF";

        public void Execute(NutritionDto request)
        {
            var nutrition = new Nutrition
            {
                Name = request.Name
            };

            _context.Nutritions.Add(nutrition);
            _context.SaveChanges();
        }
    }
}

