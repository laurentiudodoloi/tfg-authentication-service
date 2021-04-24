using AuthenticationService.DTOs;
using AuthenticationService.Entities;
using System.Threading.Tasks;

namespace AuthenticationService.Repositories
{
    public interface IUserRepository
    {
        public Task<User> CreateUser(RegisterInformation registerInformation);
        public Task<AuthenticatedUser> GetUserByCredentials(LoginInformation loginInformation);
        public Task<User> GetUserByEmail(string email);
    }
}
