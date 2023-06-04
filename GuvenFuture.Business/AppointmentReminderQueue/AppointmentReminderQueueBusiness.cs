using GuvenFuture.Business.Core;
using GuvenFuture.DataAccess.AppointmentReminderQueue;
using GuvenFuture.DataAccess.Context;

namespace GuvenFuture.Business.AppointmentReminderQueue
{
    public class AppointmentReminderQueueBusiness : BusinessCommonOperations<Entities.AppointmentReminderQueue.AppointmentReminderQueue>
    {
        #region For Custom Operations
        readonly AppointmentReminderQueueOperations _modelOp;
        public AppointmentReminderQueueBusiness(GuvenFutureContext context) : base(context)
        {
            _modelOp = new AppointmentReminderQueueOperations(context);
        }
        #endregion

        #region Custom Operations

        #endregion
    }
}
