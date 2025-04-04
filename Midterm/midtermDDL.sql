CREATE DATABASE IF NOT EXISTS hospitalDB;
USE hospitalDB;

create table Patients (
    patient_id int auto_increment primary key,
    name varchar(100) not null,
    dob date not null,
    address varchar(255) null,
    phone varchar(15) null,
    insurance_info varchar(255) null
);

create table Departments (
    department_id int  auto_increment primary key,
    name varchar(255) not null unique,
    location varchar(255) not null,
    head varchar(255) null
);

create table Doctors (
	doctor_id int auto_increment primary key,
    name varchar(100) not null,
    specialization varchar(50) not null,
    phone varchar(15) null,
    department_id int null,
    foreign key (department_id) references Departments(department_id) on delete set null
);

create table Appointments (
	appointment_id int auto_increment primary key,
    patient_id int null,
    doctor_id int null,
    appointment_date datetime not null,
    reason varchar(255) not null,
    status enum('Scheduled', 'Completed', 'Canceled') default 'Scheduled' not null,
    foreign key (patient_id) references Patients(patient_id) on delete set null,
    foreign key (doctor_id) references Doctors(doctor_id) on delete set null
);

create table Treatments (
	treatment_id int auto_increment primary key,
    appointment_id int null,
    description text not null,
    treatment_date date not null,
    foreign key (appointment_id) references Appointments(appointment_id) on delete set null
);