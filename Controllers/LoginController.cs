using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.AspNetCore.Http;
using AuthenticationService.Data;
using AuthenticationService.Entities;
using AuthenticationService.Repositories;
using AuthenticationService.DTOs;

namespace AuthenticationService.Controllers
{
    [Route("api")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly IUserRepository _userRepository;
        public LoginController(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        [HttpPost("login")]
        public IActionResult Auth([FromBody] LoginInformation loginInformation)
        {
            var user = _userRepository.GetUserByCredentials(loginInformation);
            if (user == null)
            {
                return NotFound("Invalid email or password.");
            }

            return Ok(user);
        }
    }
}
