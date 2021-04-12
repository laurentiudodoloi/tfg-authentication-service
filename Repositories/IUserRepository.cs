using AuthenticationService.DTOs;
using AuthenticationService.Entities;

namespace AuthenticationService.Repositories
{
    public interface IUserRepository
    {
        public User CreateUser(RegisterInformation registerInformation);
        public User GetUserByCredentials(LoginInformation loginInformation);
        public User GetUserByEmail(string email);
    }
}
