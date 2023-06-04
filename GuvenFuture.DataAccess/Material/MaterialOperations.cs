using GuvenFuture.DataAccess.Core;
using Microsoft.EntityFrameworkCore;

namespace GuvenFuture.DataAccess.Material
{
    public class MaterialOperations : DataAccessOperations<GuvenFuture.Entities.Material.Material>
    {
        public MaterialOperations(DbContext dbContext) : base(dbContext)
        {
        }
    }
}
