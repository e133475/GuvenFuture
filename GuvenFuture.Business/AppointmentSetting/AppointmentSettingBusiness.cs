using GuvenFuture.Business.Core;
using GuvenFuture.DataAccess.AppointmentSetting;
using GuvenFuture.DataAccess.Context;
using Microsoft.AspNetCore.Http;

namespace GuvenFuture.Business.AppointmentSetting
{
    public class AppointmentSettingBusiness : BusinessCommonOperations<Entities.AppointmentSetting.AppointmentSetting>
    {
        #region For Custom Operations
        readonly AppointmentSettingOperations _modelOp;
        public AppointmentSettingBusiness(GuvenFutureContext context, IHttpContextAccessor accessor) : base(context, accessor)
        {
            _modelOp = new AppointmentSettingOperations(context);
        }
        #endregion

        #region Custom Operations

        #endregion
    }
}
