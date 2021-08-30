using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Application.Searches
{
    public class RecipeSearchDto : PagedSearch
    {
        public int? ServingsMin { get; set; }
        public int? ServingsMax { get; set; }
        public int? CookTimeMin { get; set; }
        public int? CookTimeMax { get; set; }
        public IEnumerable<int> CategoryIds { get; set; } = new List<int>();
        public IEnumerable<int> IngredientIds { get; set; } = new List<int>();
        public IEnumerable<int> UserIds { get; set; } = new List<int>();

    }
}
