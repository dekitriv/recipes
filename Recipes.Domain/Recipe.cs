using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Domain
{
    public class Recipe : Entity
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        public float Servings { get; set; }
        public int CookTime { get; set; }
        public int UserId { get; set; }

        public virtual User User { get; set; }
        public virtual ICollection<CategoryRecipe> CategoryRecipes { get; set; } = new HashSet<CategoryRecipe>();
        public virtual ICollection<NutritionRecipe> NutritionRecipes { get; set; } = new HashSet<NutritionRecipe>();
        public virtual ICollection<IngredientRecipe> IngredientRecipes { get; set; } = new HashSet<IngredientRecipe>();
        public virtual ICollection<Step> Steps { get; set; } = new HashSet<Step>();


    }
}
