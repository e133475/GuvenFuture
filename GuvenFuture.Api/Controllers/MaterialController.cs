using GuvenFuture.Api.Core;
using GuvenFuture.Business.Material;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GuvenFuture.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class MaterialController : BaseController<Entities.Material.Material>
    {
        readonly MaterialBusiness _bussiness;
        public MaterialController(MaterialBusiness business) : base(business)
        {
            _bussiness = business;
        }

        #region Custom Methods

        #endregion

    }
}
