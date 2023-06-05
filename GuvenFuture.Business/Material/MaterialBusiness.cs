using GuvenFuture.Business.Core;
using GuvenFuture.DataAccess.Context;
using GuvenFuture.DataAccess.Material;
using Microsoft.AspNetCore.Http;

namespace GuvenFuture.Business.Material
{
    public class MaterialBusiness : BusinessCommonOperations<Entities.Material.Material>
    {
        #region For Custom Operations
        readonly MaterialOperations _modelOp;
        public MaterialBusiness(GuvenFutureContext context, IHttpContextAccessor accessor) : base(context, accessor)
        {
            _modelOp = new MaterialOperations(context);
        }
        #endregion

        #region Custom Operations

        #endregion
    }
}
