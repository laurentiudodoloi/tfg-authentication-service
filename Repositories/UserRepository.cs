using AuthenticationService.Data;
using AuthenticationService.DTOs;
using AuthenticationService.Entities;
using AuthenticationService.Helpers;
using Microsoft.Extensions.Configuration;
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
        private DataContext _context;
        private IConfiguration _configuration;
        public UserRepository(DataContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
        }

        public async Task<User> CreateUser(RegisterInformation registerInformation)
        {
            string encriptedPassword = this.EncryptPassword(registerInformation.Password);

            var user = new User
            {
                FirstName = registerInformation.FirstName,
                LastName = registerInformation.LastName,
                Email = registerInformation.Email,
                PhoneNumber = registerInformation.PhoneNumber,
                Address = registerInformation.Address,
                SchoolName = registerInformation.SchoolName,
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
            if (user == null)
            {
                return null;
            }

            var token = generateJwtToken(user);

            return Task.FromResult(new AuthenticatedUser(user, token));
        }

        public Task<User> GetUserByEmail(string email)
        {
            return Task.FromResult(_context.Users.FirstOrDefault(u => u.Email.Equals(email)));
        }

        private string EncryptPassword(string input)
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
            var key = Encoding.ASCII.GetBytes(_configuration.GetSection("AuthSettings")["Secret"]);
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