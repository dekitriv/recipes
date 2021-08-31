using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Recipes.Application;
using Recipes.Application.Queries.Log;
using Recipes.Application.Searches;

namespace Recipes.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LogController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public LogController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Log
        [HttpGet]
        public IActionResult Get([FromQuery] LogSearchDto search, [FromServices] IGetLogsQuery query)
        {

            return Ok(_executor.ExecuteQuery(query, search));
        }

    }
}
