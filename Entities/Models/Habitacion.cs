using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Models
{
    public partial class Habitacion
    {
        public Habitacion()
        {
            Reservas = new HashSet<Reserva>();
        }

        [Key]
        [Display(Name = "Habitación ID")]
        public int HabitacionId { get; set; }


        [Required]
        [Display(Name = "Hotel ID")]
        public int HotelId { get; set; }
        public virtual Hotel Hotel { get; set; }





        [Required]
        [Display(Name = "Tipo Habitación ID")]
        public int TipoHabitacionId { get; set; }
        public virtual TipoHabitacion TipoHabitacion { get; set; }





        [Required]
        [Display(Name = "Núm. Habitación")]
        public int NumeroHabitacion { get; set; }


        [Required]
        public int Cupo { get; set; }

        //[Required]
        //public decimal Precio { get; set; }


        [Required]
        public int Estado { get; set; }




        // ------------------------------------------------------------------------------------

        public virtual ICollection<Reserva> Reservas { get; set; }

        // ------------------------------------------------------------------------------------
    }
}
