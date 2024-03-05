-- UC1
CREATE DATABASE IF NOT EXISTS payroll_service_database;
use payroll_service_database;
-- UC2
create table employee_payroll (
id int auto_increment,
name varchar(50) ,
salary int ,
start_date date, 
primary key (id)
);
-- UC3 
select* from  employee_payroll;
insert into employee_payroll (id , name , salary , start_date) values (1,'Sahil', 35000, '2020-05-22'), (2, 'Casey',40000, '2019-06-01'), (3, 'Bill', 50000, '2020-05-01');
-- UC4
select * from employee_payroll;
-- UC5
select salary from employee_payroll where name = 'Bill';
select * from employee_payroll where start_date between cast('2020-05-01' as date) and date(now());
-- UC6
alter table employee_payroll
add column gender varchar(10) after name ;
SET SQL_SAFE_UPDATES = 0;

update employee_payroll 
set gender = 'M' where name = 'Sahil' or name = 'Bill' ;
update employee_payroll 
set gender = 'F' where name ='Casey';
-- UC7
select gender , sum(salary) from employee_payroll group by gender;
select gender , avg(salary) from employee_payroll group by gender;
select gender , min(salary) from employee_payroll group by gender;
select gender , max(salary) from employee_payroll group by gender;
select gender , count(name) from employee_payroll group by gender;
--  UC8
alter table employee_payroll
add column empphone varchar(20),
add column empadd varchar(100) default 'temp',
add column dept varchar(20) not null;
select * from employee_payroll;
-- UC9
alter table employee_payroll
add column basicpay int , 
add column deduction int , 
add column tax int , 
add column incometax int ,
add column netpay int ;
-- UC10 
update employee_payroll
set empphone = '9082', dept = 'CS', basicpay = '5000', deduction = 500, tax = 500, incometax = 200, netpay = 5000
where name = 'Sahil';
update employee_payroll
set empphone = '9032', dept = 'IT', basicpay = '15000', deduction = 5500, tax = 5500, incometax = 1200, netpay = 15000
where name = 'Casey';
update employee_payroll
set empphone = '90032',empadd = 'xyz', dept = 'Teaching', basicpay = '1500', deduction = 5500, tax = 5500, incometax = 1200, netpay = 15000
where name = 'Bill';
select * from employee_payroll;
insert into employee_payroll (name , gender , salary , start_date , empphone , empadd, dept , basicpay, deduction, tax , incometax , netpay) values (
'Terissa', 'F', 56000, '2015-04-01', '9632', 'tttt', 'Marketing', 4000, 5000,500,600,4500);
-- UC11 
create table employee_department (
emp_id int not null ,
foreign key(emp_id) references employee_payroll(id),
dept_id int not null );
select * from employee_department;
insert into employee_department (emp_id , dept_id ) values (
1, 101),(2, 102), (3, 103), (4, 104);

-- UC12 
select * from employee_department ; 

SELECT a.dept_id, SUM(e.salary) AS total_salary
FROM employee_payroll AS e 
RIGHT JOIN employee_department AS a ON e.id = a.emp_id 
GROUP BY a.dept_id;

select e.gender , avg(e.salary)
from employee_payroll as e 
left join employee_department as a on e.id = a.emp_id 
group by e.gender;

select e.gender , max(e.salary)
from employee_payroll as e 
right join employee_department as a on e.id = a.emp_id 
group by e.gender;

select e.gender , count(e.name)
from employee_payroll as e 
left join employee_department as a on e.id = a.emp_id 
group by e.gender;

select * from employee_payroll;
select* from employee_department;