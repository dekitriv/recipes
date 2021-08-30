using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Domain
{
    public class Category : Entity
    {
        public string Name { get; set; }

        public virtual ICollection<CategoryRecipe> CategoryRecipes { get; set; } = new HashSet<CategoryRecipe>();
    }
}
