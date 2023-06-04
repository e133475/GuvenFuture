using GuvenFuture.Core.Models;

namespace GuvenFuture.Entities.PatientMedicalHistoryDetail
{
    public interface IPatientMedicalHistoryDetail : IBaseEntity
    {
        int ProviderId { get; set; }
        int? ProviderLocationId { get; set; }
        int? PatientMedicalHistoryId { get; set; }
        bool IsPrescription { get; set; }
        string? PrescriptionNumber { get; set; }
        int? PatientUserId { get; set; }
        int? DoctorUserId { get; set; }
        int? MaterialId { get; set; }
        string? MaterialUnitName { get; set; }
        int? UsegeDose { get; set; }
        float? Quantity { get; set; }
        string? Description { get; set; }
    }
}