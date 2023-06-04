using System.Linq.Expressions;
using GuvenFuture.Core.Models;

namespace GuvenFuture.Business.Core
{
    public interface IBusiness<TModel> where TModel : class, IBaseEntity, new()
    {
        //IResultModel<TModel>

        Task<IResultModel<int>> InsertAsync(TModel model);
        IResultModel<int> Insert(TModel model);

        Task<IResultModel<bool>> UpdateAsync(TModel model);
        IResultModel<bool> Update(TModel model);

        Task<IResultModel<bool>> DeleteByIDAsync(int Id);
        IResultModel<bool> DeleteById(int Id);

        Task<IResultModel<TModel>> GetByIdAsync(int Id);
        IResultModel<TModel> GetById(int Id);

        Task<IResultModel<IList<TModel>>> GetAllAsync(Expression<Func<TModel, bool>>? filter = null);
        IResultModel<IList<TModel>> GetAll(Expression<Func<TModel, bool>>? filter = null);

    }
}
