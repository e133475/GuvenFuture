using GuvenFuture.Api.Core;
using GuvenFuture.Business.User;
using Hangfire;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GuvenFuture.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class UserController : BaseController<Entities.User.User>
    {
        readonly UserBusiness _bussiness;
        public UserController(UserBusiness business) : base(business)
        {
            _bussiness = business;
        }

        #region Custom Methods

        [HttpPost("Update2")]
        [AllowAnonymous]
        public IActionResult Update2(Entities.User.User data)
        {
            var jobId = BackgroundJob.Schedule(() => Console.WriteLine("You checkout new product into your checklist!"), TimeSpan.FromSeconds(30));
            return Ok(_bussiness.Update(data));
        }

        #endregion

    }
}
