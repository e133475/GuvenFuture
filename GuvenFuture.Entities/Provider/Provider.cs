using GuvenFuture.Core.Models;

namespace GuvenFuture.Entities.Provider
{
    public class Provider : BaseEntity, IProvider
    {
        public string? Name { get; set; }
        public string? Address { get; set; }
        public string? TesisKodu { get; set; }
    }
}
