using AuthenticationService.Data;
using AuthenticationService.DTOs;
using AuthenticationService.Entities;
using AuthenticationService.Helpers;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace AuthenticationService.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly DataContext _context;
        private readonly IConfiguration _configuration;

        private readonly ILogger _logger;
        public UserRepository(DataContext context, IConfiguration configuration, ILogger<object> logger)
        {
            _logger = logger;
            _context = context;
            _configuration = configuration;
        }

        public async Task<User> CreateUser(RegisterInformation registerInformation)
        {
            string encriptedPassword = EncryptPassword(registerInformation.Password);

            var user = new User
            {
                Id = Guid.NewGuid(),
                Email = registerInformation.Email,
                Password = encriptedPassword,
                CreatedDate = DateTime.Now,
                UpdatedDate = DateTime.Now
            };

            await _context.Users.AddAsync(user);
            _context.SaveChanges();

            return user;
        }

        public Task<AuthenticatedUser> GetUserByCredentials(LoginInformation loginInformation)
        {
            string encriptedPassword = EncryptPassword(loginInformation.Password);
            User user = _context.Users.FirstOrDefault(u =>
                u.Email.Equals(loginInformation.Email) && u.Password.Equals(encriptedPassword)
            );

            _logger.LogInformation("---> Here-1");
            if (user == null)
            {
                _logger.LogInformation("---> YES");
                return Task.FromResult<AuthenticatedUser>(null);
            }

            var token = generateJwtToken(user);

            return Task.FromResult(new AuthenticatedUser(user, token));
        }

        public Task<User> GetUserByEmail(string email)
        {
            return Task.FromResult(_context.Users.FirstOrDefault(u => u.Email.Equals(email)));
        }

        private static string EncryptPassword(string input)
        {
            using var hashAlgorithm = SHA256.Create();
            var data = hashAlgorithm.ComputeHash(Encoding.UTF8.GetBytes(input));
            var output = new StringBuilder();

            foreach (var t in data)
            {
                output.Append(t.ToString("x2"));
            }

            return output.ToString();
        }
        private string generateJwtToken(User user)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_configuration.GetValue<string>("AuthSettings:Secret"));
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new[] { new Claim("id", user.Id.ToString()) }),
                Expires = DateTime.UtcNow.AddDays(7), // generate token that is valid for 7 days
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);

            return tokenHandler.WriteToken(token);
        }
    }
}