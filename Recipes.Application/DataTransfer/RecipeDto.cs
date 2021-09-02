using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Application.DataTransfer
{
    public class RecipeDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public IFormFile ImageFile { get; set; }
        public string Image { get; set; }
        public float Servings { get; set; }
        public int CookTime { get; set; }
        public int UserId { get; set; }
        public string Author { get; set; }

        public IEnumerable<CategoryDto> Categories { get; set; } = new List<CategoryDto>();
        public IEnumerable<IngredientDtoWhenInsertingRecipe> Ingredients { get; set; } = new List<IngredientDtoWhenInsertingRecipe>();
        public IEnumerable<NutritionDtoWhenInsertingRecipe> Nutritions { get; set; } = new List<NutritionDtoWhenInsertingRecipe>();
        public IEnumerable<StepDto> Steps { get; set; } = new List<StepDto>();

    }
}
