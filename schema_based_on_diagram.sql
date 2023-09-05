-- Define tables for each entity

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    address VARCHAR(255),
    phone_number VARCHAR(15)
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialty VARCHAR(100)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Medications (
    medication_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT
);

-- Assuming a many-to-many relationship between Patients and Medications

CREATE TABLE Patient_Medications (
    patient_id INT,
    medication_id INT,
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (patient_id, medication_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (medication_id) REFERENCES Medications(medication_id)
);

-- Add indexes on foreign key columns

CREATE INDEX idx_patient_id ON Appointments(patient_id);
CREATE INDEX idx_doctor_id ON Appointments(doctor_id);
CREATE INDEX idx_patient_medication ON Patient_Medications(patient_id, medication_id);

