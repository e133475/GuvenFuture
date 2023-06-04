﻿using System.Linq.Expressions;
using GuvenFuture.Business.Core;
using GuvenFuture.Core.Models;
using GuvenFuture.DataAccess.PatientMedicalHistory;
using GuvenFuture.DataAccess.Context;

namespace GuvenFuture.Business.PatientMedicalHistory
{
    public class PatientMedicalHistoryBusiness : BusinessCommonOperations<Entities.PatientMedicalHistory.PatientMedicalHistory>
    {
        #region For Custom Operations
        readonly PatientMedicalHistoryOperations _modelOp;
        public PatientMedicalHistoryBusiness(GuvenFutureContext context) : base(context)
        {
            _modelOp = new PatientMedicalHistoryOperations(context);
        }
        #endregion

        #region Custom Operations

        #endregion
    }
}