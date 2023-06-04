using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GuvenFuture.Core.Models;

namespace GuvenFuture.Entities.UserDetail
{
    public class UserDetail : BaseEntity, IUserDetail
    {
        public int ProviderId { get; set; }
        public int? UserId { get; set; }
        public string? Nation { get; set; }
        public string? BloodType { get; set; }
        public string? Country { get; set; }
        public string? City { get; set; }
        public string? Address { get; set; }
        public string? PhoneNumber { get; set; }
        public string? EMail { get; set; }
        public string? Gender { get; set; }
        public int? Height { get; set; }
        public float? Weight { get; set; }
    }
}
