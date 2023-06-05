using GuvenFuture.Api.Core;
using GuvenFuture.Business.PatientMedicalHistory;
using GuvenFuture.Core.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GuvenFuture.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class PatientMedicalHistoryController : BaseController<Entities.PatientMedicalHistory.PatientMedicalHistory>
    {
        readonly PatientMedicalHistoryBusiness _bussiness;
        public PatientMedicalHistoryController(PatientMedicalHistoryBusiness business) : base(business)
        {
            _bussiness = business;
        }

        #region Custom Methods
        [HttpGet("GetMedicalHistoryView")]
        public IActionResult GetMedicalHistoryView()
        {
            return Ok(_bussiness.GetMedicalHistoryView());
        }
        #endregion

    }
}
