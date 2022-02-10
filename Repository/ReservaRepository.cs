using Contracts;
using Entities;
using Entities.Models;

namespace Repository
{
    public class ReservaRepository : RepositoryBase<RepositoryContext, Reserva>, IReservaRepository
    {
        public ReservaRepository(RepositoryContext repositoryContext)
            : base(repositoryContext)
        {
        }
    }
}