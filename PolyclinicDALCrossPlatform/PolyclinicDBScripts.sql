USE [master]
GO
IF (EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE ('[' + name + ']' = N'PolyclinicDB'OR name = N'PolyclinicDB')))
DROP DATABASE PolyclinicDB

CREATE DATABASE PolyclinicDB
GO

USE PolyclinicDB
GO

IF OBJECT_ID('Doctors')  IS NOT NULL
DROP TABLE Doctors
GO

IF OBJECT_ID('Patients') IS NOT NULL
DROP TABLE Patients
GO

IF OBJECT_ID('Appointments') IS NOT NULL
DROP TABLE Appointments
GO

CREATE TABLE Doctors
(
	[DoctorID] CHAR(3) CONSTRAINT pk_DoctorID PRIMARY KEY,
	[Specialization] VARCHAR(40) NOT NULL,
	[DoctorName] VARCHAR(50) NOT NULL,
	[Fees] MONEY NOT NULL
)
GO 

-- Insertion scripts for Doctors
INSERT INTO Doctors(DoctorID, Specialization, DoctorName, Fees) VALUES('D1','Physician','Jacob Johnson',500)
INSERT INTO Doctors(DoctorID, Specialization, DoctorName, Fees) VALUES('D2','orthopaedics','Smith Garry',600)
INSERT INTO Doctors(DoctorID, Specialization, DoctorName, Fees) VALUES('D3','Pediatrics','Anna Kirsten',500)
INSERT INTO Doctors(DoctorID, Specialization, DoctorName, Fees) VALUES('D4','Dermatology','Jennifer Kane',500)
GO

CREATE TABLE Patients
(
	[PatientID] CHAR(4) CONSTRAINT pk_PatientID PRIMARY KEY CONSTRAINT chk_PatientID CHECK(PatientID LIKE 'P%'),
	[PatientName] VARCHAR(40) NOT NULL,
	[Age] TINYINT NOT NULL,
	[Gender] CHAR(1) CONSTRAINT chk_Gender CHECK(Gender='F' OR Gender='M') NOT NULL,
	[ContactNumber] VARCHAR(10) NOT NULL	
)
GO

-- Insertion script for Patients
INSERT INTO Patients(PatientID, PatientName, Age, Gender, ContactNumber) VALUES('P1','Laila',26,'F','9999998855')
INSERT INTO Patients(PatientID, PatientName, Age, Gender, ContactNumber) VALUES('P2','Anne',23,'F','9988996611')
INSERT INTO Patients(PatientID, PatientName, Age, Gender, ContactNumber) VALUES('P3','Jane',53,'F','6666668855')
INSERT INTO Patients(PatientID, PatientName, Age, Gender, ContactNumber) VALUES('P4','Feroz',18,'M','1199998833')
INSERT INTO Patients(PatientID, PatientName, Age, Gender, ContactNumber) VALUES('P5','Amiya',46,'F','7779998822')
INSERT INTO Patients(PatientID, PatientName, Age, Gender, ContactNumber) VALUES('P6','Susan',31,'F','6666668880')
INSERT INTO Patients(PatientID, PatientName, Age, Gender, ContactNumber) VALUES('P7','Leo',69,'M','9999971133')
INSERT INTO Patients(PatientID, PatientName, Age, Gender, ContactNumber) VALUES('P8','Dennis',22,'M','3333338855')
INSERT INTO Patients(PatientID, PatientName, Age, Gender, ContactNumber) VALUES('P9','Maybel',33,'F','9944665511')
INSERT INTO Patients(PatientID, PatientName, Age, Gender, ContactNumber) VALUES('P10','Richard',35,'M','8766443355')
GO

CREATE TABLE Appointments
(
	[AppointmentNo] INT CONSTRAINT pk_AppointmentNo PRIMARY KEY IDENTITY,
	[PatientID] CHAR(4) CONSTRAINT fk_PatientID REFERENCES  Patients(PatientID) NOT NULL,
	[DoctorID] CHAR(3) CONSTRAINT fk_DoctorID REFERENCES Doctors(DoctorID) NOT NULL,
	[DateofAppointment] DATE CONSTRAINT chk_DateofAppointment CHECK(DateofAppointment >= CONVERT(DATE,GETDATE())) NOT NULL
)
GO

-- Insertion script for Appointments
SET IDENTITY_INSERT Appointments ON
INSERT INTO Appointments(AppointmentNo,PatientID,DoctorID,DateofAppointment) VALUES(1,'P1','D1', DATEADD(d, 15, CONVERT(DATE, GETDATE())))
INSERT INTO Appointments(AppointmentNo,PatientID,DoctorID,DateofAppointment) VALUES(2,'P2','D2', DATEADD(d, 5, CONVERT(DATE, GETDATE())))
INSERT INTO Appointments(AppointmentNo,PatientID,DoctorID,DateofAppointment) VALUES(3,'P1','D2', DATEADD(d, 5, CONVERT(DATE, GETDATE())))
INSERT INTO Appointments(AppointmentNo,PatientID,DoctorID,DateofAppointment) VALUES(4,'P3','D3', DATEADD(d, 10, CONVERT(DATE, GETDATE())))
INSERT INTO Appointments(AppointmentNo,PatientID,DoctorID,DateofAppointment) VALUES(5,'P4','D4', DATEADD(d, 10, CONVERT(DATE, GETDATE())))
INSERT INTO Appointments(AppointmentNo,PatientID,DoctorID,DateofAppointment) VALUES(6,'P5','D1', DATEADD(d, 10, CONVERT(DATE, GETDATE())))
INSERT INTO Appointments(AppointmentNo,PatientID,DoctorID,DateofAppointment) VALUES(7,'P6','D4', DATEADD(d, 7, CONVERT(DATE, GETDATE())))
INSERT INTO Appointments(AppointmentNo,PatientID,DoctorID,DateofAppointment) VALUES(8,'P7','D3', DATEADD(d, 5, CONVERT(DATE, GETDATE())))
INSERT INTO Appointments(AppointmentNo,PatientID,DoctorID,DateofAppointment) VALUES(9,'P8','D4', DATEADD(d, 7, CONVERT(DATE, GETDATE())))
INSERT INTO Appointments(AppointmentNo,PatientID,DoctorID,DateofAppointment) VALUES(10,'P9','D4', DATEADD(d, 5, CONVERT(DATE, GETDATE())))
INSERT INTO Appointments(AppointmentNo,PatientID,DoctorID,DateofAppointment) VALUES(11,'P10','D2', DATEADD(d, 5, CONVERT(DATE, GETDATE())))
INSERT INTO Appointments(AppointmentNo,PatientID,DoctorID,DateofAppointment) VALUES(12,'P7','D3', DATEADD(d, 2, CONVERT(DATE, GETDATE())))
INSERT INTO Appointments(AppointmentNo,PatientID,DoctorID,DateofAppointment) VALUES(13,'P7','D2', DATEADD(d, 6, CONVERT(DATE, GETDATE())))
INSERT INTO Appointments(AppointmentNo,PatientID,DoctorID,DateofAppointment) VALUES(14,'P2','D1', DATEADD(d, 2, CONVERT(DATE, GETDATE())))
INSERT INTO Appointments(AppointmentNo,PatientID,DoctorID,DateofAppointment) VALUES(15,'P5','D2', DATEADD(d, 3, CONVERT(DATE, GETDATE())))
INSERT INTO Appointments(AppointmentNo,PatientID,DoctorID,DateofAppointment) VALUES(16,'P6','D4', DATEADD(d, 15, CONVERT(DATE, GETDATE())))
INSERT INTO Appointments(AppointmentNo,PatientID,DoctorID,DateofAppointment) VALUES(17,'P3','D1', DATEADD(d, 15, CONVERT(DATE, GETDATE())))
INSERT INTO Appointments(AppointmentNo,PatientID,DoctorID,DateofAppointment) VALUES(18,'P5','D1', DATEADD(d, 15, CONVERT(DATE, GETDATE())))
SET IDENTITY_INSERT Appointments OFF
GO

SELECT * FROM Doctors
SELECT * FROM Patients
SELECT * FROM Appointments