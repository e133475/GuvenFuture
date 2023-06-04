using GuvenFuture.DataAccess.Core;
using Microsoft.EntityFrameworkCore;

namespace GuvenFuture.DataAccess.Provider
{
    public class ProviderOperations : DataAccessOperations<GuvenFuture.Entities.Provider.Provider>
    {
        public ProviderOperations(DbContext dbContext) : base(dbContext)
        {
        }
    }
}
