﻿using Microsoft.EntityFrameworkCore;
using AuthenticationService.Entities;

namespace AuthenticationService.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options) { }
        public DbSet<User> Users { get; set; }
    }
}
