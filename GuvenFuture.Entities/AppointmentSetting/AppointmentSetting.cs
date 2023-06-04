using GuvenFuture.Core.Models;

namespace GuvenFuture.Entities.AppointmentSetting
{
    public class AppointmentSetting : BaseEntity, IAppointmentSetting
    {
        public int ProviderLocationId { get; set; }
        public DateTime? AppointmentDate { get; set; }
        public DateTime? StartTime { get; set; }
        public int? ConsultationTimePeriod { get; set; }
        public int? BreakTimePeriod { get; set; }
        public DateTime? LunchTimeStart { get; set; }
    }
}
