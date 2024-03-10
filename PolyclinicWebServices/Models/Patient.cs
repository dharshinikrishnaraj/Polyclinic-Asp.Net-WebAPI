using System.ComponentModel.DataAnnotations;

namespace PolyclinicWebServices.Models
{
    public class Patient
    {
        //Implement the logic here
        [Required]
        public string PatientId { get; set; }

        [Required]
        public string PatientName { get; set;}

        [Required]
        public string Gender { get; set; }

        [Required]
        [RegularExpression(@"^\d{10}$")]
        public string ContactNumber { get; set; }

        [Required]
        public byte Age { get; set; }

    }
}
