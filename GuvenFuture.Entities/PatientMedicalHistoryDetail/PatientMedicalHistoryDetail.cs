using GuvenFuture.Core.Models;

namespace GuvenFuture.Entities.PatientMedicalHistoryDetail
{
    public class PatientMedicalHistoryDetail : BaseEntity, IPatientMedicalHistoryDetail
    {
        public int? ProviderLocationId { get; set; }
        public int? PatientMedicalHistoryId { get; set; }
        public bool IsPrescription { get; set; }
        public string? PrescriptionNumber { get; set; }
        public int? PatientUserId { get; set; }
        public int? DoctorUserId { get; set; }
        public int? MaterialId { get; set; }
        public string? MaterialUnitName { get; set; }
        public int? UsegeDose { get; set; }
        public float? Quantity { get; set; }
        public string? Description { get; set; }
    }
}
