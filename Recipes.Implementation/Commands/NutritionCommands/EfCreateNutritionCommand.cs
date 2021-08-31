using FluentValidation;
using Recipes.Application.Commands.Nutrition;
using Recipes.Application.DataTransfer;
using Recipes.DataAccess;
using Recipes.Domain;
using Recipes.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Implementation.Commands.NutritionCommands
{
    public class EfCreateNutritionCommand : ICreateNutritionCommand
    {
        private readonly RecipesContext _context;
        private readonly CreateNutritionValidator _validator;


        public EfCreateNutritionCommand(RecipesContext context, CreateNutritionValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 7;

        public string Name => "Create Nutrition EF";

        public void Execute(NutritionDto request)
        {
            _validator.ValidateAndThrow(request);

            var nutrition = new Nutrition
            {
                Name = request.Name
            };

            _context.Nutritions.Add(nutrition);
            _context.SaveChanges();
        }
    }
}

