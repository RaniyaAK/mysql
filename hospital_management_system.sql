create database hospitaldb;
use hospitaldb;

create table patients(patient_id int auto_increment primary key,first_name varchar (50),last_name varchar (50),age int,gender varchar(50),city varchar (50));

insert into patients(first_name,last_name,age,gender,city)
values("Aarav" ,"Sharma" ,"30" ,"Male" ,"Delhi" ),
      ("Diya ","Singh" ,25 ,"Female"," Mumbai"),
	  ("Rahul" ,"Verma" ,40 ,"Male" ,"Chennai"),
	  ("Sneha ","Nair" ,32 ,"Female" ,"Kochi" ),
      ("Mukesh" ,"Gupta" ,55 ,"Male" ,"Kolkata");
      
select *from patients;

create table doctors(doctor_id int auto_increment primary key,name varchar(50),specialization varchar(50),phone varchar(15));  

insert into doctors (name,specialization,phone)
values("Dr.Anil Kumar","Cardiologist",9876543210),
      ("Dr.Priya Rao","Neurologist",9988776655),
      ("Dr.John Mathew","Orthopedic",9876001234),
      ("Dr.Neha Sharma","Pediatrician",9123456780),
      ("Dr.Manoj Varma","Surgeon",9090909090);

select *from doctors;

create table departments(department_id int auto_increment primary key,department_name varchar (50));

insert into departments(department_name)
values ("Cardiology"),
       ("Neurology"),
       ("Orthopedics"),
       ("Pediatrics"),
       ("General Surgery");
       
create table appointments(appointment_id int auto_increment primary key,patient_id int,doctor_id int,appointment_date date,status varchar(50));
       
insert into appointments(patient_id,doctor_id,appointment_date,status) 
values(1,1,"2025-10-20","Completed"),
      (2,2,"2025-10-21","Scheduled"),
      (3,3,"2025-10-22","Completed"),
      (4,4,"2025-10-25","Scheduled"),
      (5,5,"2025-10-18","Cancelled");
      
select *from appointments;

create table room(room_id int auto_increment primary key,room_type varchar(50),price_per_day int);

insert into room(room_type,price_per_day)
values ("General Ward",1500),
       ("Private Room",3000),
       ("ICU",7500),
       ("General Ward",1500),
       ("ICU",7500);
       
select *from room;   

-- 1.    
select *from patients;

-- 2.
select (name) from doctors;

-- 3.
select *from patients
where gender = "female";

-- 4.
select *from patients
where city = "Delhi";

-- 5.
select p.first_name,p.last_name,a.status 
from appointments a
join patients p on a.patient_id = p.patient_id;

-- 6.
select name,phone from doctors;

-- 7.
select *from patients
where age > 30;

-- 8.
select  appointment_date from appointments;

-- 9.
select room_type from room;

-- 10.
select department_name from departments;

-- where and logical operators.:-
-- 1.
select *from patients 
where gender = "male";

-- 2.
select *from patients
where age < 50 and age > 25;
-- where age between 25 and 50;

-- 3.
select *from doctors 
where specialization = "Cardiologist";

-- 4.
select *from appointments
where status = "Scheduled";

-- 5.
select *from patients
where city != "Chennai";

-- Order by.:-
-- 1.
select *from patients
order by first_name ;

-- 2.
select *from doctors
order by specialization;

-- 3.
select *from room
order by price_per_day desc;

-- 4.
select *from appointments 
order by appointment_date;

-- 5.
select *from patients
order by age ;

-- Aggregate Functions.:-
-- 1.
select count(*) from patients;

-- 2.
select count(*) from patients
where gender = "female";

select count(*) from patients
where gender = "male";

-- 3.
select max(price_per_day) from room;
 
-- 4.
select min(age) from patients;

-- 5.
select avg(price_per_day)from room;

-- Group by:-
-- 1.
select specialization,count(*)from doctors
group by specialization;

-- 2.
select city, count(*)as total_patients from patients
group by city;

-- 3.
select status,count(*) from appointments
group by status;

-- 4.
select price_per_day ,count(*)from room
group by price_per_day;

-- 5.
select specialization,count(*)from doctors
group by specialization;

-- Join Queries:-
-- 1.
SELECT 
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    d.name AS doctor_name
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;

-- 2.
select 
    a.appointment_date,
    d.specialization
FROM appointments a
JOIN doctors d ON a.doctor_id = d.doctor_id;

-- 3.Show patient city along with assigned doctor.
SELECT p.city,
       d.name AS doctor_name
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id;


-- 4.List all doctors with department names.
SELECT d.name AS doctor_name,
       dept.department_name
FROM doctors d
JOIN departments dept
     ON LEFT(d.specialization, 4) = LEFT(dept.department_name, 4)
     OR (d.specialization = 'Surgeon' AND dept.department_name = 'General Surgery');

-- 5.Display appointment status along with patient full name.
SELECT CONCAT(p.first_name, ' ', p.last_name) AS full_name,
       a.status
FROM appointments a
JOIN patients p
     ON a.patient_id = p.patient_id;
     
     
-- Advanced join:-
-- 1.Show only completed appointments with doctor & patient name.
SELECT 
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    d.name AS doctor_name,
    a.status
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
WHERE a.status = 'Completed';

-- 2.List department names with doctors working in them.


-- 3.Show all cancelled appointments with patient details.
SELECT 
    a.appointment_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    p.age,
    p.gender,
    p.city,
    a.appointment_date,
    a.status
FROM appointments a
JOIN patients p
    ON a.patient_id = p.patient_id
WHERE a.status = 'Cancelled';

-- 4.Show appointments for patients older than 35 years.
SELECT 
    a.appointment_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    p.age,
    p.gender,
    p.city,
    a.appointment_date,
    a.status,
    d.name AS doctor_name
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
WHERE p.age > 35;

-- 5.Retrieve doctor phone number for each appointment.
SELECT 
    a.appointment_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    a.appointment_date,
    a.status,
    d.name AS doctor_name,
    d.phone AS doctor_phone
FROM appointments a
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN patients p ON a.patient_id = p.patient_id;

-- Subqueries:-
-- 1.Find patient(s) assigned to cardiologist.
SELECT 
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    p.age,
    p.gender,
    p.city,
    d.name AS doctor_name,
    d.specialization,
    a.appointment_date,
    a.status
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
WHERE d.specialization = 'Cardiologist';

-- 2.Retrieve doctor details having scheduled appointments.
SELECT DISTINCT 
    d.doctor_id,
    d.name AS doctor_name,
    d.specialization,
    d.phone
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
WHERE a.status = 'Scheduled';

-- 3.Show room type with the maximum price.
SELECT room_type, price_per_day
FROM room
WHERE price_per_day = (SELECT MAX(price_per_day) FROM room);

-- 4.Count doctors in the department with highest staff.
SELECT department_name, COUNT(*) AS doctor_count
FROM (
    SELECT 
        d.name AS doctor_name,
        CASE
            WHEN d.specialization = 'Cardiologist' THEN 'Cardiology'
            WHEN d.specialization = 'Neurologist'  THEN 'Neurology'
            WHEN d.specialization = 'Orthopedic'   THEN 'Orthopedics'
            WHEN d.specialization = 'Pediatrician' THEN 'Pediatrics'
            WHEN d.specialization = 'Surgeon'      THEN 'General Surgery'
        END AS department_name
    FROM doctors d
) AS dept_doctors
GROUP BY department_name
ORDER BY doctor_count DESC
LIMIT 1;

-- Mixed Concept Questions:-
-- 1.Display patient name, age, doctor name & appointment date.
SELECT 
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    p.age,
    d.name AS doctor_name,
    a.appointment_date
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;

-- 2.Show total appointments done by each doctor (JOIN + GROUP BY).
SELECT 
    d.name AS doctor_name,
    COUNT(a.appointment_id) AS total_appointments
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.name;

-- 3.List unique room types available.
select distinct room_type
from room;

-- 4.Find number of appointments per status for each doctor.
SELECT 
    d.name AS doctor_name,
    a.status,
    COUNT(a.appointment_id) AS total_appointments
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.name, a.status;


-- 5.Display department-wise doctor count ordered by count desc.
SELECT 
    CASE
        WHEN d.specialization = 'Cardiologist' THEN 'Cardiology'
        WHEN d.specialization = 'Neurologist'  THEN 'Neurology'
        WHEN d.specialization = 'Orthopedic'   THEN 'Orthopedics'
        WHEN d.specialization = 'Pediatrician' THEN 'Pediatrics'
        WHEN d.specialization = 'Surgeon'      THEN 'General Surgery'
    END AS department_name,
    COUNT(*) AS doctor_count
FROM doctors d
GROUP BY department_name
ORDER BY doctor_count DESC;



