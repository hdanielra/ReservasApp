using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entities.Models
{
    public partial class CostoHabitacion
    {
        [Key]
        [Display(Name = "Costo Habitación ID")]
        public int CostoHabitacionID { get; set; }



        [Required]
        [Display(Name = "Hotel ID")]
        public int HotelId { get; set; }
        public virtual Hotel Hotel { get; set; }





        [Required]
        [Display(Name = "Tipo Habitación ID")]
        public int TipoHabitacionId { get; set; }
        public virtual TipoHabitacion TipoHabitacion { get; set; }



        [Required]
        [Display(Name = "Temporada ID")]
        public int TemporadaId { get; set; }
        public virtual Temporada Temporada { get; set; }







        [Required]
        [DataType(DataType.Currency)]
        [Column(TypeName = "decimal(16, 2)")]
        public decimal Precio { get; set; }


    }
}
