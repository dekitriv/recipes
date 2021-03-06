using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Application.Searches
{
    public abstract class PagedSearch
    {
        public string Keyword { get; set; }
        public int PerPage { get; set; } = 10;
        public int Page { get; set; } = 1;
    }
}
