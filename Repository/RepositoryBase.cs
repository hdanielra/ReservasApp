using Contracts;
using Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace Repository
{
    public abstract class RepositoryBase<TContext,T> : IRepositoryBase<T> where T : class where TContext : DbContext
    {

        // ------------------------------------------------------------------------------
        //protected RepositoryContext RepositoryContext { get; set; }
        protected TContext _context;

        public RepositoryBase(TContext context)
        {
            _context = context;
        }
        // ------------------------------------------------------------------------------


        // AsNoTracking() permite omitir el requisito de "clave única por registro" en EF
        // (no mencionado explícitamente por otras respuestas). Esto es extremadamente
        // útil cuando se lee una Vista que no admite una clave única porque quizás
        // algunos campos son anulables o la naturaleza de la
        // vista no es indexable lógicamente.

        public IQueryable<T> FindAll(bool trackChanges)
        {
            return !trackChanges ? _context.Set<T>().AsNoTracking() :
                _context.Set<T>();
        }

        public IQueryable<T> FindByCondition(Expression<Func<T, bool>> expression, bool trackChanges)
        {
            return !trackChanges ? _context.Set<T>().Where(expression).AsNoTracking() :
                _context.Set<T>();
        }

        public void Create(T entity)
        {
             _context.Set<T>().AddAsync(entity);
        }

        public void Update(T entity)
        {
            _context.Set<T>().Update(entity);
        }

        public void Delete(T entity)
        {
            _context.Set<T>().Remove(entity);
        }
    }
}