using GuvenFuture.Api.Core;
using GuvenFuture.Business.AppointmentActions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

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
        [HttpPost("CalculateTest")]
        public IActionResult CalculateTest(int x, int y)
        {
            return Ok(_bussiness.Calculate(x, y));
        }
        #endregion
    }
}