using Recipes.Application.DataTransfer;
using Recipes.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Application.Queries.Nutritions
{
    public interface IGetNutritionsQuery : IQuery<NutritionSearchDto, PagedResponse<NutritionDto>>
    {
    }
}
