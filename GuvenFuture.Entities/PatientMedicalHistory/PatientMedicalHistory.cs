using GuvenFuture.Core.Models;

namespace GuvenFuture.Entities.PatientMedicalHistory
{
    public class PatientMedicalHistory : BaseEntity, IPatientMedicalHistory
    {
        public int? ProviderLocationId { get; set; }
        public int? AppointmentActionId { get; set; }
        public int? PatientUserId { get; set; }
        public int? DoctorUserId { get; set; }
        public DateTime? ActionDate { get; set; }
        public string? PaitentComplaint { get; set; }
        public string? DoctorDiagnosis { get; set; }
        public int? Severity { get; set; }
        public int? ProvisionNumber { get; set; }
    }
}
