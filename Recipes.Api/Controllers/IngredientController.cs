using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Recipes.Application;
using Recipes.Application.Commands.Ingredient;
using Recipes.Application.DataTransfer;
using Recipes.Application.Queries.Ingredients;
using Recipes.Application.Searches;

namespace Recipes.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class IngredientController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public IngredientController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Ingredient
        [HttpGet]
        public IActionResult Get([FromQuery] IngredientSearchDto search, [FromServices] IGetIngredientsQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET: api/Ingredient/5
        [HttpGet("{id}", Name = "GetIngredient")]
        public IActionResult Get(int id, [FromServices] IGetIngredientQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }
        // POST: api/Ingredient
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromBody] IngredientDto dto, [FromServices] ICreateIngredientCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(201);
        }

        // PUT: api/Ingredient/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] IngredientDto dto, [FromServices] IUpdateIngredientCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return StatusCode(204);
        }

        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteIngredientCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(204);
        }
    }
}
