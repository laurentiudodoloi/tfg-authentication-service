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
        public async Task<IActionResult> Login([FromBody] LoginInformation loginInformation)
        {
            var request = _userRepository.GetUserByCredentials(loginInformation);
            if (request == null)
            {
                return NotFound(new
                {
                    Success = false,
                    Message = "Invalid email or password"
                });
            }

            return Ok(await request);
        }
    }
}
