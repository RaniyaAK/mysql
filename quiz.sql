create database sp;
use sp;

-- 1.
create table users(user_id int auto_increment primary key,username varchar(50),email varchar(100));

insert into users (username,email)
values ("aishu","aisha"),
       ("faathi","fathima");
       
delimiter //
create procedure showallusers()
begin 
select *from users;
end //
delimiter ;

call showallusers ();

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

call addquiz('GK',50);

select *from quiz;

-- 3.
create table questions(question_id int auto_increment primary key,quiz_id int,question_text varchar(255));

insert into questions (quiz_id,question_text)
values (1, 'What is MySQL?'),
	   (1, 'What is PostgreSQL?'),
	   (2, 'What is HTML?');
       
delimiter //
create procedure count_questions(
                 in p_quiz_id int
)
begin
select count(*) 
from  questions
where quiz_id =p_quiz_id
;
end //
delimiter ;

call count_questions(2);

select *from questions;

-- 4.
create table user_answers(answer_id int auto_increment primary key,user_id int,question_id int,selected_option_id int);
create table options (option_id int auto_increment primary key,question_id int,option_text varchar (255),is_correct boolean);

insert into user_answers(user_id,question_id,selected_option_id)
values(1,1);
