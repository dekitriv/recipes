using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Domain
{
    public class Nutrition : Entity
    {
        public string Name { get; set; }

        public virtual ICollection<NutritionRecipe> NutritionRecipes { get; set; } = new HashSet<NutritionRecipe>();
    }
}
