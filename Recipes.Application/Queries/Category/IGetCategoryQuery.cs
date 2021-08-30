using Recipes.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Application.Queries.Category
{
    public interface IGetCategoryQuery : IQuery<int, CategoryDto>
    {
    }
}
