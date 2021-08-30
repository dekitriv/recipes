using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Domain
{
    public class CategoryRecipe 
    {
        public int CategoryId { get; set; }
        public int RecipeId { get; set; }

        public virtual Category Category { get; set; }
        public virtual Recipe Recipe { get; set; }
    }
}
