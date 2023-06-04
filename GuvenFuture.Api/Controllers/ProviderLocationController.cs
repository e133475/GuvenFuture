using GuvenFuture.Api.Core;
using GuvenFuture.Business.ProviderLocation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GuvenFuture.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class ProviderLocationController : BaseController<Entities.ProviderLocation.ProviderLocation>
    {
        readonly ProviderLocationBusiness _bussiness;
        public ProviderLocationController(ProviderLocationBusiness business) : base(business)
        {
            _bussiness = business;
        }

        #region Custom Methods

        #endregion

    }
}
