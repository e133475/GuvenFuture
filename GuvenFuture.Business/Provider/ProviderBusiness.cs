using System.Linq.Expressions;
using GuvenFuture.Business.Core;
using GuvenFuture.Core.Models;
using GuvenFuture.DataAccess.Provider;
using GuvenFuture.DataAccess.Context;
using Microsoft.AspNetCore.Http;

namespace GuvenFuture.Business.Provider
{
    public class ProviderBusiness : BusinessCommonOperations<Entities.Provider.Provider>
    {
        #region For Custom Operations
        readonly ProviderOperations _modelOp;
        public ProviderBusiness(GuvenFutureContext context, IHttpContextAccessor accessor) : base(context, accessor)
        {
            _modelOp = new ProviderOperations(context);
        }
        #endregion

        #region Custom Operations

        #endregion
    }
}
