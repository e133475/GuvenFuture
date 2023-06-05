using System.ComponentModel.DataAnnotations;
using GuvenFuture.Core.Models;

namespace GuvenFuture.Entities.User
{
    public class User : BaseEntity, IUser
    {
        //public int ProviderId { get; set; }
        public string? TCNo { get; set; }
        public string? FullName { get; set; }
        public string? UserType { get; set; }
        public string? PasswordHashed { get; set; }
        public string? PasswordHashKey { get; set; }
    }
}
