using GuvenFuture.Business.Core;
using GuvenFuture.DataAccess.AppointmentActions;
using GuvenFuture.DataAccess.Context;

namespace GuvenFuture.Business.AppointmentActions
{
    public class AppointmentActionBusiness : BusinessCommonOperations<Entities.AppointmentActions.AppointmentAction>
    {
        #region For Custom Operations
        readonly AppointmentActionOperations _modelOp;
        public AppointmentActionBusiness(GuvenFutureContext context) : base(context)
        {
            _modelOp = new AppointmentActionOperations(context);
        }
        #endregion

        #region Custom Operations
        public int Calculate(int x, int y)
        {
            return x * y;
        }
        #endregion
    }
}
