using GuvenFuture.Core.Models;

namespace GuvenFuture.Entities.Material
{
    public class Material : BaseEntity, IMaterial
    {
        public string? StokType { get; set; }
        public string? StockName { get; set; }
        public string? SUTCode { get; set; }
        public string? Barcode { get; set; }
        public string? MaterialUnitName { get; set; }
        public string? CurrencyName { get; set; }
        public float? UnitPrice { get; set; }
        public float? UnitPriceAvg { get; set; }
        public float? QuantityBalance { get; set; }
        public string? Description { get; set; }
    }
}
