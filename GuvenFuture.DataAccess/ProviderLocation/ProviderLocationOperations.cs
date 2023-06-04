using GuvenFuture.DataAccess.Core;
using Microsoft.EntityFrameworkCore;

namespace GuvenFuture.DataAccess.ProviderLocation
{
    public class ProviderLocationOperations : DataAccessOperations<GuvenFuture.Entities.ProviderLocation.ProviderLocation>
    {
        public ProviderLocationOperations(DbContext dbContext) : base(dbContext)
        {
        }
    }
}
