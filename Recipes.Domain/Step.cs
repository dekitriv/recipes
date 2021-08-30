using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Domain
{
    public class Step : Entity
    {
        public string Text { get; set; }
        public int Order { get; set; }
        public int RecipeId { get; set; }

        public virtual Recipe Recipe { get; set; }
    }
}
