using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Domain
{
    public class NutritionRecipe
    {
        public int NutritionId { get; set; }
        public int RecipeId { get; set; }
        public float Amount { get; set; }

        public virtual Nutrition Nutrition { get; set; }
        public virtual Recipe Recipe { get; set; }
    }
}
