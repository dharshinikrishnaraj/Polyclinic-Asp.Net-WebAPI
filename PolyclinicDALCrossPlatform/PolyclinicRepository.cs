
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using Microsoft.EntityFrameworkCore;
using PolyclinicDALCrossPlatform.Models;

namespace PolyclinicDALCrossPlatform
{
    public class PolyclinicRepository
    {  
        
        PolyclinicDBContext context;
        public PolyclinicRepository(PolyclinicDBContext context)
        {          
            this.context = context;
        }

        public List<Patient> GetAllPatientDetails()
        {
            List<Patient> patientlist = new List<Patient>();
            try
            {
               patientlist = (from patient in context.Patients orderby patient.PatientId select patient).ToList();
            }
            catch(Exception)
            {
               patientlist = null;
            }
               return patientlist;
        }

        public List<Appointment> GetAllAppointmentDetails()
        {
            List<Appointment> Appointmentlist = new List<Appointment>();
            try
            {
                Appointmentlist = (from pat in context.Appointments orderby pat.AppointmentNo select pat).ToList();
            }
            catch (Exception)
            {
                Appointmentlist = null;
            }
            return Appointmentlist;
        }

        public Patient GetPatientDetails(string patientId)
        {
            Patient patientDetails = new Patient();

            try
            {
                patientDetails = context.Patients
                                        .Where(p => p.PatientId == patientId)
                                        .FirstOrDefault();
            }
            catch (Exception)
            {
                patientDetails = null;
            }
            return patientDetails;
        }

        public bool AddNewPatientDetails(Patient patientObj)
        {
            bool status = false;
            try
            {
                context.Patients.Add(patientObj);
                context.SaveChanges();
                status = true;
            }
            catch (Exception)
            {
                status = false;
            }
            return status;

        }

        public bool UpdatePatientAge(string patientId, byte newAge)
        {
            bool status = false;
            Patient patientObj = context.Patients.Find(patientId);
            try
            {
                if (patientObj != null)
                {
                    patientObj.Age = newAge;
                    context.SaveChanges();
                    status = true;
                }
                else
                {
                    status = false;
                }
            }
            catch (Exception)
            {
                status = false;
            }
            return status;
        }
        public int CancelAppointment(int appointmentNo)
        {
            int status = -1;
            Appointment appointmentsObj;
            try
            {
                appointmentsObj = context.Appointments.Find(appointmentNo);
                if (appointmentsObj != null)
                {
                    context.Appointments.Remove(appointmentsObj);
                    context.SaveChanges();
                    status = 1;
                }
                else
                {
                    status = -1;
                }
            }
            catch (Exception)
            {
                status = -99;
            }
            return status;
        }
    }
}
