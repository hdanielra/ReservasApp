using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Entities.Models
{
    public partial class Hotel
    {
        public Hotel()
        {
                Habitaciones = new HashSet<Habitacion>();
            CostoHabitaciones = new HashSet<CostoHabitacion>();
        }

        [Key]
        [Display(Name = "Hotel ID")]
        public int HotelId { get; set; }


        [Required]
        public string Nombre { get; set; }



        // ------------------------------------------------------------------------------------
        public virtual ICollection<Habitacion> Habitaciones { get; set; }
        public virtual ICollection<CostoHabitacion> CostoHabitaciones { get; set; }
        // ------------------------------------------------------------------------------------

    }
}
