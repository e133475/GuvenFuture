using GuvenFuture.DataAccess.Core;
using Microsoft.EntityFrameworkCore;

namespace GuvenFuture.DataAccess.PatientMedicalHistoryDetail
{
    public class PatientMedicalHistoryDetailOperations : DataAccessOperations<GuvenFuture.Entities.PatientMedicalHistoryDetail.PatientMedicalHistoryDetail>
    {
        public PatientMedicalHistoryDetailOperations(DbContext dbContext) : base(dbContext)
        {
        }
    }
}
