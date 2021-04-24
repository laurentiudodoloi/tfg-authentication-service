using Microsoft.AspNetCore.Mvc;
using AuthenticationService.Repositories;
using AuthenticationService.DTOs;
using System.Threading.Tasks;

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
        public async Task<IActionResult> Auth([FromBody] LoginInformation loginInformation)
        {
            var authenticatedUser = await _userRepository.GetUserByCredentials(loginInformation);
            if (authenticatedUser == null)
            {
                return NotFound("Invalid email or password.");
            }

            return Ok(authenticatedUser);
        }
    }
}
