using GuvenFuture.Api.Core;
using GuvenFuture.Business.Core;
using GuvenFuture.Business.Provider;
using GuvenFuture.Business.UserDetail;
using GuvenFuture.Core.Models;
using GuvenFuture.Entities.Provider;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GuvenFuture.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class ProviderController : BaseController<Entities.Provider.Provider>
    {
        readonly ProviderBusiness _bussiness;
        public ProviderController(ProviderBusiness business) : base(business)
        {
            _bussiness = business;
        }

        #region Custom Methods

        #endregion

    }
}
