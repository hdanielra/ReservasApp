using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Entities.Models
{
    public partial class Cliente
    {
        public Cliente()
        {
            Reservas =  new HashSet<Reserva>();
        }

        [Key]
        [Display(Name = "Cliente ID")]
        public int ClienteId { get; set; }


        [Required]
        public string Nombre { get; set; }



        // ------------------------------------------------------------------------------------
        public virtual ICollection<Reserva> Reservas { get; set; }
        // ------------------------------------------------------------------------------------
    }
}
