using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Recipes.Application;
using Recipes.Application.Commands.Nutrition;
using Recipes.Application.DataTransfer;
using Recipes.Application.Queries.Ingredients;
using Recipes.Application.Queries.Nutritions;
using Recipes.Application.Searches;

namespace Recipes.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NutritionController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public NutritionController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Nutrition
        [HttpGet]
        public IActionResult Get([FromQuery] NutritionSearchDto search, [FromServices] IGetNutritionsQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET: api/Nutrition/5
        [HttpGet("{id}", Name = "GetNutrition")]
        public IActionResult Get(int id, [FromServices] IGetNutritionQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST: api/Nutrition
        [HttpPost]
        public IActionResult Post([FromBody] NutritionDto dto, [FromServices] ICreateNutritionCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(201);
        }

        // PUT: api/Nutrition/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] NutritionDto dto, [FromServices] IUpdateNutritionCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return StatusCode(204);
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteNutritionCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(204);
        }
    }
}
