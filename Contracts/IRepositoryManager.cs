using System.Threading.Tasks;

namespace Contracts
{
    public interface IRepositoryManager
    {
        IHotelRepository Hotel { get; }
        IHabitacionRepository Habitacion { get; }
        IReservaRepository Reserva { get; }
        IClienteRepository Cliente { get; }





        Task Save();
    }
}