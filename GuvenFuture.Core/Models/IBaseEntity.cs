namespace GuvenFuture.Core.Models
{
    public interface IBaseEntity
    {
        int AutoId { get; set; }
        int CreatedBy { get; set; }
        DateTime CreatedDate { get; set; }
        int DataStatus { get; set; }
    }
}
