using Microsoft.EntityFrameworkCore;
using Recipes.Application.Commands.Recipe;
using Recipes.Application.DataTransfer;
using Recipes.Application.Exceptions;
using Recipes.DataAccess;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Xml;

namespace Recipes.Implementation.Commands.RecipeCommands
{
    public class EfUpdateRecipeCommand : IUpdateRecipeCommand
    {
        private readonly RecipesContext _context;

        public EfUpdateRecipeCommand(RecipesContext context)
        {
            _context = context;
        }

        public int Id => 12;

        public string Name => "Update Recipe EF";

        public void Execute(RecipeDto request)
        {
            var recipe = _context.Recipes.Include(x => x.IngredientRecipes).Include(x => x.NutritionRecipes).Include(x => x.CategoryRecipes).Include(x => x.Steps).FirstOrDefault(x => request.Id == x.Id);

            if(recipe == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Recipe));
            }

            recipe.Name = request.Name;
            recipe.Description = request.Description;
            recipe.Servings = request.Servings;
            recipe.CookTime = request.CookTime;

            if(request.ImageFile != null)
            {
                var guid = Guid.NewGuid();

                var imageName = guid + "_" + request.ImageFile.FileName;

                var path = Path.Combine("wwwroot", "images", imageName);

                using (var fileStream = new FileStream(path, FileMode.Create))
                {
                    request.ImageFile.CopyTo(fileStream);
                }
            }
            

            recipe.CategoryRecipes
                .Where(x => !request.Categories.Select(y => y.Id).Contains(x.CategoryId))
                .ToList()
                .ForEach(y => recipe.CategoryRecipes.Remove(y));
            var existingCategories = recipe.CategoryRecipes.Select(x => x.CategoryId);
            _context.Categories
                .Where(x => request.Categories.Select(y => y.Id).Except(existingCategories).Contains(x.Id))
                .ToList()
                .ForEach(category => _context.CategoryRecipes.Add(new CategoryRecipe
                {
                    Category = category,
                    Recipe = recipe
                }));

            recipe.IngredientRecipes
                .Where(x => !request.Ingredients.Select(y => y.Id).Contains(x.IngredientId))
                .ToList()
                .ForEach(x => recipe.IngredientRecipes.Remove(x));
            var existingIngredients = recipe.IngredientRecipes.Select(x => x.IngredientId);
            request.Ingredients
                .Where(x => request.Ingredients.Select(y => y.Id).Except(existingIngredients).Contains(x.Id))
                .ToList()
                .ForEach(ingredient => _context.IngredientRecipes.Add(new IngredientRecipe
                {
                    IngredientId = ingredient.Id,
                    Recipe = recipe,
                    Amount = ingredient.Amount
                }));

            recipe.NutritionRecipes
                .Where(x => !request.Nutritions.Select(y => y.Id).Contains(x.NutritionId))
                .ToList()
                .ForEach(x => recipe.NutritionRecipes.Remove(x));
            var existingNutritions = recipe.NutritionRecipes.Select(x => x.NutritionId);
            request.Nutritions
                .Where(x => request.Nutritions.Select(y => y.Id).Except(existingNutritions).Contains(x.Id))
                .ToList()
                .ForEach(nutrition => _context.NutritionRecipes.Add(new NutritionRecipe
                {
                    NutritionId = nutrition.Id,
                    Recipe = recipe,
                    Amount = nutrition.Amount
                }));

            _context.SaveChanges();
        }
    }
}
