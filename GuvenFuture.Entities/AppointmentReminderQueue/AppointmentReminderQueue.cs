using GuvenFuture.Core.Models;

namespace GuvenFuture.Entities.AppointmentReminderQueue
{
    public class AppointmentReminderQueue : BaseEntity, IAppointmentReminderQueue
    {
        public int AppointmentActionId { get; set; }
        public DateTime? ReminderDate { get; set; }     
        public string? ReminderType { get; set; }
        public int? ReminderStatus { get; set; }
    }
}
