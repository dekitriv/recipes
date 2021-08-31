using Recipes.Application.DataTransfer;
using Recipes.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Application.Queries.Log
{
    public interface IGetLogsQuery : IQuery<LogSearchDto, PagedResponse<LogDto>>
    {
    }
}
