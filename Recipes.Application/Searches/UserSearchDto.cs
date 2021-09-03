using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Application.Searches
{
    public class UserSearchDto : PagedSearch
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public IEnumerable<int> UseCaseIds { get; set; } = new List<int>();
    }
}
