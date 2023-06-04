using GuvenFuture.Core.Models;

namespace GuvenFuture.Entities.ProviderLocation
{
    public interface IProviderLocation : IBaseEntity
    {
        int ProviderId { get; set; }
        int? ParentId { get; set; }
        string? Name { get; set; }
        int? UserId { get; set; }
        string? LocationNo { get; set; }
    }
}