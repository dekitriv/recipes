using FluentValidation;
using Recipes.Application.Commands.Recipe;
using Recipes.Application.DataTransfer;
using Recipes.DataAccess;
using Recipes.Domain;
using Recipes.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Recipes.Implementation.Commands.RecipeCommands
{
    public class EfCreateRecipeCommand : ICreateRecipeCommand
    {
        private readonly RecipesContext _context;
        private readonly CreateRecipeValidator _validator;


        public EfCreateRecipeCommand(RecipesContext context, CreateRecipeValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 10;

        public string Name => "Create Recipe EF";

        public void Execute(RecipeDto request)
        {
            _validator.ValidateAndThrow(request);

            

            var guid = Guid.NewGuid();

            var imageName = guid + "_" + request.ImageFile.FileName;

            var path = Path.Combine("wwwroot", "images", imageName);

            using (var fileStream = new FileStream(path, FileMode.Create))
            {
                request.ImageFile.CopyTo(fileStream);
            }

            var recipe = new Recipe
            {
                Name = request.Name,
                Description = request.Description,
                Image = imageName,
                Servings = request.Servings,
                CookTime = request.CookTime,
                UserId = request.UserId
            };


            foreach (var categoryId in request.Categories.Select(x => x.Id))
            {
                _context.CategoryRecipes.Add(new CategoryRecipe
                {
                    CategoryId = categoryId,
                    Recipe = recipe
                });
            }

            foreach (var ingredient in request.Ingredients)
            {
                _context.IngredientRecipes.Add(new IngredientRecipe
                {
                    IngredientId = ingredient.Id,
                    Amount = ingredient.Amount,
                    Recipe = recipe
                });
            }

            foreach (var nutrition in request.Nutritions)
            {
                _context.NutritionRecipes.Add(new NutritionRecipe
                {
                    NutritionId = nutrition.Id,
                    Amount = nutrition.Amount,
                    Recipe = recipe
                });
            }

            foreach (var step in request.Steps)
            {
                _context.Steps.Add(new Step
                {
                    Text = step.Text,
                    Order = step.Order,
                    Recipe = recipe
                });
            }

            _context.Recipes.Add(recipe);
            _context.SaveChanges();
        }
    }
}
