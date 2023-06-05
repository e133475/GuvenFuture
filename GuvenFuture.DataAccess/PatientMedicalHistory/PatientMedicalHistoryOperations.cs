using GuvenFuture.DataAccess.Context;
using GuvenFuture.DataAccess.Core;
using Microsoft.EntityFrameworkCore;

namespace GuvenFuture.DataAccess.PatientMedicalHistory
{
    public class PatientMedicalHistoryOperations : DataAccessOperations<GuvenFuture.Entities.PatientMedicalHistory.PatientMedicalHistory>
    {
        public PatientMedicalHistoryOperations(DbContext dbContext) : base(dbContext)
        {
        }

        public List<Entities.ViewModels.MedicalHistoryView> GetMedicalHistoryView()
        {
            return ((GuvenFutureContext)_context).MedicalHistoryView.ToList();
        }
    }
}
