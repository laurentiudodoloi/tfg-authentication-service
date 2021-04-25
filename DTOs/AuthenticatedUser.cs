using AuthenticationService.Entities;
using System;

namespace AuthenticationService.DTOs
{
    public class AuthenticatedUser
    {
        public Guid Id { get; set; }
        public string Email { get; set; }
        public string Token { get; set; }

        public AuthenticatedUser(User user, string token)
        {
            this.Id = user.Id;
            this.Token = token;
            this.Email = user.Email;
        }
    }
}
