using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using GuvenFuture.Core.Models;
using GuvenFuture.DataAccess.AppointmentActions;
using GuvenFuture.DataAccess.Context;
using GuvenFuture.DataAccess.Core;
using GuvenFuture.Entities.AppointmentActions;

namespace GuvenFuture.Business.Core
{
    public class BusinessCommonOperations<TModel> : IBusiness<TModel> where TModel : class, IBaseEntity, new()
    {
        readonly DataAccessOperations<TModel> _modelOp;

        public BusinessCommonOperations(GuvenFutureContext context)
        {
            _modelOp = new DataAccessOperations<TModel>(context);
        }

        public IResultModel<bool> DeleteById(int Id)
        {
            ResultModel<bool> result = new();
            try
            {
                result.ResultData = _modelOp.DeleteById(Id);
                result.IsSucces = true;
            }
            catch (Exception ex)
            {
                result.IsSucces = false;
                result.Message = ex.Message;
            }
            return result;
        }

        public async Task<IResultModel<bool>> DeleteByIDAsync(int Id)
        {
            ResultModel<bool> result = new();
            try
            {
                result.ResultData = await _modelOp.DeleteByIDAsync(Id);
                result.IsSucces = true;
            }
            catch (Exception ex)
            {
                result.IsSucces = false;
                result.Message = ex.Message;
            }
            return result;
        }

        public IResultModel<IList<TModel>> GetAll(Expression<Func<TModel, bool>>? filter = null)
        {
            ResultModel<IList<TModel>> result = new();
            try
            {
                result.ResultData = _modelOp.GetAll(filter);
                result.IsSucces = true;
            }
            catch (Exception ex)
            {
                result.IsSucces = false;
                result.Message = ex.Message;
            }
            return result;
        }

        public async Task<IResultModel<IList<TModel>>> GetAllAsync(Expression<Func<TModel, bool>>? filter = null)
        {
            ResultModel<IList<TModel>> result = new();
            try
            {
                result.ResultData = await _modelOp.GetAllAsync(filter);
                result.IsSucces = true;
            }
            catch (Exception ex)
            {
                result.IsSucces = false;
                result.Message = ex.Message;
            }
            return result;
        }

        public IResultModel<TModel> GetById(int Id)
        {
            ResultModel<TModel> result = new();
            try
            {
                result.ResultData = _modelOp.GetById(Id);
                result.IsSucces = true;
            }
            catch (Exception ex)
            {
                result.IsSucces = false;
                result.Message = ex.Message;
            }
            return result;
        }

        public async Task<IResultModel<TModel>> GetByIdAsync(int Id)
        {
            ResultModel<TModel> result = new();
            try
            {
                result.ResultData = await _modelOp.GetByIdAsync(Id);
                result.IsSucces = true;
            }
            catch (Exception ex)
            {
                result.IsSucces = false;
                result.Message = ex.Message;
            }
            return result;
        }

        public IResultModel<int> Insert(TModel model)
        {
            ResultModel<int> result = new();
            try
            {
                result.ResultData = _modelOp.Insert(model);
                result.IsSucces = true;
            }
            catch (Exception ex)
            {
                result.IsSucces = false;
                result.Message = ex.Message;
            }
            return result;
        }

        public async Task<IResultModel<int>> InsertAsync(TModel model)
        {
            ResultModel<int> result = new();
            try
            {
                result.ResultData = await _modelOp.InsertAsync(model);
                result.IsSucces = true;
            }
            catch (Exception ex)
            {
                result.IsSucces = false;
                result.Message = ex.Message;
            }
            return result;
        }

        public IResultModel<bool> Update(TModel model)
        {
            ResultModel<bool> result = new();
            try
            {
                result.ResultData = _modelOp.Update(model);
                result.IsSucces = true;
            }
            catch (Exception ex)
            {
                result.IsSucces = false;
                result.Message = ex.Message;
            }
            return result;
        }

        public async Task<IResultModel<bool>> UpdateAsync(TModel model)
        {
            ResultModel<bool> result = new();
            try
            {
                result.ResultData = await _modelOp.UpdateAsync(model);
                result.IsSucces = true;
            }
            catch (Exception ex)
            {
                result.IsSucces = false;
                result.Message = ex.Message;
            }
            return result;
        }
    }
}
