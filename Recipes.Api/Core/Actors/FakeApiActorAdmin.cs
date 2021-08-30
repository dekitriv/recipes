using Recipes.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Recipes.Api.Core.Actors
{
    public class FakeApiActorAdmin : IApplicationActor
    {
        public int Id => 2;

        public string Identity => "Fake Api Actor Admin";

        public IEnumerable<int> AllowedUseCases => Enumerable.Range(1, 50);
    }
}
