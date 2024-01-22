-- A trigger is a stored procedure in a database that automatically invokes whenever a special event in the database occurs
use new_demo;

DELIMITER //  
Create Trigger before_insert_stud   
BEFORE INSERT ON allstudents FOR EACH ROW  
BEGIN  
IF NEW.contactNo ="" THEN SET NEW.contactNo = "0000000000";  
END IF;  
END //  

insert into allstudents value (11,"Rohit",21,"Pune","rohit@gmail.com","");

select * from allstudents;

DELIMITER //
CREATE TRIGGER after_insert_allstudents
AFTER INSERT ON allstudents
FOR EACH ROW
BEGIN
    insert into student values (new.id,new.fullName,new.age);
END //

insert into allstudents value (12,"Shraddha",21,"Warje","shraddha@gmail.com","2809240890");

select * from student;

DELIMITER //
CREATE TRIGGER before_update_allstudents
BEFORE UPDATE ON allstudents
FOR EACH ROW
BEGIN
    IF NEW.age<0 then set new.age=19;
    end if;
END //

update allstudents set age=-20 where id=1;

select * from allstudents;

create table updated_stud(
fullName varchar(25),
dateU date);

DELIMITER //
CREATE TRIGGER after_update_allstudents
after UPDATE ON allstudents
FOR EACH ROW
BEGIN
    INSERT INTO updated_stud values(new.fullName,now());
END //

update allstudents set age=-20 where id=1;

select * from updated_stud;

create table deleted_stud(
fullName varchar(25),
age int,
dateU date);


DELIMITER //
CREATE TRIGGER after_delete_allstudents
after delete ON allstudents
FOR EACH ROW
BEGIN
    INSERT INTO deleted_stud values(old.fullName,old.age,now());
END //

delete from allstudents where id=12;

select * from deleted_stud;

CREATE INDEX Contacts_new ON allstudents (email,contactNo);
