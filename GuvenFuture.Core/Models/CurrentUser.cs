using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GuvenFuture.Core.Models
{
    public class CurrentUser : ICurrentUser
    {
        public string? Name { get; set; }
        public int UserId { get; set; }
        public int ProviderID { get; set; }
        public string? UserType { get; set; }
    }
}
