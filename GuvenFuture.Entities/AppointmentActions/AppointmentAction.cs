using GuvenFuture.Core.Models;

namespace GuvenFuture.Entities.AppointmentActions
{
    public class AppointmentAction : BaseEntity, IAppointmentAction
    {
        public int ProviderId { get; set; }
        public int ProviderLocationId { get; set; }
        public DateTime? AppointmentDate { get; set; }
        public DateTime? StartTime { get; set; }
        public DateTime? EndTime { get; set; }
        public int? PatientUserId { get; set; }
        public int? DoctorUserId { get; set; }
        public string? ReminderTimePeriod { get; set; }
        public int? ReminderCount { get; set; }
        public string? ReminderType { get; set; }
        public int? AppointmentStatus { get; set; }
        public string? AppointmentStatusNote { get; set; }
    }
}
