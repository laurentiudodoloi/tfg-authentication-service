using System;
using System.ComponentModel.DataAnnotations;

namespace AuthenticationService.Entities
{
    public class User : BaseModel
    {
        [Required]
        public Guid Id { get; set; }
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        [Required]
        public string Password { get; set; }
        [Required]
        public DateTime CreatedDate { get; set; }
        [Required]
        public DateTime UpdatedDate { get; set; }
    }
}
