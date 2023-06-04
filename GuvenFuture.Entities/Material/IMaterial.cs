using GuvenFuture.Core.Models;

namespace GuvenFuture.Entities.Material
{
    public interface IMaterial : IBaseEntity
    {
        int ProviderId { get; set; }
        string? StokType { get; set; }
        string? StockName { get; set; }
        string? SUTCode { get; set; }
        string? Barcode { get; set; }
        string? MaterialUnitName { get; set; }
        string? CurrencyName { get; set; }
        float? UnitPrice { get; set; }
        float? UnitPriceAvg { get; set; }
        float? QuantityBalance { get; set; }
        string? Description { get; set; }
    }
}
