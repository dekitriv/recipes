using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Recipes.Api.Core.Jwt;
using Recipes.Application.DataTransfer;
using Recipes.Implementation.Validators;

namespace Recipes.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly JwtManager _manager;

        public LoginController(JwtManager manager)
        {
            _manager = manager;
        }

        // POST: api/Login
        [HttpPost]
        public IActionResult Post([FromBody] LoginDto request, [FromServices] CreateLoginValidator validator)
        {
            validator.ValidateAndThrow(request);

            var token = _manager.MakeToken(request.Email, request.Password);

            if (token == null)
            {
                return Unauthorized();
            }

            return Ok(new
            {
                token
            });
        }
    }
}
