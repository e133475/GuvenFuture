using System.Linq.Expressions;
using GuvenFuture.Business.Core;
using GuvenFuture.Core.Models;
using GuvenFuture.DataAccess.Context;
using GuvenFuture.DataAccess.User;

namespace GuvenFuture.Business.UserDetail
{
    public class UserDetailBusiness : BusinessCommonOperations<Entities.UserDetail.UserDetail>
    {
        #region For Custom Operations
        readonly UserOperations _modelOp;
        public UserDetailBusiness(GuvenFutureContext context) : base(context)
        {
            _modelOp = new UserOperations(context);
        }
        #endregion

        #region Custom Operations

        #endregion
    }
}