using Recipes.Application.DataTransfer;
using Recipes.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Application.Queries.Recipe
{
    public interface IGetRecipeQuery : IQuery<int, RecipeDto>
    {
    }
}
