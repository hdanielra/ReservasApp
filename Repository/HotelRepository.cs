using Contracts;
using Entities;
using Entities.Models;

namespace Repository
{
    public class HotelRepository : RepositoryBase<RepositoryContext, Hotel>, IHotelRepository
    {
        public HotelRepository(RepositoryContext repositoryContext)
            : base(repositoryContext)
        {
        }
    }
}