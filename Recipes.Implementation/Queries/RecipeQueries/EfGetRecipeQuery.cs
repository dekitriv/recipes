using Microsoft.EntityFrameworkCore;
using Recipes.Application.DataTransfer;
using Recipes.Application.Exceptions;
using Recipes.Application.Queries.Recipe;
using Recipes.DataAccess;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Recipes.Implementation.Queries.RecipeQueries
{
    public class EfGetRecipeQuery : IGetRecipeQuery
    {
        private readonly RecipesContext _context;

        public EfGetRecipeQuery(RecipesContext context)
        {
            _context = context;
        }
        public int Id => 19;

        public string Name => "Search Recipe EF";

        public RecipeDto Execute(int search)
        {
            var recipe = _context.Recipes
                .Include(x => x.CategoryRecipes)
                .ThenInclude(x => x.Category)
                .Include(x => x.IngredientRecipes)
                .ThenInclude(x => x.Ingredient)
                .Include(x => x.NutritionRecipes)
                .ThenInclude(x => x.Nutrition)
                .Include(x => x.Steps)
                .Include(x => x.User)
                .FirstOrDefault(x => x.Id == search);

            if (recipe == null)
            {
                throw new EntityNotFoundException(search, typeof(Recipe));
            }

            return new RecipeDto
            {
                Id = recipe.Id,
                CookTime = recipe.CookTime,
                Servings = recipe.Servings,
                Description = recipe.Description,
                Author = recipe.User.FirstName + " " + recipe.User.LastName,
                Name = recipe.Name,
                Image = recipe.Image,
                UserId = recipe.UserId,
                Categories = recipe.CategoryRecipes.Select(x => new CategoryDto
                {
                    Id = x.CategoryId,
                    Name = x.Category.Name
                }),
                Ingredients = recipe.IngredientRecipes.Select(x => new IngredientDtoWhenInsertingRecipe
                {
                    Id = x.IngredientId,
                    Amount = x.Amount
                }),
                Nutritions = recipe.NutritionRecipes.Select(x => new NutritionDtoWhenInsertingRecipe
                {
                    Id = x.NutritionId,
                    Amount = x.Amount
                }),
                Steps = recipe.Steps.Select(x => new StepDto
                {
                    Id = x.Id,
                    RecipeId = x.RecipeId,
                    Order = x.Order,
                    Text = x.Text
                })
            };
        }
    }
}
