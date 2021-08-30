using Microsoft.EntityFrameworkCore;
using Recipes.Application.DataTransfer;
using Recipes.Application.Exceptions;
using Recipes.Application.Queries;
using Recipes.Application.Queries.Recipe;
using Recipes.Application.Searches;
using Recipes.DataAccess;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Recipes.Implementation.Queries.RecipeQueries
{
    public class EfGetRecipesQuery : IGetRecipesQuery
    {
        private readonly RecipesContext _context;

        public EfGetRecipesQuery(RecipesContext context)
        {
            _context = context;
        }
        public int Id => 20;

        public string Name => "Search Recipes EF";

        public PagedResponse<RecipeDto> Execute(RecipeSearchDto search)
        {
            var query = _context.Recipes
                .Include(x => x.CategoryRecipes)
                .ThenInclude(x => x.Category)
                .Include(x => x.IngredientRecipes)
                .ThenInclude(x => x.Ingredient)
                .Include(x => x.NutritionRecipes)
                .ThenInclude(x => x.Nutrition)
                .Include(x => x.Steps)
                .Include(x => x.User)
                .AsQueryable();

            if (!string.IsNullOrEmpty(search.Keyword) && !string.IsNullOrWhiteSpace(search.Keyword))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Keyword.ToLower()) ||
                                         x.Description.ToLower().Contains(search.Keyword.ToLower()) ||
                                         x.User.FirstName.ToLower().Contains(search.Keyword.ToLower()) ||
                                         x.User.LastName.ToLower().Contains(search.Keyword.ToLower()));
            }

            if (search.ServingsMin.HasValue)
                query = query.Where(x => x.Servings >= search.ServingsMin);

            if (search.ServingsMax.HasValue)
                query = query.Where(x => x.Servings <= search.ServingsMax);

            if (search.CookTimeMin.HasValue)
                query = query.Where(x => x.CookTime >= search.CookTimeMin);

            if (search.CookTimeMax.HasValue)
                query = query.Where(x => x.CookTime <= search.CookTimeMax);

            if (search.CategoryIds.Count() > 0)
                query = query.Where(x => x.CategoryRecipes.Any(y => search.CategoryIds.Contains(y.CategoryId)));

            if (search.IngredientIds.Count() > 0)
                query = query.Where(x => x.IngredientRecipes.Any(y => search.IngredientIds.Contains(y.IngredientId)));

            if (search.UserIds.Count() > 0)
                query = query.Where(x => search.UserIds.Contains(x.UserId));

            var skipCount = search.PerPage * (search.Page - 1);

            return new PagedResponse<RecipeDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Data = query.Skip(skipCount).Take(search.PerPage).Select(recipe => new RecipeDto
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
                }).ToList()
            };
        }
    }
}
