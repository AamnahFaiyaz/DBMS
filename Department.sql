REM   Script: Department table
REM   Creating, altering, updating and deleting records in department table

create table employee(emp_no number, emp_name varchar2(10), job varchar2(10), mgr number, salary number);

alter table employee 
add commission number;

insert into employee 
values('101', 'Karan', 'CEO', '200', '20000', '1000');

insert into employee 
values('102', 'Ram', 'Manager', '100', '9000', '500');

insert into employee 
values('103', 'Kiran', 'Leader', '100', '9500', '600');

drop table employee;

create table employee(e_no number primary key, e_name varchar2(10), job varchar2(10), mgr number, salary number);

Alter table employee 
add commission number;

insert into employee 
values('101', 'Karan', 'CEO', '400', '20000', '1000');

insert into employee 
values('102', 'Kiran', 'trainer', '200', '9000', '500');

insert into employee 
values('103', 'Ram', 'sweeper', '100', '7000', '50');

insert into employee 
values('104', 'Raj', 'HR', '200', '9500', '500');

insert into employee 
values('105', 'Shweta', 'Manager', '200', '9000', '500');

select * from employee;

Update employee 
set job = 'Trainee' 
where e_no = '103';

Alter table employee 
rename column mgr to mgr_no;

delete from employee 
where e_no = '105';

select * from employee;

create table department(dept_no number primary key, dept_name varchar2(10), dept_loc varchar2(10));

alter table department 
add designation varchar2(10);

Insert into department 
values('1', 'Finance', 'A-Block', 'Manager');

Insert into department 
values('2', 'Marketing', 'B-Block', 'Trainer');

Insert into department 
values('3', 'IT', 'C-Block', 'HR');

Insert into department 
values('9', 'Sales', 'D-Block', 'Leader');

update department 
set designation = 'Accountant' 
where dept_no = '9';

delete from department 
where column = 'dept_loc';

