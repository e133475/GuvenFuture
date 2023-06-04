using GuvenFuture.Api.Core;
using GuvenFuture.Business.AppointmentReminderQueue;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GuvenFuture.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class AppointmentReminderQueueController : BaseController<Entities.AppointmentReminderQueue.AppointmentReminderQueue>
    {
        readonly AppointmentReminderQueueBusiness _bussiness;
        public AppointmentReminderQueueController(AppointmentReminderQueueBusiness business) : base(business)
        {
            _bussiness = business;
        }

        #region Custom Methods

        #endregion
    }
}
