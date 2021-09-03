using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Recipes.Application;
using Recipes.Application.Commands.Category;
using Recipes.Application.DataTransfer;
using Recipes.Application.Queries.Category;
using Recipes.Application.Searches;

namespace Recipes.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public CategoryController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Category
        [HttpGet]
        public IActionResult Get([FromQuery] CategorySearchDto search, [FromServices] IGetCategoriesQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET: api/Category/5
        [HttpGet("{id}", Name = "GetCategory")]
        public IActionResult Get(int id, [FromServices] IGetCategoryQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST: api/Category
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromBody] CategoryDto dto, [FromServices] ICreateCategoryCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(201);
        }

        // PUT: api/Category/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] CategoryDto dto, [FromServices] IUpdateCategoryCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return StatusCode(204);
        }

        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteCategoryCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(204);
        }
    }
}
