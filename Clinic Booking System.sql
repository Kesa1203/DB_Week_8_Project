-- Creating a database for a Clinic Booking System
Create Database ClinicBookingSystem; -- Create the database

USE ClinicBookingSystem; -- Use the created database

-- Create the Patients table to store patient information
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each patient
    FirstName VARCHAR(50) NOT NULL, -- Patient's first name
    LastName VARCHAR(50) NOT NULL, -- Patient's last name
    DateOfBirth DATE NOT NULL, -- Patient's date of birth
    Gender ENUM('Male', 'Female', 'Other') NOT NULL, -- Patient's gender
    PhoneNumber VARCHAR(15) UNIQUE NOT NULL, -- Patient's phone number (must be unique)
    Email VARCHAR(100) UNIQUE, -- Patient's email address (optional, must be unique if provided)
    Address TEXT -- Patient's address
);

USE ClinicBookingSystem; -- Use the created database

-- Create the Doctors table to store doctor information
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each doctor
    FirstName VARCHAR(50) NOT NULL, -- Doctor's first name
    LastName VARCHAR(50) NOT NULL, -- Doctor's last name
    Specialty VARCHAR(100) NOT NULL, -- Doctor's area of specialization
    PhoneNumber VARCHAR(15) UNIQUE NOT NULL, -- Doctor's phone number (must be unique)
    Email VARCHAR(100) UNIQUE, -- Doctor's email address (optional, must be unique if provided)
    OfficeNumber VARCHAR(10) NOT NULL -- Doctor's office number
);

USE ClinicBookingSystem; -- Use the created database

-- Create the Appointments table to store appointment details
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each appointment
    PatientID INT NOT NULL, -- Foreign key referencing the Patients table
    DoctorID INT NOT NULL, -- Foreign key referencing the Doctors table
    AppointmentDate DATETIME NOT NULL, -- Date and time of the appointment
    ReasonForVisit TEXT, -- Reason for the patient's visit
    Status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled', -- Status of the appointment
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID) ON DELETE CASCADE, -- Cascade delete if patient is removed
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID) ON DELETE CASCADE -- Cascade delete if doctor is removed
);

USE ClinicBookingSystem; -- Use the created database

-- Create the Prescriptions table to store prescription details
CREATE TABLE Prescriptions (
    PrescriptionID INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each prescription
    AppointmentID INT NOT NULL, -- Foreign key referencing the Appointments table
    MedicationName VARCHAR(100) NOT NULL, -- Name of the prescribed medication
    Dosage VARCHAR(50) NOT NULL, -- Dosage instructions for the medication
    Instructions TEXT NOT NULL, -- Additional instructions for the medication
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID) ON DELETE CASCADE -- Cascade delete if appointment is removed
);

USE ClinicBookingSystem; -- Use the created database

-- Create the Payments table to store payment details
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each payment
    AppointmentID INT NOT NULL, -- Foreign key referencing the Appointments table
    PaymentDate DATETIME NOT NULL, -- Date and time of the payment
    Amount DECIMAL(10, 2) NOT NULL, -- Payment amount
    PaymentMethod ENUM('Cash', 'Credit Card', 'Insurance') NOT NULL, -- Payment method used
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID) ON DELETE CASCADE -- Cascade delete if appointment is removed
);

USE ClinicBookingSystem; -- Use the created database

-- Insert sample data into the Patients table
INSERT INTO Patients (FirstName, LastName, DateOfBirth, Gender, PhoneNumber, Email, Address)
VALUES
('John', 'Doe', '1985-06-15', 'Male', '1234567890', 'john.doe@example.com', '123 Main St'), -- Sample patient 1
('Jane', 'Smith', '1990-09-25', 'Female', '0987654321', 'jane.smith@example.com', '456 Elm St'); -- Sample patient 2

-- Insert sample data into the Doctors table
INSERT INTO Doctors (FirstName, LastName, Specialty, PhoneNumber, Email, OfficeNumber)
VALUES
('Alice', 'Brown', 'Cardiology', '1112223333', 'alice.brown@example.com', '101'), -- Sample doctor 1
('Bob', 'Johnson', 'Dermatology', '4445556666', 'bob.johnson@example.com', '102'); -- Sample doctor 2

-- Insert sample data into the Appointments table
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, ReasonForVisit, Status)
VALUES
(1, 1, '2025-05-02 10:00:00', 'Routine Checkup', 'Scheduled'), -- Appointment for patient 1 with doctor 1
(2, 2, '2025-05-03 14:00:00', 'Skin Rash', 'Scheduled'); -- Appointment for patient 2 with doctor 2

-- Insert sample data into the Prescriptions table
INSERT INTO Prescriptions (AppointmentID, MedicationName, Dosage, Instructions)
VALUES
(1, 'Aspirin', '100mg', 'Take one tablet daily after meals'), -- Prescription for appointment 1
(2, 'Hydrocortisone Cream', 'Apply twice daily', 'Apply to affected area'); -- Prescription for appointment 2

-- Insert sample data into the Payments table
INSERT INTO Payments (AppointmentID, PaymentDate, Amount, PaymentMethod)
VALUES
(1, '2025-05-02 11:00:00', 50.00, 'Cash'), -- Payment for appointment 1
(2, '2025-05-03 15:00:00', 75.00, 'Credit Card'); -- Payment for appointment 2