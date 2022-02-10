using Entities.Models;
using System;
using System.ComponentModel.DataAnnotations;

namespace Entities.ViewModels
{
    public partial class ReservaViewModel
    {
        [Key]
        public int ReservaId { get; set; }



        [Required]
        [Display(Name = "Cliente ID")]
        public int ClienteId { get; set; }
        public virtual Cliente Cliente { get; set; }





        [Required]
        [Display(Name = "Hotel ID")]
        public int HotelId { get; set; }
        public virtual Hotel Hotel { get; set; }




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
