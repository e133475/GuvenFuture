using System.Linq.Expressions;
using System.Security.Claims;
using GuvenFuture.Business.Core;
using GuvenFuture.Core.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GuvenFuture.Api.Core
{
    [Route("api/[controller]")]
    [ApiController]
    public class BaseController<TModel> : ControllerBase where TModel : class, IBaseEntity, new()
    {
        public readonly BusinessCommonOperations<TModel> _bussinessCommonOp;
        //public CurrentUser _currentUser;

        public CurrentUser? _currentUser { get; set; }
        public BaseController(BusinessCommonOperations<TModel> bussinessCommonOp)
        {
            _bussinessCommonOp = bussinessCommonOp;
        }
        
        #region Default Crud Methods
        [HttpPost("Insert")]
        public IActionResult Insert(TModel data)
        {

            return Ok(_bussinessCommonOp.Insert(data));
        }

        [HttpPost("Update")]
        public IActionResult Update(TModel data)
        {

            return Ok(_bussinessCommonOp.Update(data));
        }


        [HttpGet("GetAll")]
        public IActionResult GetAll()
        {

            //return Ok(_bussiness.GetAll(x => x.CreatedBy == 1));
            return Ok(_bussinessCommonOp.GetAll());
        }

        [HttpGet("GetById/{Id}")]
        public IActionResult GetById(int Id)
        {

            //return Ok(_bussiness.GetAll(x => x.CreatedBy == 1));
            return Ok(_bussinessCommonOp.GetById(Id));
        }
        #endregion

        #region Default Async Crud Methods
        [HttpPost("InsertAsync")]
        public async Task<IResultModel<int>> InsertAsync(TModel data)
        {

            return await _bussinessCommonOp.InsertAsync(data);
        }

        [HttpPost("UpdateAsync")]
        public async Task<IResultModel<bool>> UpdateAsync(TModel data)
        {

            return await _bussinessCommonOp.UpdateAsync(data);
        }
        [HttpGet("DeleteByIDAsync/{Id}")]
        public async Task<IResultModel<bool>> DeleteByIDAsync(int Id)
        {

            //return Ok(_bussiness.GetAll(x => x.CreatedBy == 1));
            return await _bussinessCommonOp.DeleteByIDAsync(Id);
        }

        [HttpGet("GetAllAsync")]
        public async Task<IResultModel<IList<TModel>>> GetAllAsync(Expression<Func<TModel, bool>>? filter = null)
        {
            return await _bussinessCommonOp.GetAllAsync(filter);
        }

        [HttpGet("GetByIdAsync/{Id}")]
        public async Task<IResultModel<TModel>> GetByIdAsync(int Id)
        {

            //return Ok(_bussiness.GetAll(x => x.CreatedBy == 1));
            return await _bussinessCommonOp.GetByIdAsync(Id);
        }
        #endregion
    }
}
