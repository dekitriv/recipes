using Recipes.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Application.Queries.Ingredients
{
    public interface IGetIngredientQuery : IQuery<int, IngredientDto>
    {
    }
}
