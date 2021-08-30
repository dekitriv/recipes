using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Domain
{
    public class Ingredient : Entity
    {
        public string Name { get; set; }

        public virtual ICollection<IngredientRecipe> IngredientRecipes { get; set; } = new HashSet<IngredientRecipe>();

    }
}
