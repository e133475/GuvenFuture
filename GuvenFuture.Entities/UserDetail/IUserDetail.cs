using GuvenFuture.Core.Models;

namespace GuvenFuture.Entities.UserDetail
{
    public interface IUserDetail : IBaseEntity
    {
        int ProviderId { get; set; }
        int? UserId { get; set; }
        string? Nation { get; set; }
        string? BloodType { get; set; }
        string? Country { get; set; }
        string? City { get; set; }
        string? Address { get; set; }
        string? PhoneNumber { get; set; }
        string? EMail { get; set; }
        string? Gender { get; set; }
        int? Height { get; set; }
        float? Weight { get; set; }
    }
}
