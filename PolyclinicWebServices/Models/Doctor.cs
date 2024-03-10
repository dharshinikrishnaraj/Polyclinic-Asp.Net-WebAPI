using System.ComponentModel.DataAnnotations;

namespace PolyclinicWebServices.Models
{
    public class Doctor
    {
        //Implement the logic here
        [Required]
      public string DoctorId { get; set; }

        [Required]
      public string DoctorName { get; set;}

        [Required]
        [Range(100, double.MaxValue)]
      public decimal Fees {  get; set; }

        [Required]
      public string Specialization { get; set; }
      
    }
}
