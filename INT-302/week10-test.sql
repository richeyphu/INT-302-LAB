INSERT INTO departments (department_id,department_name)
VALUES (31,'Purchasing');

INSERT INTO employees (employee_id,
                first_name,last_name,
                email, phone_number,
                hire_date,job_id,salary,
                commission_pct,manager_id,
                department_id)
VALUES          (113,
                'Louis', 'Popp',
                'LPOPP', '515.124.4567',
                SYSDATE , 'AC_ACCOUNT',6900,
                NULL, 205, 110);

SELECT employee_id,last_name,job_id,hire_date,
        commission_pct
FROM employees
WHERE employee_id = 113;

INSERT INTO departments
                (department_id,department_name,location_id)
VALUES (&department_id,'&department_name',&location_id);

SELECT *
FROM departments;

delete from departments
where department_id = 280;

drop table contacts;
drop table contacts_bkp;

create table contacts
(id number(1) primary key,
name varchar2(15) not null,
age number(2),
address varchar2(20),
salary number(7,2));

desc contacts;

select *
from contacts;

insert into contacts
values (1,'Ramesh',35,'Ahmedabad',2000.00);
insert into contacts
values (2,'Khilan',25,'Delhi',1500.00);
insert into contacts
values (3,'kaushik',23,'Kota',2000.00);
insert into contacts
values (4,'Chaitali',25,'Mumbai',6500.00);
insert into contacts
values (5,'Hardik',27,'Bhopal',8500.00);
insert into contacts
values (6,'Komal',22,'MP',4500.00);
insert into contacts
values (7,'Muffy',24,'Indore',10000.00);

drop table department;

create table department
(dep_id number(4),
dep_name varchar2(30)
);

insert into department
    select department_id, department_name
    from departments
    where manager_id is not null;
    
select *
from department;

create table contacts_bkp
as select * from contacts;

select *
from contacts_bkp;

select *
from contacts
where id in(select id
            from contacts_bkp
            where salary>4500);
            
update employees
set phone_number = (select phone_number
                    from employees
                    where employee_id = 205),
    salary = (select salary
                    from employees
                    where employee_id = 205)
where employee_id = 113;

rollback;

update contacts
set salary = salary * 0.25
where age in (select age
              from contacts_bkp
              where age >= 27);
              
delete from contacts
where age in (select age
              from contacts_bkp
              where age >= 27);

select * from contacts;

truncate table contacts_bkp; --cannot rollback
select * from contacts_bkp;

drop table orders;
drop table customer;
drop table product;
