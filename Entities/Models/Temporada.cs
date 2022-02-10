using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Entities.Models
{
    public partial class Temporada
    {
        public Temporada()
        {
            CostoHabitaciones = new HashSet<CostoHabitacion>();
        }


        [Key]
        [Display(Name = "Temporada ID")]
        public int TemporadaId { get; set; }


        [Required]
        [Display(Name = "Descripción")]
        public string Descripcion { get; set; }


        // ------------------------------------------------------------------------------------
        public virtual ICollection<CostoHabitacion> CostoHabitaciones { get; set; }
        // ------------------------------------------------------------------------------------
    }
}
