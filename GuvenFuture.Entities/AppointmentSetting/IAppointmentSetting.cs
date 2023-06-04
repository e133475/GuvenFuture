using GuvenFuture.Core.Models;

namespace GuvenFuture.Entities.AppointmentSetting
{
    public interface IAppointmentSetting : IBaseEntity
    {
        int ProviderLocationId { get; set; }
        DateTime? AppointmentDate { get; set; }
        DateTime? StartTime { get; set; }
        int? ConsultationTimePeriod { get; set; }
        int? BreakTimePeriod { get; set; }
        DateTime? LunchTimeStart { get; set; }
    }
}
