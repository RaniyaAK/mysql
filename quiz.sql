create database sp;
use sp;

-- 1.
create table users(user_id int auto_increment primary key,username varchar(50),email varchar(100));

insert into users (username,email)
values ("aishu","aisha@gmail.com"),
       ("faathi","fathima@gmail.com"),
	   ("jaasmi","jasmin@gmail.com");
       
delimiter //
create procedure ShowAllUsers()
begin 
select *from users;
end //
delimiter ;

call ShowAllUsers ();

-- 2.
create table quiz (quiz_id int auto_increment primary key,quiz_title varchar(100), total_questions int);

delimiter //
create procedure AddQuiz(
    in p_quiz_title varchar(100),
	in p_total_questions int
)
begin
   insert into quiz (quiz_title, total_questions)
    values (p_quiz_title, p_total_questions);
end //
delimiter ;

call AddQuiz("python",2);
call AddQuiz ("html",3);
call AddQuiz ("css",2);

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
create procedure CountQuestions(
                 in p_quiz_id int
)
begin
select count(*) 
from  questions
where quiz_id =p_quiz_id;
end //
delimiter ;

call CountQuestions(3);

select *from questions;

-- 4.
create table user_answers(answer_id int auto_increment primary key,user_id int,question_id int,selected_option_id int);
create table options (option_id int auto_increment primary key,question_id int,option_text varchar (255),is_correct boolean);

insert into options(question_id, option_text, is_correct)
values
(1, "function", FALSE),
(1, "def", TRUE),
(1, "fun", FALSE),
(1, "define", FALSE),

(2, "4", FALSE),
(2, "6", FALSE),
(2, "5", TRUE),
(2, "7", FALSE),

(3, "image", FALSE),
(3, "img", TRUE),
(3, "pic", FALSE),
(3, "src", FALSE),

(4, "link", FALSE),
(4, "src", FALSE),
(4, "href", TRUE),
(4, "goto", FALSE),

(5, "break", FALSE),
(5, "lb", FALSE),
(5, "br", TRUE),
(5, "hr", FALSE),

(6, "#", FALSE),
(6, "@", FALSE),
(6, ".", TRUE),
(6, "*", FALSE),

(7, "px", FALSE),
(7, "cm", FALSE),
(7, "em", TRUE),
(7, "inch", FALSE);

insert into user_answers(user_id, question_id, selected_option_id)
values
(1, 1, 2), 
(1, 2, 7), 
(1, 3, 10), 
(1, 4, 12), 
(1, 5, 15), 
(1, 6, 16), 
(1, 7, 17), 

(2, 1, 2),
(2, 2, 7),
(2, 3, 10),
(2, 4, 12),
(2, 5, 14),
(2, 6, 18),
(2, 7, 20),

(3, 1, 2),
(3, 2, 7),
(3, 3, 10),
(3, 4, 14),
(3, 5, 14),
(3, 6, 18),
(3, 7, 27);

delimiter //
create procedure CalculateUserScore()
begin
    SELECT u.username, COUNT(*) AS total_correct
    FROM user_answers ua
    JOIN options o
      ON ua.selected_option_id = o.option_id
    JOIN users u
      ON ua.user_id = u.user_id
    WHERE o.is_correct = TRUE
    GROUP BY u.user_id, u.username;
end //
delimiter ;

select *from options;
select *from user_answers;

call CalculateUserScore();

-- drop table quiz;
-- drop table options;
-- drop table user_answers;
-- drop table users;
-- drop table questions;

-- drop procedure CalculateUserScore;
-- drop procedure ShowAllUsers;
-- drop procedure AddQuiz;
-- drop procedure CountQuestions;

-- 5.


delimiter //
create procedure TopPerformers()
begin
    SELECT u.username, COUNT(*) AS total_correct
    FROM user_answers ua
    JOIN options o
      ON ua.selected_option_id = o.option_id
    JOIN users u
      ON ua.user_id = u.user_id
    WHERE o.is_correct = TRUE
    GROUP BY u.user_id, u.username
    ORDER BY total_correct DESC
    LIMIT 2;
end //
delimiter ;

call TopPerformers();

-- 6.
create table user_log(log_id int auto_increment primary key,user_id int,activity varchar (100),log_time timestamp default current_timestamp)

delimiter //
create trigger after_answer_insert
AFTER INSERT ON user_answers
FOR EACH ROW
BEGIN
    INSERT INTO user_log(user_id, activity)
    VALUES (NEW.user_id, 'Submitted an answer');
end //
delimiter ;

insert into user_answers(user_id, question_id, selected_option_id)
values (4, 3, 10);

select *from user_log

-- 7.
delimiter //
create trigger before_user_insert

BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    -- Check if the email already exists
    IF (SELECT COUNT(*) FROM users WHERE email = NEW.email) > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Email already exists. Duplicate emails are not allowed.';
    END IF;
    
end //
delimiter ;

insert into users(username,email)
values("new_user","aisha@gmail.com");

-- 8.
delimiter //
create trigger after_question_insert

AFTER INSERT ON questions
FOR EACH ROW

BEGIN
    UPDATE quiz
    SET total_questions = total_questions + 1
    WHERE quiz_id = NEW.quiz_id;

end //
delimiter ;

insert into questions(quiz_id,question_text)
values(1,"Which operator is used for floor division in Python?");

call CountQuestions(2)

-- 9.
delimiter //
create trigger after_question_delete

AFTER DELETE ON questions
FOR EACH ROW

BEGIN
    DELETE FROM options
    WHERE question_id = OLD.question_id;

end //
delimiter ;

set sql_safe_updates = 0;
delete from questions
where question_id = 5;

select *from questions




