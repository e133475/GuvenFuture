using GuvenFuture.Core.Models;

namespace GuvenFuture.Entities.PatientMedicalHistory
{
    public interface IPatientMedicalHistory : IBaseEntity
    {
        int ProviderId { get; set; }
        int? ProviderLocationId { get; set; }
        int? AppointmentActionId { get; set; }
        int? PatientUserId { get; set; }
        int? DoctorUserId { get; set; }
        DateTime? ActionDate { get; set; }
        string? PaitentComplaint { get; set; }
        int? Severity { get; set; }
        int? ProvisionNumber { get; set; }
    }
}
