using GuvenFuture.Core.Models;

namespace GuvenFuture.Entities.AppointmentActions
{
    public interface IAppointmentAction : IBaseEntity
    {
        int ProviderLocationId { get; set; }
        DateTime? AppointmentDate { get; set; }
        DateTime? StartTime { get; set; }
        DateTime? EndTime { get; set; }
        int? PatientUserId { get; set; }
        int? DoctorUserId { get; set; }
        int? ReminderTimePeriod { get; set; }
        int? ReminderCount { get; set; }
        string? ReminderType { get; set; }
        int?  AppointmentStatus { get; set; }
        string? AppointmentStatusNote { get; set; }
    }
}
