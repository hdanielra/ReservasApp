using Entities.Models;
using Microsoft.EntityFrameworkCore;

namespace Entities
{
    public class RepositoryContext : DbContext
    {
        public RepositoryContext(DbContextOptions<RepositoryContext> options) : base(options)
        {

        }

        public DbSet<Hotel> Hotel { get; set; }
        public DbSet<Cliente> Cliente { get; set; }
        public DbSet<Habitacion> Habitacion { get; set; }
        public DbSet<Reserva> Reserva { get; set; }
        public DbSet<CostoHabitacion> CostoHabitacion { get; set; }
        public DbSet<TipoHabitacion> TipoHabitacion { get; set; }
        public DbSet<Temporada> Temporada { get; set; }

    }

}
