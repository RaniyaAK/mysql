create database sp;
use sp;

-- 1.
create table users(user_id int auto_increment primary key,username varchar(50),email varchar(100));

insert into users (username,email)
values ("aishu","aisha"),
       ("faathi","fathima"),
	   ("jaasmi","jasmin");
       
       
delimiter //
create procedure showallusers()
begin 
select *from users;
end //
delimiter ;

call showallusers ();

-- update users
-- set username= "aaisha"
-- where user_id= 1;

-- update users
-- set username = "fathima"
-- where user_id = 2;

-- update users 
-- set username = "yaasmin"
-- where user_id = 3;

-- update users
-- set email = case
-- 	when user_id = 1 then "aaisha@gmail.com"
-- 	when user_id = 2 then "fathima@gmail.com"
-- 	when user_id = 3 then "yaasmim@gmail.com"
-- end
-- where user_id in (1,2,3);

-- update users 
-- set email = "yaasmin@gmail.com"
-- where user_id = 3;


-- 2.
create table quiz (quiz_id int auto_increment primary key,quiz_title varchar(100), total_questions int);

delimiter //
create procedure addquiz(
    in p_quiz_title varchar(100),
	in p_total_questions int
)
begin
   insert into quiz (quiz_title, total_questions)
    values (p_quiz_title, p_total_questions);
end //
delimiter ;


call addquiz("python",2);
call addquiz ("html",3);
call addquiz ("css",2);

select *from quiz;

-- 3.
create table questions(question_id int auto_increment primary key,quiz_id int,question_text varchar(255));

insert into questions(quiz_id,question_text)
values (1,"Which keyword is used to define a function in Python?"),
	   (1,"What is the output of len(\"Hello\")?"),
	   (2,"Which tag is used to insert an image?"),
	   (2,"Which attribute is used for hyperlinks?"),
	   (2,"Which tag is used for line break?"),
	   (3,"Which symbol is used to select a class in CSS?"),
	   (3,"Which unit is relative to the parent element?");

delimiter //
create procedure count_questions(
                 in p_quiz_id int
)
begin
select count(*) 
from  questions
where quiz_id =p_quiz_id;
end //
delimiter ;

call count_questions(3);

select *from questions;

-- 4.
create table user_answers(answer_id int auto_increment primary key,user_id int,question_id int,selected_option_id int);
create table options (option_id int auto_increment primary key,question_id int,option_text varchar (255),is_correct boolean);

insert into user_answers(user_id,question_id,selected_option_id)
values(1,1,2),
	  (1,2,3),
	  (1,3,2),
	  (1,4,3),
	  (1,5,3),
	  (1,6,3),
	  (1,7,3),

insert into options(question_id,option_text,is_correct)
values(1,"function","False"),
	  (1,"def","False"),
	  (1,"fun","False"),
	  (1,"define","False"),
      (2,"",""),
      (2,"",""),
      (2,"",""),
      (2,"",""),
      (3,"",""),
      (3,"",""),
      (3,"",""),
      (3,"",""),
      (4,"",""),
      (4,"",""),
      (4,"",""),
      (4,"",""),
      (5,"",""),
      (5,"",""),
      (5,"",""),
      (5,"",""),
      (6,"",""),
      (6,"",""),
      (6,"",""),
      (6,"",""),
      (7,"",""),
      (7,"",""),
      (7,"",""),
      (7,"",""),

select *from user_answers;

select *from options;
show tables ;
select *from questions




