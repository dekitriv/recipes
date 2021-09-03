using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Recipes.Application;
using Recipes.Application.Commands.User;
using Recipes.Application.DataTransfer;
using Recipes.Application.Queries.User;
using Recipes.Application.Searches;

namespace Recipes.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public UserController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/User
        [Authorize]
        [HttpGet]
        public IActionResult Get([FromQuery] UserSearchDto search, [FromServices] IGetUsersQuery query)
        {

            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET: api/User/5
        [Authorize]
        [HttpGet("{id}", Name = "GetUser")]
        public IActionResult Get(int id, [FromServices] IGetUserQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST: api/User
        [HttpPost]
        public IActionResult Post([FromBody] UserDto dto, [FromServices] ICreateUserCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(201);
        }
        // PUT: api/User/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] UserDto dto, [FromServices] IUpdateUserCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return StatusCode(204);
        }

        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteUserCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(204);
        }
    }
}
