using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Models
{
    public partial class TipoHabitacion
    {
        public TipoHabitacion()
        {
            Habitaciones = new HashSet<Habitacion>();
            CostoHabitaciones = new HashSet<CostoHabitacion>();
        }


        [Key]
        [Display(Name = "Tipo Habitacion ID")]
        public int TipoHabitacionId { get; set; }



        [Required]
        [Display(Name = "Descripción")]
        public string Descripcion { get; set; }




        // ------------------------------------------------------------------------------------
        public virtual ICollection<Habitacion> Habitaciones { get; set; }
        public virtual ICollection<CostoHabitacion> CostoHabitaciones { get; set; }
        // ------------------------------------------------------------------------------------


    }
}
