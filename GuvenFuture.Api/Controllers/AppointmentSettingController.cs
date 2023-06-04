using GuvenFuture.Api.Core;
using GuvenFuture.Business.AppointmentSetting;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GuvenFuture.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class AppointmentSettingController : BaseController<Entities.AppointmentSetting.AppointmentSetting>
    {
        readonly AppointmentSettingBusiness _bussiness;
        public AppointmentSettingController(AppointmentSettingBusiness business) : base(business)
        {
            _bussiness = business;
        }

        #region Custom Methods

        #endregion

    }
}
