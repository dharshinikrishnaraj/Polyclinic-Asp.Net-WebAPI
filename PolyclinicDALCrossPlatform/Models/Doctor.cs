using System;
using System.Collections.Generic;

namespace PolyclinicDALCrossPlatform.Models
{
    public partial class Doctor
    {
        public Doctor()
        {
            Appointments = new HashSet<Appointment>();
        }

        public string DoctorId { get; set; } = null!;
        public string Specialization { get; set; } = null!;
        public string DoctorName { get; set; } = null!;
        public decimal Fees { get; set; }

        public virtual ICollection<Appointment> Appointments { get; set; }
    }
}
