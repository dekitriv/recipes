using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Application.DataTransfer
{
    public class StepDto
    {
        public int Id { get; set; }
        public string Text { get; set; }
        public int Order { get; set; }
        public int RecipeId { get; set; }
    }
}
