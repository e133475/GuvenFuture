using GuvenFuture.Business.Core;
using GuvenFuture.DataAccess.Context;
using GuvenFuture.DataAccess.User;
using Microsoft.AspNetCore.Http;

namespace GuvenFuture.Business.UserDetail
{
    public class UserDetailBusiness : BusinessCommonOperations<Entities.UserDetail.UserDetail>
    {
        #region For Custom Operations
        readonly UserOperations _modelOp;
        public UserDetailBusiness(GuvenFutureContext context, IHttpContextAccessor accessor) : base(context, accessor)
        {
            _modelOp = new UserOperations(context);
        }
        #endregion

        #region Custom Operations

        #endregion
    }
}