using FluentValidation;
using Recipes.Application.Commands.Ingredient;
using Recipes.Application.DataTransfer;
using Recipes.DataAccess;
using Recipes.Domain;
using Recipes.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Implementation.Commands.IngredientCommands
{
    public class EfCreateIngredientCommand : ICreateIngredientCommand
    {
        private readonly RecipesContext _context;
        private readonly CreateIngredientValidator _validator;


        public EfCreateIngredientCommand(RecipesContext context, CreateIngredientValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 4;

        public string Name => "Create Ingredient EF";

        public void Execute(IngredientDto request)
        {
            _validator.ValidateAndThrow(request);

            var ingredient = new Ingredient
            {
                Name = request.Name
            };

            _context.Ingredients.Add(ingredient);
            _context.SaveChanges();
        }
    }
}
