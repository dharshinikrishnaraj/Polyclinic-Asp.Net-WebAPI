using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PolyclinicDALCrossPlatform;
using PolyclinicDALCrossPlatform.Models;

using PolyclinicWebServices.Models;
using Patient = PolyclinicWebServices.Models.Patient;

namespace PolyclinicWebServices.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class AdminController : Controller
    {
        //Create repository object
        PolyclinicRepository _repository;

        public AdminController(PolyclinicRepository repos)
        {
            //Implement the logic here
            _repository = repos;
        }

        [HttpGet]
        public JsonResult GetAllPatientDetails()
        {
            //Implement the logic here
            List<PolyclinicDALCrossPlatform.Models.Patient> result = new List<PolyclinicDALCrossPlatform.Models.Patient>();
            try
            {
              result = _repository.GetAllPatientDetails();
            }
            catch(Exception ex) 
            {
                result = null;
            }
            
           return Json(result);
        }

       

        [HttpGet]
        public JsonResult GetPatientDetails(string patientId)
        {
            //Implement the logic here
            PolyclinicDALCrossPlatform.Models.Patient result = new PolyclinicDALCrossPlatform.Models.Patient();
            try
            {
                result = _repository.GetPatientDetails(patientId);
            
            }
            catch(Exception ex) 
            {
                result = null;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult AddNewPatientDetails(Models.Patient patient)
        {
            //Implement the logic here
            bool status = false;
            try
            {
                if(ModelState.IsValid)
                {
                    PolyclinicDALCrossPlatform.Models.Patient pat = new PolyclinicDALCrossPlatform.Models.Patient();
                    pat.PatientId = patient.PatientId;
                    pat.PatientName = patient.PatientName;
                    pat.Gender = patient.Gender;
                    pat.ContactNumber = patient.ContactNumber;
                    pat.Age = patient.Age;
                    status = _repository.AddNewPatientDetails(pat);
                    
                }
                else
                {
                    status = false;
                } 
            }
            catch(Exception ex)
            {
                status = false;
            }
            return Json(status);
        }
       
        [HttpPut]
        public JsonResult UpdatePatientAge(string patientId, byte age)
        {
            //Implement the logic here
            bool status = false;
            try
            {
                status = _repository.UpdatePatientAge(patientId, age);
            }
            catch(Exception ex) 
            {
                status = false;
            }
            return Json(status);
        }

        [HttpDelete]
        public JsonResult CancelAppointment(int appointmentNo)
        {
            //Implement the logic here
            int status = 0;
            try
            {
                status = _repository.CancelAppointment(appointmentNo);
            }
            catch (Exception ex) 
            {
                status = 0;
            }
            return Json(status);
        }

    }
}
