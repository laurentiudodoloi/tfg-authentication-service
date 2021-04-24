﻿using System.ComponentModel.DataAnnotations;
namespace AuthenticationService.DTOs
{
    public class RegisterInformation
    {
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        [Required]
        public string PhoneNumber { get; set; }
        [Required]
        public string Address { get; set; }
        [Required]
        public string SchoolName{ get; set; }
        [Required]
        public string Password { get; set;}
    }
}
