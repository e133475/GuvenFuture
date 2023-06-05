using System.Linq.Expressions;
using GuvenFuture.Business.Core;
using GuvenFuture.Core.Models;
using GuvenFuture.DataAccess.PatientMedicalHistoryDetail;
using GuvenFuture.DataAccess.Context;
using Microsoft.AspNetCore.Http;

namespace GuvenFuture.Business.PatientMedicalHistoryDetail
{
    public class PatientMedicalHistoryDetailBusiness : BusinessCommonOperations<Entities.PatientMedicalHistoryDetail.PatientMedicalHistoryDetail>
    {
        #region For Custom Operations
        readonly PatientMedicalHistoryDetailOperations _modelOp;
        public PatientMedicalHistoryDetailBusiness(GuvenFutureContext context, IHttpContextAccessor accessor) : base(context, accessor)
        {
            _modelOp = new PatientMedicalHistoryDetailOperations(context);
        }
        #endregion

        #region Custom Operations

        #endregion
    }
}