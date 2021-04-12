using AuthenticationService.DTOs;
using AuthenticationService.Entities;
using AuthenticationService.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace AuthenticationService.Controllers
{
    [Route("api")]
    [ApiController]
    public class RegisterController : ControllerBase
    {
        private readonly IUserRepository _userRepository;
        public RegisterController(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        [HttpPost("register")]
        public IActionResult CreateUser([FromBody] RegisterInformation registerInformation)
        {
            User user = _userRepository.GetUserByEmail(registerInformation.Email);
            if (user != null)
            {
                return BadRequest("The account already exists.");
            }

            user = _userRepository.CreateUser(registerInformation);

            if (user != null)
            {
                return Created(nameof(User), "Account has been created.");
            }

            return StatusCode(503);
        }
    }
}
