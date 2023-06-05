using GuvenFuture.Api.Core;
using GuvenFuture.Business.AppointmentActions;
using GuvenFuture.Business.Core;
using GuvenFuture.Entities.AppointmentActions;
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
            var user = _bussiness._currentUser;
            string Name = User.FindFirst("Name").Value;
            return Ok(_bussiness.Calculate(x, y));
        }
        #endregion
    }
}