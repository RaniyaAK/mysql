SELECT version();
create table students(id serial primary key,name varchar(50),age int,email varchar(100));
insert into students (name,age,email) values ('fella', 20,'fella@gmail.com')
select *from students
SELECT name, age, email FROM students;
