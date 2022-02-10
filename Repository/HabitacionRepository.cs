using Contracts;
using Entities;
using Entities.Models;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace Repository
{
    public class HabitacionRepository : RepositoryBase<RepositoryContext, Habitacion>, IHabitacionRepository
    {
        public HabitacionRepository(RepositoryContext repositoryContext)
            : base(repositoryContext)
        {
        }



    }
}