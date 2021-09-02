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
        public IEnumerable<int> AllowedUseCases => new List<int> { 13, 14, 15, 16, 17, 18, 19, 20}; 
        //public IEnumerable<int> AllowedUseCases => Enumerable.Range(1, 50);
    }
}
