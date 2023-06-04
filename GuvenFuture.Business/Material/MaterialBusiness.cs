using GuvenFuture.Business.Core;
using GuvenFuture.DataAccess.Context;
using GuvenFuture.DataAccess.Material;

namespace GuvenFuture.Business.Material
{
    public class MaterialBusiness : BusinessCommonOperations<Entities.Material.Material>
    {
        #region For Custom Operations
        readonly MaterialOperations _modelOp;
        public MaterialBusiness(GuvenFutureContext context) : base(context)
        {
            _modelOp = new MaterialOperations(context);
        }
        #endregion

        #region Custom Operations

        #endregion
    }
}
