using System;
using System.Collections.Generic;

namespace PolyclinicDALCrossPlatform.Models
{
    public partial class Patient
    {
        public Patient()
        {
            Appointments = new HashSet<Appointment>();
        }

        public string PatientId { get; set; } = null!;
        public string PatientName { get; set; } = null!;
        public string Gender { get; set; } = null!;
        public string ContactNumber { get; set; } = null!;

        public byte Age { get; set; }

        public virtual ICollection<Appointment> Appointments { get; set; }
    }
}
