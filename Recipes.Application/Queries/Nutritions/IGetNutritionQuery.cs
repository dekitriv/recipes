using Recipes.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Application.Queries.Nutritions
{
    public interface IGetNutritionQuery : IQuery<int, NutritionDto>
    {
    }
}
