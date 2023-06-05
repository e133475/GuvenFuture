using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GuvenFuture.Core.Models;

namespace GuvenFuture.Entities.ProviderLocation
{
    public class ProviderLocation : BaseEntity, IProviderLocation
    {
        public int? ParentId { get; set; }
        public string? Name { get; set; }
        public int? UserId { get; set; }
        public string? LocationNo { get; set; }
    }
}
