-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE Doctors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    specialty TEXT NOT NULL
);

CREATE TABLE Patients (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE Visits (
    id SERIAL PRIMARY KEY,
    doctor_id INT,
    patient_id INT,     
    date TIMESTAMP NOT NULL,
    CONSTRAINT fk_doctor_id FOREIGN KEY (doctor_id) REFERENCES Doctors(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_patient_id FOREIGN KEY (patient_id) REFERENCES Patients(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Diseases (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT
);

CREATE TABLE Diagnoses (
    id SERIAL PRIMARY KEY,
    visit_id INT,
    disease_id INT,
    notes TEXT,
    CONSTRAINT fk_visit_id FOREIGN KEY (visit_id) REFERENCES Visits(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_disease_id FOREIGN KEY (disease_id) REFERENCES Diseases(id) ON DELETE CASCADE ON UPDATE CASCADE
);



------------------------------------------------------------------------------------------------

-- doctors
-- -
-- id pk int
-- name string
-- specialty string

-- patients
-- -
-- id pk in
-- name string

-- visits
-- -
-- id pk int FK - diagnoses.visit_id
-- doctor_id int FK - doctors.id
-- patients_id int FK - patients.id
-- date timestamp

-- diseases
-- -
-- id pk int
-- name string
-- description string

-- diagnoses
-- -
-- id pk int
-- visit_id int
-- disease_id int FK - diseases.id
-- notes string

