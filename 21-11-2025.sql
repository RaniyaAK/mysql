create database practical;
use practical;

-- 1.
create table departments (dept_id int primary key,
                          dept_name varchar(30));
                          
-- 3.                          
insert into departments(dept_id,dept_name)
values(1,"HR"),
	  (2,"IT"),
	  (3,"Finance");
      
-- 2.    
create table employees (emp_id int primary key,emp_name varchar (30),salary int,dept_id int,join_date date);

-- 4.
insert into employees(emp_id,emp_name,salary,dept_id,join_date)
values(101,"Alice",75000,2,"2022-04-10"),
	  (102,"Bob",60000,1,"2019-12-20"),
	  (103,"Charlie",82000,3,"2021-06-15"),
	  (104,"David",55000,2,"2020-08-05"),
	  (105,"Eva",90000,3,"2023-02-25");
 
 -- 5.
select emp_name,salary from employees;

-- 6.
select emp_name from employees
where salary > 60000;

-- 7.
select emp_name from employees
where join_date > "2021-01-07";

-- 8.
select *from employees
where dept_id = 2;

-- 9.
select emp_name from employees
where emp_name like "A%";

-- 10.
select *from employees;
update employees
join departments
on departments.dept_id = employees.dept_id
set employees.salary = employees.salary*1.10
where departments.dept_name = "HR"
and employees.emp_id > 0;

-- 11.
set sql_safe_updates=0;
select *from employees;

update employees
set dept_id = 3
where employees.emp_id = 102;

-- 12.
select *from employees;
delete from employees
where join_date < "2020-01-01"
and emp_id > 0;

-- 13.
select *from employees;
delete from employees
where emp_id = 104;

-- 14.
select *from employees;
update employees
set salary = salary + 5000
where dept_id = 2
and emp_id > 0;

-- 15.
select sum(salary )from employees;

-- 16.
SELECT departments.dept_name, AVG(employees.salary)
FROM employees 
JOIN departments
ON employees.dept_id = departments.dept_id
GROUP BY departments.dept_name;

-- 17.
select max(salary) from employees;

-- 18.
select count(*) from employees;

-- 19.
select min(salary) from employees
where dept_id = 2;

-- 20.
select d.dept_name, COUNT(e.emp_id)
from employees e
JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- 21.
select employees.emp_name, departments.dept_name
from employees
join departments
on departments.dept_id = employees.dept_id;

-- 22.
select employees.emp_name, departments.dept_name 
from departments
left join employees
on departments.dept_id = employees.dept_id;

-- 23.
select employees.emp_name, departments.dept_name 
from departments
right join employees
on departments.dept_id = employees.dept_id;

-- 24.
select employees.emp_name, departments.dept_name 
from departments
left join employees
on departments.dept_id = employees.dept_id
union
select employees.emp_name, departments.dept_name 
from departments
right join employees
on departments.dept_id = employees.dept_id;

-- 25.
SELECT 
    d.dept_name
FROM departments d
LEFT JOIN employees e
    ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;

-- 26.
select emp_name
from employees
where salary > (select avg (salary) from employees);

-- 27.
select emp_name ,salary
from employees
where salary = (select max(salary) from employees);

-- 28.
select
    emp_name,
    salary,
    dept_id
from employees
where dept_id in (
    select dept_id 
    from departments
    where dept_name in ('IT', 'HR')
);

-- 29.
select emp_name from employees
where dept_id = (
    select dept_id
    from departments
where dept_name = "finance"
);

-- 30.
select dept_name from departments
where 60000 < (
select  max(salary) from employees
where dept_id = dept_id);












