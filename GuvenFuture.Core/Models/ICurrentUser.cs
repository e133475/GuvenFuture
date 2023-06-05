using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GuvenFuture.Core.Models
{
    public interface ICurrentUser
    {
        string? Name { get; set; }
        int UserId { get; set; }
        int ProviderID { get; set; }
        string? UserType { get; set; }
    }
}
