using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Application.Searches
{
    public class LogSearchDto : PagedSearch
    {
        public DateTime? DateMin { get; set; }
        public DateTime? DateMax { get; set; }
        public string Actor { get; set; }

    }
}
