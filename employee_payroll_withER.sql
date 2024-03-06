use payroll_service;
create table department(
deptid int not null,
deptname varchar(50),
primary key (deptid)
);
insert into department (deptid, deptname)
 values (1,'Accounts'),(2, 'CS'), (3, 'Management'), (4, 'HR'), (5, 'Finance');
select * from department;
create table comapny (
compid int not null,
comapanyname varchar(50) ,
primary key(compid)
);
alter table comapny rename to company;
insert into company (compid , comapanyname) 
values (1, 'Hexaware'), (2, 'Infosys'), (3, 'TCS'), (4,'Mahindra');

create table payroll (
fname varchar(50) not null,
salary varchar(50),
tax varchar(50),
netpay varchar(50),
primary key (fname)
);
insert into payroll (fname , salary , tax , netpay)
 values ('Sahil','50000','2500', '45000'), ('Prajwal', '55000', '600', '50000'), ('Pranav', '60000', '400', '55000');
 select * from payroll;
 
 create table employeedata (
 id int not null auto_increment,
 fname varchar(50),
 lastname varchar (50),
 address varchar(50), 
 deptid int ,
 compid int, 
 primary key (id),
 foreign key (fname) references payroll(fname),
 foreign key (deptid) references department(deptid),
 foreign key (compid) references company(compid)
 );
 select * from employeedata;
 insert into employeedata (fname, lastname, address, deptid, compid)
 values ('Sahil', 'Khandekar', 'xyz',2 , 1), ('Prajwal', 'Thete', 'abc', 4, 3), ('Pranav', 'Goyal', 'efg', 1, 1); 
 
 select * from employeedata as e 
right join payroll as d 
 on e.fname = d.fname;
 
 create table employee_department (
    id INT NOT NULL AUTO_INCREMENT,
    employee_id int,
    department_id int,
    primary key (id),
    foreign key (employee_id) REFERENCES employeedata(id),
    foreign key (department_id) REFERENCES department(deptid)
);
select * from employee_department;
insert into employee_department (employee_id , department_id ) values (1, 2), (3, 1), (2,4);