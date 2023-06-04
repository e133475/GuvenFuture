using GuvenFuture.Core.Models;

namespace GuvenFuture.Entities.Provider
{
    public interface IProvider : IBaseEntity
    {
        string? Name { get; set; }
        string? Address { get; set; }
        string? TesisKodu { get; set; }
    }
}