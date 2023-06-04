using GuvenFuture.DataAccess.Core;
using Microsoft.EntityFrameworkCore;

namespace GuvenFuture.DataAccess.User
{
    public class UserOperations : DataAccessOperations<GuvenFuture.Entities.User.User>
    {
        public UserOperations(DbContext context) : base(context)
        {

        }
    }
}
