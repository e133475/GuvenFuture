using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using GuvenFuture.Core.Models;
using GuvenFuture.DataAccess.Context;
using GuvenFuture.Entities.User;
using Microsoft.EntityFrameworkCore;

namespace GuvenFuture.DataAccess.Core
{
    public class DataAccessOperations<TModel> : IDataAccessOperations<TModel> where TModel : class, IBaseEntity, new()
    {
        public DbContext _context { get; set; }
        public DataAccessOperations(DbContext dbContext)
        {
            _context = dbContext;
        }

        #region Insert
        public int Insert(TModel model)
        {
            try
            {
                //using (_context)
                //{
                model.DataStatus = 1;
                _context.Entry(model).State = EntityState.Added;
                _context.SaveChanges();
                return model.AutoId;
                //}
            }
            catch (Exception)
            {
                return -1;
            }
        }
        public async Task<int> InsertAsync(TModel model)
        {
            try
            {
                //using (_context)
                //{
                model.DataStatus = 1;
                _context.Entry(model).State = EntityState.Added;
                await _context.SaveChangesAsync();
                return model.AutoId;
                //}
            }
            catch (Exception)
            {
                return -1;
            }
        }
        #endregion

        #region Update
        public bool Update(TModel model)
        {
            try
            {
                using (_context)
                {
                    TModel oldRec = this.GetById(model.AutoId);
                    foreach (PropertyInfo property in typeof(TModel).GetProperties().Where(p => p.CanWrite))
                    {
                        if (property.GetValue(model, null) is not null)
                            property.SetValue(oldRec, property.GetValue(model, null), null);
                    }
                    _context.Entry(oldRec).State = EntityState.Modified;
                    _context.SaveChanges();
                    return true;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }
        public async Task<bool> UpdateAsync(TModel model)
        {
            try
            {
                using (_context)
                {
                    TModel oldRec = this.GetById(model.AutoId);
                    foreach (PropertyInfo property in typeof(TModel).GetProperties().Where(p => p.CanWrite))
                    {
                        if (property.GetValue(model, null) is not null)
                            property.SetValue(oldRec, property.GetValue(model, null), null);
                    }
                    _context.Entry(oldRec).State = EntityState.Modified;

                    await _context.SaveChangesAsync();
                    return true;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region Delete
        public bool DeleteById(int Id)
        {
            try
            {
                using (_context)
                {
                    TModel model = GetById(Id);
                    if (model == null) return false;

                    model.DataStatus = 0;
                    _context.Entry(model).State = EntityState.Modified;
                    _context.SaveChanges();
                    return true;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }
        public async Task<bool> DeleteByIDAsync(int Id)
        {
            try
            {
                using (_context)
                {
                    TModel model = await GetByIdAsync(Id);
                    if (model == null) return false;

                    model.DataStatus = 0;
                    _context.Entry(model).State = EntityState.Modified;
                    await _context.SaveChangesAsync();
                    return true;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool BulkDelete(Expression<Func<TModel, bool>>? filter = null)
        {
            try
            {
                IList<TModel>? modelList = GetAll(filter);
                if (modelList == null) return false;
                for (int i = 0; i < modelList.Count; i++)
                {
                    bool response = DeleteById(modelList[i].AutoId);
                    if (!response) { break; }
                }
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public async Task<bool> BulkDeleteAsync(Expression<Func<TModel, bool>>? filter = null)
        {
            try
            {
                IList<TModel>? modelList = await GetAllAsync(filter);
                if (modelList == null) return false;
                for (int i = 0; i < modelList.Count; i++)
                {
                    bool response = await DeleteByIDAsync(modelList[i].AutoId);
                    if (!response) { break; }
                }
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region Get
        public IList<TModel> GetAll(Expression<Func<TModel, bool>>? filter = null)
        {
            try
            {
                //using (_context)
                //{
                return (filter != null ? _context.Set<TModel>().Where(filter) : _context.Set<TModel>()).ToList();
                //}
            }
            catch (Exception ex)
            {
                return default(List<TModel>);
            }
        }
        public async Task<IList<TModel>> GetAllAsync(Expression<Func<TModel, bool>>? filter = null)
        {
            try
            {
                //using (_context)
                //{
                return await (filter != null ? _context.Set<TModel>().Where(filter) : _context.Set<TModel>()).ToListAsync();
                //}
            }
            catch (Exception ex)
            {
                return default(List<TModel>);
            }
        }
        public TModel GetById(int Id)
        {
            try
            {
                //using (_context)
                //{
                return _context.Set<TModel>().Find(Id);
                //}
            }
            catch (Exception ex)
            {
                return default(TModel);
            }
        }
        public async Task<TModel> GetByIdAsync(int Id)
        {
            try
            {
                //using (_context)
                //{
                return await _context.Set<TModel>().FindAsync(Id);
                //}
            }
            catch (Exception ex)
            {
                return default(TModel);
            }
        }

        public TModel GetFirstOrDefault(Expression<Func<TModel, bool>>? filter = null)
        {
            try
            {
                //using (_context)
                //{
                return _context.Set<TModel>().FirstOrDefault(filter);
                //}
            }
            catch (Exception ex)
            {
                return default(TModel);
            }
        }
        public async Task<TModel> GetFirstOrDefaultAsync(Expression<Func<TModel, bool>>? filter = null)
        {
            try
            {
                //using (_context)
                //{
                return await _context.Set<TModel>().FirstOrDefaultAsync(filter);
                //}
            }
            catch (Exception ex)
            {
                return default(TModel);
            }
        }
        #endregion

    }
}
