using AuthenticationService.DTOs;
using AuthenticationService.Entities;
using System.Threading.Tasks;

namespace AuthenticationService.Repositories
{
    public interface IUserRepository
    {
        Task<User> CreateUser(RegisterInformation registerInformation);
        Task<AuthenticatedUser> GetUserByCredentials(LoginInformation loginInformation);
        Task<User> GetUserByEmail(string email);
    }
}
