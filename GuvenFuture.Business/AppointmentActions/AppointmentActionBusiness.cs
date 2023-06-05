using GuvenFuture.Business.Core;
using GuvenFuture.Core.Models;
using GuvenFuture.DataAccess.AppointmentActions;
using GuvenFuture.DataAccess.Context;
using Microsoft.AspNetCore.Http;

namespace GuvenFuture.Business.AppointmentActions
{
    public class AppointmentActionBusiness : BusinessCommonOperations<Entities.AppointmentActions.AppointmentAction>
    {
        #region For Custom Operations
        readonly AppointmentActionOperations _modelOp;
        public AppointmentActionBusiness(GuvenFutureContext context, IHttpContextAccessor accessor) : base(context, accessor)
        {
            _modelOp = new AppointmentActionOperations(context);
        }
        #endregion

        #region Custom Operations

        public async Task<ResultModel<bool>> CreateAppointmentAsync(int providerId, int locationId, int patientId, DateTime selectedDate, int reminderTimePeriod, int reminderCount, string reminderType, string appNote)
        {
            return await _modelOp.CreateAppointmentAsync(providerId, locationId, patientId, _currentUser.UserId, selectedDate, reminderTimePeriod, reminderCount, reminderType, appNote);
        }

        public int Calculate(int x, int y)
        {
            return x * y;
        }

        public bool VeryfiyAppointment()
        {
            return true;
        }
        #endregion
    }
}
