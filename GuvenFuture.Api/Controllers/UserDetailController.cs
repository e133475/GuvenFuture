using GuvenFuture.Api.Core;
using GuvenFuture.Business.UserDetail;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GuvenFuture.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class UserDetailController : BaseController<Entities.UserDetail.UserDetail>
    {
        readonly UserDetailBusiness _bussiness;
        public UserDetailController(UserDetailBusiness business) : base(business)
        {
            _bussiness = business;
        }

        #region Custom Methods

        #endregion

    }
}
