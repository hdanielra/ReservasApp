using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Models
{
    public partial class Reserva
    {
        [Key]
        public int ReservaId { get; set; }



        [Required]
        [Display(Name = "Cliente ID")]
        public int ClienteId { get; set; }
        public virtual Cliente Cliente { get; set; }




        [Required]
        [Display(Name = "Habitación ID")]
        public int HabitacionId { get; set; }
        public virtual Habitacion Habitacion { get; set; }




        [Required]
        [Display(Name = "Fecha Inicio")]
        [DataType(DataType.DateTime)]
        public DateTime FechaInicio { get; set; }



        [Display(Name = "Fecha Fin")]
        [DataType(DataType.DateTime)]
        public DateTime FechaFin { get; set; }



    }
}
