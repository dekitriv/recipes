using Recipes.Application.DataTransfer;
using Recipes.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Application.Queries.Ingredients
{
    public interface IGetIngredientsQuery : IQuery<IngredientSearchDto, PagedResponse<IngredientDto>>
    {
    }
}
