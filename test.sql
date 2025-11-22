create database test;
use test;
create table department (Dno varchar (20) primary key,
						 Dname varchar(20),
                         MGRENO int);

insert into department (Dno,Dname,MGRENO)
values ("D1","Consulting",1001),
	   ("D2","Devolopment",1002),
       ("D3","Research",1003);
       
create table employee(Eno int,
					  Ename varchar (40),
					  Bdate date,
					  Title varchar(20),
					  Salary int,
					  Dno varchar(20));  
                      

insert into employee (Eno,Ename,Bdate,Title,Salary,Dno)
values (1001,"Alice","1980-03-10","Manager",85000,"D1"),
	   (1002,"Bob","1985-07-14","EE",40000,"D2"),
	   (1003,"Charlie","1990-01-20","SA",37000,"D3"),
	   (1004,"David","1988-09-12","EE",32000,"D4"),
	   (1005,"Eve","1992-11-05","Manager",90000,"D5");
       
create table project(Pno int primary key,
					 Pname varchar (40),
                     Budget int,
                     Dno varchar(20));   

insert into project (Pno,Pname,Budget,Dno)
values (501,"Alpha",12000,"D1"),
	   (502,"Beta",45000,"D2"),
	   (503,"Gamma",75000,"D3"),
	   (504,"Delta",20000,"D1");
       
       
create table workson(Eno int primary key,
                     Pno int,
                     Resp varchar (40),
                     Hours int, 
                     foreign key (Pno) references project (Pno));  

insert into workson (Eno,Pno,Resp,Hours)
values (1001,501,"Manager",15),
	   (1002,502,"Devoloper",8),
	   (1003,501,"Consultant",12),
	   (1004,503,"Tester",9),  
	   (1005,504,"Manager",18); 
       
update employee 
set Dno = "D3"
where Eno = 1004;
       
update employee 
set Dno = "D2"
where Eno = 1005;

ALTER TABLE employee
ADD PRIMARY KEY (Eno);


update project
set Budget = 120000
where Pno= 501;


update project
set Budget = 200000
where Pno= 504;

-- 1.
select Pno,Pname from project
where Budget > 100000 ;

-- 2.
select * from workson
where Hours < 10 and
Resp = "Manager";

-- 3.
select Eno ,Ename from employee
where (Title = "EE" or Title = "SA")
and salary > 35000;

-- 4.
select Ename from employee
where Dno = "D1"
order by salary desc;

-- 5.
select *from department
order by Dname asc;

-- 6.
SELECT 
    employee.ENAME AS employee_name,
    department.DNAME AS department_name,
    employee.TITLE AS employee_title
FROM employee
JOIN department
    ON employee.DNO = department.DNO;
    
-- 7.
select 
project.Pname as project_name,
project.Pno as project_number,
workson.Hours as hours_worked
from project
join workson 
on project.Pno = workson.Pno
where hours >10;
-- 8.
select 
project.Pname as Project_name,
department.Dname as department_name,
project.Budget as budget
from project
join department
on project.Dno = department.Dno
where Budget < 50000;

-- 9.
select 
employee .Eno as Eno,
employee .Ename as Ename,
employee.salary as salary
from employee 
join department
on employee.Dno = department.Dno
where Dname = "consulting"
order by salary desc;

-- 10.
select
employee.Ename ,
employee.Title,
project.Pname,
workson.Hours
from workson 
join employee
on workson.Eno = employee.Eno
join project
on project.Pno = workson.Pno















