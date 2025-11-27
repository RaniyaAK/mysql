create database my_trigger;
use my_trigger;

-- 1.
create table employee_log(log_id int auto_increment primary key,
						  emp_id int,action varchar(50),
						  log_time datetime
);

create table employees(employee_id INT AUTO_INCREMENT PRIMARY KEY,
						name VARCHAR(100),
						salary DECIMAL(10,2),
						department VARCHAR(50)
);


-- 2.
delimiter //
create procedure addemployee(in emp_name VARCHAR(100),
							 in emp_salary DECIMAL(10,2),
							 in emp_dept VARCHAR(50)
)
begin 
	insert into employees(name,salary,department)
	values(emp_name, emp_salary, emp_dept);
end //
delimiter ;
        
-- 3.
delimiter //
create trigger after_employee_insert
after insert on employees
for each row
begin
insert into employee_log (emp_id, action, log_time)
values (NEW.employee_id, 'INSERTED', NOW());
end //
delimiter ;

-- 4.
call addemployee('john doe',55000,'HR');

-- 5.
select *from employees;
select *from employee_log;

show triggers

        

                        