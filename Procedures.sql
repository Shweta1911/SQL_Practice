-- Procedure is a collection of pre-compiled SQL statements stored inside the database

create database new_demo;
use new_demo;

create table Student(
id int primary key,
fullName varchar(25),
age int);

insert into Student values 
(1,"Shweta",22),
(2,"Anam",21),
(3,"Vaishnavi",23),
(4,"Sneha",21);

select * from Student;

DELIMITER &&
CREATE PROCEDURE DEMO()
BEGIN
SELECT fullName FROM Student;
end &&

call DEMO();

CREATE TABLE allstudents (
  id INT NOT NULL,
  fullName VARCHAR(45) NULL,
  age INT NULL,
  address VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  contactNo VARCHAR(10) NULL,
  PRIMARY KEY (id));
  
  insert into allstudents values 
  (1,"Shweta",22,"Miraj","shweta@gmail.com","9372890463"),
  (2,"Anam",21,"Sundarnagar","anam@gmail.com","9372890463"),
  (3,"Sneha",21,"Bhramanpuri","sneha@gmail.com","9372890463"),
  (4,"Vaishnavi",23,"Datta Colony","vaish@gmail.com","9372890463"),
  (5,"Gourav",22,"Malgaon Road","gourav@gmail.com","9372890463"),
  (6,"Harish",22,"Subhashnagar","harish@gmail.com","9372890463"),
  (7,"Tabbasum",22,"Umraj","tabbu@gmail.com","9372890463"),
  (8,"Pranoti",20,"Gotkhindi","pranoti@gmail.com","9372890463"),
  (9,"Mayuri",20,"Pune","mayuri@gmail.com","9372890463"),
  (10,"Sonali",22,"Umraj","soni@gmail.com","9372890463");

select * from allstudents;

DELIMITER &&
create procedure displayStud()
begin
select fullName,address,email from allstudents;
select id,fullName,count(fullName) as totalCount where age=22;
end &&

CALL displayStud();

drop procedure displayStud;

DELIMITER &&
create procedure displayStud()
begin
select fullName,address,email from allstudents;
select id,fullName,count(fullName) as totalCount from allstudents where age=22;
end &&

call displayStud();

SELECT COUNT(fullName) as total, age
FROM allstudents
GROUP BY age
ORDER BY COUNT(fullName) DESC;

drop procedure displayStud;

DELIMITER &&
create procedure displayStud()
begin
select fullName,address,email from allstudents;
SELECT COUNT(fullName) as total, age
FROM allstudents
GROUP BY age
ORDER BY COUNT(fullName) DESC;
end &&

call displayStud();