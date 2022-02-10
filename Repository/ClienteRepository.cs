using Contracts;
using Entities;
using Entities.Models;

namespace Repository
{
    public class ClienteRepository : RepositoryBase<RepositoryContext, Cliente>, IClienteRepository
    {
        public ClienteRepository(RepositoryContext repositoryContext)
            : base(repositoryContext)
        {
        }
    }
}