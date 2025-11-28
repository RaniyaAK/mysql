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
select (name,status)from patients
where 


drop table appointments

