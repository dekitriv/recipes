using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Recipes.Application;
using Recipes.Application.Commands.Recipe;
using Recipes.Application.DataTransfer;
using Recipes.Application.Queries.Recipe;
using Recipes.Application.Searches;

namespace Recipes.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RecipeController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public RecipeController(UseCaseExecutor executor)
        {
            _executor = executor;
        }


        // GET: api/Recipe
        [HttpGet]
        public IActionResult Get([FromQuery] RecipeSearchDto search, [FromServices] IGetRecipesQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET: api/Recipe/5
        [HttpGet("{id}", Name = "GetRecipe")]
        public IActionResult Get(int id, [FromServices] IGetRecipeQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST: api/Recipe
        [HttpPost]
        public IActionResult Post([FromBody] RecipeDto dto, [FromServices] ICreateRecipeCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(201);
        }

        // PUT: api/Recipe/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] RecipeDto dto, [FromServices] IUpdateRecipeCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return StatusCode(204);
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
