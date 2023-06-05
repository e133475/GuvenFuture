using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GuvenFuture.Entities.Computeds.DTOs
{
    public class UserRegisterModel
    {
        public string? TCNo { get; set; }
        public string? PassWord { get; set; }

        public int? ProviderId { get; set; }
        public string? FullName { get; set;}
        public string? UserType { get; set; }
    }
}
