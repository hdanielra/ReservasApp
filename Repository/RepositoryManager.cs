using Contracts;
using Entities;
using System.Threading.Tasks;

namespace Repository
{
    public class RepositoryManager : IRepositoryManager
    {
        private RepositoryContext _repositoryContext;


        private IHotelRepository _hotel;
        private IHabitacionRepository _habitacion;
        private IReservaRepository _reserva;
        private IClienteRepository _cliente;



        public RepositoryManager(RepositoryContext repositoryContext)
        {
            _repositoryContext = repositoryContext;
        }



        public IHotelRepository Hotel
        {
            get
            {
                if (_hotel == null)
                {
                    _hotel = new HotelRepository(_repositoryContext);
                }
                return _hotel;
            }
        }
        public IHabitacionRepository Habitacion
        {
            get
            {
                if (_habitacion == null)
                {
                    _habitacion = new HabitacionRepository(_repositoryContext);
                }
                return _habitacion;
            }
        }

        public IReservaRepository Reserva
        {
            get
            {
                if (_reserva == null)
                {
                    _reserva = new ReservaRepository(_repositoryContext);
                }
                return _reserva;
            }
        }

        public IClienteRepository Cliente
        {
            get
            {
                if (_cliente == null)
                {
                    _cliente = new ClienteRepository(_repositoryContext);
                }
                return _cliente;
            }
        }


        public async Task Save()
        {
            //  use ChangeTracker.HasChanges() to determine which context has changed
            await _repositoryContext.SaveChangesAsync();
        }
    }
}