using AuthenticationService.Data;
using AuthenticationService.DTOs;
using AuthenticationService.Entities;
using System;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace AuthenticationService.Repositories
{
    public class UserRepository : IUserRepository
    {
        private DataContext _context;

        public UserRepository(DataContext context)
        {
            _context = context;
        }

        public User CreateUser(RegisterInformation registerInformation)
        {
            string encriptedPassword = this.EncryptPassword(registerInformation.Password);

            User user = new User
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

            _context.Users.Add(user);
            _context.SaveChanges();

            return user;
        }

        public User GetUserByCredentials(LoginInformation loginInformation)
        {
            string encriptedPassword = this.EncryptPassword(loginInformation.Password);

            User user = _context.Users.FirstOrDefault(u => 
                u.Email.Equals(loginInformation.Email) && u.Password.Equals(encriptedPassword)
            );

            return user;
        }

        public User GetUserByEmail(string email)
        {
            return _context.Users.FirstOrDefault(u => u.Email.Equals(email));
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
    }
}