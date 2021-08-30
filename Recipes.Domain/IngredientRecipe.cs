using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Domain
{
    public class IngredientRecipe
    {
        public int IngredientId { get; set; }
        public int RecipeId { get; set; }
        public string Amount { get; set; }

        public virtual Ingredient Ingredient { get; set; }
        public virtual Recipe Recipe { get; set; }
    }
}
