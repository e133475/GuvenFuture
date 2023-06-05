using System.Linq.Expressions;
using System.Security.Claims;
using GuvenFuture.Core.Models;
using GuvenFuture.DataAccess.Context;
using GuvenFuture.DataAccess.Core;
using GuvenFuture.Entities.Computeds.Enums;
using Microsoft.AspNetCore.Http;

namespace GuvenFuture.Business.Core
{
    public class BusinessCommonOperations<TModel> : IBusiness<TModel> where TModel : class, IBaseEntity, new()
    {
        readonly DataAccessOperations<TModel> _modelOp;
        private readonly IHttpContextAccessor _accessor;
        public CurrentUser _currentUser;
        public BusinessCommonOperations(GuvenFutureContext context, IHttpContextAccessor accessor)
        {
            _accessor = accessor;
            _modelOp = new DataAccessOperations<TModel>(context);
            InitUser();
        }

        public void InitUser()
        {
            ClaimsPrincipal _user = _accessor?.HttpContext?.User;
            if (_user is not null && _user.Claims.Count() > 0)
                _currentUser = new CurrentUser()
                {
                    Name = _user.FindFirst("Name").Value,
                    UserId = Convert.ToInt32(_user.FindFirst("UserId").Value.ToString()),
                    ProviderID = Convert.ToInt32(_user.FindFirst("ProviderID").Value.ToString()),
                    UserType = _user.FindFirst("UserType").Value
                };
            else
                _currentUser = new CurrentUser()
                {
                    Name = "Anonymous",
                    UserId = 0,
                    ProviderID = 0,
                    UserType = "Guest"
                };
            //or if u want the list of claims
            //var claims = User.Claims;
        }

        public virtual IResultModel<bool> DeleteById(int Id)
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

        public virtual async Task<IResultModel<bool>> DeleteByIDAsync(int Id)
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

        public virtual IResultModel<IList<TModel>> GetAll(Expression<Func<TModel, bool>>? filter = null)
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

        public virtual async Task<IResultModel<IList<TModel>>> GetAllAsync(Expression<Func<TModel, bool>>? filter = null)
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

        public virtual IResultModel<TModel> GetById(int Id)
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

        public virtual async Task<IResultModel<TModel>> GetByIdAsync(int Id)
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

        public virtual IResultModel<int> Insert(TModel model)
        {
            ResultModel<int> result = new();
            try
            {
                model.CreatedBy = _currentUser.UserId;
                model.CreatedDate= DateTime.Now;
                model.ProviderId = _currentUser.ProviderID;
                model.DataStatus = 1;

                result.ResultData = _modelOp.Insert(model);
                result.IsSucces = true;
                result.Message = ":)";
            }
            catch (Exception ex)
            {
                result.IsSucces = false;
                result.Message = ex.Message;
            }
            return result;
        }

        public virtual async Task<IResultModel<int>> InsertAsync(TModel model)
        {
            ResultModel<int> result = new();
            try
            {
                model.CreatedBy = _currentUser.UserId;
                model.ProviderId = _currentUser.ProviderID;
                model.DataStatus = 1;

                result.ResultData = await _modelOp.InsertAsync(model);
                result.IsSucces = true;
                result.Message = ":)";
            }
            catch (Exception ex)
            {
                result.IsSucces = false;
                result.Message = ex.Message;
            }
            return result;
        }

        public virtual IResultModel<bool> Update(TModel model)
        {
            ResultModel<bool> result = new();
            try
            {
                model.CreatedBy = _currentUser.UserId;
                model.ProviderId = _currentUser.ProviderID;

                result.ResultData = _modelOp.Update(model);
                result.IsSucces = true;
                result.Message = ":)";
            }
            catch (Exception ex)
            {
                result.IsSucces = false;
                result.Message = ex.Message;
            }
            return result;
        }

        public virtual async Task<IResultModel<bool>> UpdateAsync(TModel model)
        {
            ResultModel<bool> result = new();
            try
            {
                model.CreatedBy = _currentUser.UserId;
                model.ProviderId = _currentUser.ProviderID;

                result.ResultData = await _modelOp.UpdateAsync(model);
                result.IsSucces = true;
                result.Message = ":)";
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
