SELECT * FROM employee;
use product;
-- inserting values in table
insert into employee(empID,empName,empDept) values(1,'Arun','testing');
insert into employee(empID,empName,empDept)values(2,'pavi','developer');
insert into employee(empID,empName,empDept,empAge,empCity,empTeam)values(3,'pavi','developer',23,'salem','ES'),(4,'sadhana','developer',33,'erode','Ias');
insert into employee(empID,empName,empDept,empAge,empCity,empTeam)values(5,'renu','developer',23,'chennai','TN'),(6,'arul','developer',33,'erode','TN');

-- adding column to existing table
alter table employee
add column empAge int;

alter table employee
add column empCity varchar(20);

alter table employee
add column empTeam varchar(20);

-- adding new values for previous one
update employee
set empAge=23 where empID=1;

update employee
set empAge=26 where empID=2;

update employee
set empCity= 'chennai' where empId=1;

update employee
set empCity= 'chennai' where empId=2;

update employee
set empTeam='TN' where empId=1;

update employee 
set empTeam='ES'where empId=2;

update employee
set empName='kavitha',empDept='support',empAge='40',empCity='France',empTeam='TN' where empId=2;



-- stored procedure
DELIMITER //
CREATE PROCEDURE getDetails(IN emp_ID INT)
BEGIN
SELECT empName,empAge from employee where empID=emp_ID;
END //
DELIMITER ;

call getDetails(1);
drop procedure getDetails;

-- VIEWS
CREATE VIEW EmpCity_Details AS
select empName where empCity = 'chennai' and  empTeam='TN' ;

select * from EmpCity_Details;
select * from employeeCount;
-- triggers 
create table employeeCount(Counts_of_emp int auto_increment not null,primary key(Counts_of_emp));
drop table employeeCount;
delimiter $$
create trigger autocount after insert
on employee for each row
begin
update employeeCount 
set Counts_of_emp = (select count(*) from employee);
end $$
delimiter ;
insert into employee values(7,'vinu','testing',34,'salem','Ias');
insert into employee values (8,'vinu','testing',34,'Delhi','Ias');
select * from employeeCount;