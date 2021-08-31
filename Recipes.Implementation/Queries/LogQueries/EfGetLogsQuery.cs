using Recipes.Application.DataTransfer;
using Recipes.Application.Queries;
using Recipes.Application.Queries.Log;
using Recipes.Application.Searches;
using Recipes.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Recipes.Implementation.Queries.LogQueries
{
    public class EfGetLogsQuery : IGetLogsQuery
    {
        private readonly RecipesContext _context;

        public EfGetLogsQuery(RecipesContext context)
        {
            _context = context;
        }
        public int Id => 24;

        public string Name => "Search Logs EF";

        public PagedResponse<LogDto> Execute(LogSearchDto search)
        {
            var logs = _context.UseCaseLogs.AsQueryable();

            if (!string.IsNullOrEmpty(search.Actor) || !string.IsNullOrWhiteSpace(search.Actor))
            {
                logs = logs.Where(x => x.Actor.ToLower().Contains(search.Actor.ToLower()));
            }
            if (search.DateMin.HasValue)
            {
                logs = logs.Where(x => x.CreatedAt >= search.DateMin);
            }
            if (search.DateMax.HasValue)
            {
                logs = logs.Where(x => x.CreatedAt <= search.DateMax);
            }

            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<LogDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = logs.Count(),
                Data = logs.Skip(skipCount).Take(search.PerPage).Select(x => new LogDto
                {
                    Id = x.Id,
                    Actor = x.Actor,
                    Data = x.Data,
                    UseCaseName = x.UseCaseName
                }).ToList()
            };

            return response;
        }
    }
}
