using System.ComponentModel.DataAnnotations;

namespace PolyclinicWebServices.Models
{
    public class Appointment
    {
        //Implement the logic here

        [Required]
       public int AppointmentNo { get; set; }

        [Required]
       public int DateOfAppointment { get; set; }

        [Required]
       public virtual Doctor Doctor { get; set; }

        [Required]
       public string DoctorId { get; set; }

        [Required]
       public virtual Patient Patient { get; set; }

        [Required]
       public string PatientId { get; set; }
    }
}
