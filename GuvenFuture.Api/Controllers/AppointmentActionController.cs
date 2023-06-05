using GuvenFuture.Api.Core;
using GuvenFuture.Business.AppointmentActions;
using GuvenFuture.Business.Core;
using GuvenFuture.Core.Models;
using GuvenFuture.Entities.AppointmentActions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;

namespace GuvenFuture.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class AppointmentActionController : BaseController<Entities.AppointmentActions.AppointmentAction>
    {
        readonly AppointmentActionBusiness _bussiness;
        public AppointmentActionController(AppointmentActionBusiness business) : base(business)
        {
            _bussiness = business;
        }
        #region Custom Methods
        [HttpPost("CreateAppointmentAsync")]
        public async Task<IActionResult> CreateAppointmentAsync(int providerId, int locationId, int patientId, DateTime selectedDate, int reminderTimePeriod, int reminderCount, string reminderType, string appNote)
        {
            return Ok(await _bussiness.CreateAppointmentAsync(providerId, locationId, patientId, selectedDate, reminderTimePeriod, reminderCount, reminderType, appNote));
        }
        #endregion
    }
}