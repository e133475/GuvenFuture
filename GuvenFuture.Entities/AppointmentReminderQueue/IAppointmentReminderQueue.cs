using GuvenFuture.Core.Models;

namespace GuvenFuture.Entities.AppointmentReminderQueue
{
    public interface IAppointmentReminderQueue : IBaseEntity
    {
        int AppointmentActionId { get; set; }
        DateTime? ReminderDate { get; set; }
        string? ReminderType { get; set; }
        int? ReminderStatus { get; set; }
    }
}
