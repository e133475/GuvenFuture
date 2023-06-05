using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GuvenFuture.Core.Models;
using GuvenFuture.Entities.Provider;

namespace GuvenFuture.Entities.User
{
    public interface IUser:IBaseEntity
    {
        //int ProviderId { get; set; }
        string? TCNo { get; set; }
        string? FullName { get; set; }
        string? UserType { get; set; }
        //string? PasswordHashed { get; set; }
        //string? PasswordHashKey { get; set; }
    }
}