using GuvenFuture.DataAccess.Core;
using Microsoft.EntityFrameworkCore;

namespace GuvenFuture.DataAccess.UserDetail
{
    public class UserDetailOperations : DataAccessOperations<GuvenFuture.Entities.UserDetail.UserDetail>
    {
        public UserDetailOperations(DbContext dbContext) : base(dbContext)
        {
        }
    }
}
