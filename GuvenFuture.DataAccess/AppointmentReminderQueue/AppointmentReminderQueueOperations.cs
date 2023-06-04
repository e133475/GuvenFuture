using GuvenFuture.DataAccess.Core;
using Microsoft.EntityFrameworkCore;

namespace GuvenFuture.DataAccess.AppointmentReminderQueue
{
    public class AppointmentReminderQueueOperations : DataAccessOperations<GuvenFuture.Entities.AppointmentReminderQueue.AppointmentReminderQueue>
    {
        public AppointmentReminderQueueOperations(DbContext dbContext) : base(dbContext)
        {
        }
    }
}
