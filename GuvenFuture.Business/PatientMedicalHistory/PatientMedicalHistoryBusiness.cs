using System.Linq.Expressions;
using GuvenFuture.Business.Core;
using GuvenFuture.Core.Models;
using GuvenFuture.DataAccess.PatientMedicalHistory;
using GuvenFuture.DataAccess.Context;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;

namespace GuvenFuture.Business.PatientMedicalHistory
{
    public class PatientMedicalHistoryBusiness : BusinessCommonOperations<Entities.PatientMedicalHistory.PatientMedicalHistory>
    {
        #region For Custom Operations
        readonly PatientMedicalHistoryOperations _modelOp;
        public PatientMedicalHistoryBusiness(GuvenFutureContext context, IHttpContextAccessor accessor) : base(context, accessor)
        {
            _modelOp = new PatientMedicalHistoryOperations(context);
        }
        #endregion

        #region Custom Operations
        public ResultModel<List<Entities.ViewModels.MedicalHistoryView>> GetMedicalHistoryView()
        {
            ResultModel<List<Entities.ViewModels.MedicalHistoryView>> res = new();
            res.ResultData = _modelOp.GetMedicalHistoryView();
            res.IsSucces = res.ResultData != null;
            res.Message = res.ResultData != null ? "İşlem başarılı." : "Bir problem oluştu.";
            return res;
        }
        #endregion
    }
}
