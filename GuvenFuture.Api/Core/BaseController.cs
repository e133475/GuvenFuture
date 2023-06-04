using System.Linq.Expressions;
using GuvenFuture.Business.Core;
using GuvenFuture.Core.Models;
using Microsoft.AspNetCore.Mvc;

namespace GuvenFuture.Api.Core
{
    [Route("api/[controller]")]
    [ApiController]
    public class BaseController<TModel> : ControllerBase where TModel : class, IBaseEntity, new()
    {
        private readonly BusinessCommonOperations<TModel> _bussiness;
        public BaseController(BusinessCommonOperations<TModel> business)
        {
            _bussiness = business;
        }

        #region Default Crud Methods
        [HttpPost("Insert")]
        public IActionResult Insert(TModel data)
        {
            return Ok(_bussiness.Insert(data));
        }

        [HttpPost("Update")]
        public IActionResult Update(TModel data)
        {
            return Ok(_bussiness.Update(data));
        }

        [HttpGet("DeleteById/{Id}")]
        public IActionResult DeleteById(int Id)
        {
            //return Ok(_bussiness.GetAll(x => x.CreatedBy == 1));
            return Ok(_bussiness.DeleteById(Id));
        }
        [HttpGet("GetAll")]
        public IActionResult GetAll()
        {
            //return Ok(_bussiness.GetAll(x => x.CreatedBy == 1));
            return Ok(_bussiness.GetAll());
        }

        [HttpGet("GetById/{Id}")]
        public IActionResult GetById(int Id)
        {
            //return Ok(_bussiness.GetAll(x => x.CreatedBy == 1));
            return Ok(_bussiness.GetById(Id));
        }
        #endregion

        #region Default Async Crud Methods
        [HttpPost("InsertAsync")]
        public async Task<IResultModel<int>> InsertAsync(TModel data)
        {
            return await _bussiness.InsertAsync(data);
        }

        [HttpPost("UpdateAsync")]
        public async Task<IResultModel<bool>> UpdateAsync(TModel data)
        {
            return await _bussiness.UpdateAsync(data);
        }
        [HttpGet("DeleteByIDAsync/{Id}")]
        public async Task<IResultModel<bool>> DeleteByIDAsync(int Id)
        {
            //return Ok(_bussiness.GetAll(x => x.CreatedBy == 1));
            return await _bussiness.DeleteByIDAsync(Id);
        }

        [HttpGet("GetAllAsync")]
        public async Task<IResultModel<IList<TModel>>> GetAllAsync(Expression<Func<TModel, bool>>? filter = null)
        {
            return await _bussiness.GetAllAsync(filter);
        }

        [HttpGet("GetByIdAsync/{Id}")]
        public async Task<IResultModel<TModel>> GetByIdAsync(int Id)
        {
            //return Ok(_bussiness.GetAll(x => x.CreatedBy == 1));
            return await _bussiness.GetByIdAsync(Id);
        }
        #endregion
    }
}
