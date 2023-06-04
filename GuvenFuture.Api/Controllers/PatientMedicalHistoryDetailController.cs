using GuvenFuture.Api.Core;
using GuvenFuture.Business.PatientMedicalHistoryDetail;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GuvenFuture.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class PatientMedicalHistoryDetailController : BaseController<Entities.PatientMedicalHistoryDetail.PatientMedicalHistoryDetail>
    {
        readonly PatientMedicalHistoryDetailBusiness _bussiness;
        public PatientMedicalHistoryDetailController(PatientMedicalHistoryDetailBusiness business) : base(business)
        {
            _bussiness = business;
        }

        #region Custom Methods

        #endregion

    }
}
