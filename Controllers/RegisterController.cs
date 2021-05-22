using AuthenticationService.DTOs;
using AuthenticationService.Entities;
using AuthenticationService.Repositories;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

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
        public async Task<IActionResult> CreateUser([FromBody] RegisterInformation registerInformation)
        {
            User user = await _userRepository.GetUserByEmail(registerInformation.Email);
            if (user != null)
            {
                return BadRequest(new {
                    Success = false,
                    Message = "The account already exists"
                });
            }

            user = await _userRepository.CreateUser(registerInformation);

            if (user != null)
            {
                return Created(nameof(User), new {
                    Success = true,
                    Message = "Account has been created.",
                    Id = user.Id
                });
            }

            return StatusCode(503);
        }
    }
}
