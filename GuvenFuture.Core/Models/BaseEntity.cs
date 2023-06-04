using System.ComponentModel.DataAnnotations;

namespace GuvenFuture.Core.Models
{
    public class BaseEntity : IBaseEntity
    {
        [Key]
        public int AutoId { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int DataStatus { get; set; } = 1;
    }
}
