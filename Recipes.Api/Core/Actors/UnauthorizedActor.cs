using Recipes.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Recipes.Api.Core.Actors
{
    public class UnauthorizedActor : IApplicationActor
    {
        public int Id => 0;
        public string Identity => "Unauthorized Actor";
        public IEnumerable<int> AllowedUseCases => Enumerable.Range(1, 50);
    }
}
