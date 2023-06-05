using GuvenFuture.Business.Core;
using GuvenFuture.DataAccess.AppointmentReminderQueue;
using GuvenFuture.DataAccess.Context;
using Microsoft.AspNetCore.Http;

namespace GuvenFuture.Business.AppointmentReminderQueue
{
    public class AppointmentReminderQueueBusiness : BusinessCommonOperations<Entities.AppointmentReminderQueue.AppointmentReminderQueue>
    {
        #region For Custom Operations
        readonly AppointmentReminderQueueOperations _modelOp;
        public AppointmentReminderQueueBusiness(GuvenFutureContext context, IHttpContextAccessor accessor) : base(context, accessor)
        {
            _modelOp = new AppointmentReminderQueueOperations(context);
        }
        #endregion

        #region Custom Operations



        #endregion
    }
}
