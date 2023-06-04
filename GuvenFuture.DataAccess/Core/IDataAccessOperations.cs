using System.Linq.Expressions;
using GuvenFuture.Core.Models;

namespace GuvenFuture.DataAccess.Core
{
    public interface IDataAccessOperations<TModel> where TModel : class, IBaseEntity, new()
    {
        Task<int> InsertAsync(TModel model);
        int Insert(TModel model);

        Task<bool> UpdateAsync(TModel model);
        bool Update(TModel model);

        Task<bool> DeleteByIDAsync(int Id);
        bool DeleteById(int Id);

        Task<bool> BulkDeleteAsync(Expression<Func<TModel, bool>>? filter = null);
        bool BulkDelete(Expression<Func<TModel, bool>>? filter = null);

        Task<TModel> GetByIdAsync(int Id);
        TModel GetById(int Id);

        Task<IList<TModel>> GetAllAsync(Expression<Func<TModel, bool>>? filter = null);
        IList<TModel> GetAll(Expression<Func<TModel, bool>>? filter = null);

    }
}
