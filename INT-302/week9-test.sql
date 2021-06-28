select first_name || ' ' || last_name,
to_char(salary,'99,999') salary,
e.job_id, job_title
from employees e join jobs j
on e.job_id = j.job_id
where salary > (select avg(salary) 
                from employees)
and job_title not like '%t%';

create table CUSTOMER 
( CUST_NO    number(5)    primary key,
  name       char(20)     not null,
  address    varchar2(40) not null,
  dob        date,
  id_card_no number(13)   unique,
  cust_type  char(1)      check(cust_type in ('A','B','C'))
);

create table order1
( ord_no     number(5)      primary key,
  ord_date   date           default sysdate not null,
  amount     number(9,2)    not null,
  cust_no    number(5)      references CUSTOMER(CUST_NO)
);

create table suppliers
( sup_id    number(5)       primary key,
  sup_name  varchar2(20)    not null,
  address   varchar2(30)    not null
);

create table customers
( id        number(6)       primary key,
  c_name    varchar(15)     not null,
  age       number(2)       not null
);

create table depts
( dep_id    number(4)       primary key,
  emp_name  varchar(15)     not null,
  salary    number(7,2)     not null
);

create table emps
( emp_id    number(5)       primary key,
  emp_name  varchar(15)     not null,
  salary    number(7,2)     not null,
  dep_id    number(4)       references depts(dep_id)
);

CREATE TABLE dept80
AS SELECT employee_id, last_name,
    salary,hire_date
    FROM employees
    WHERE department_id = 80;
    
select * from dept80;

create table SALES_REPS (id,name,salary,commision)
as select EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT
    from employees
    where job_id = 'SA_REP';
    
select * from sales_reps;

ALTER TABLE dept80
ADD (fname char(30));

ALTER TABLE dept80
DROP COLUMN fname;

desc dept80;

ALTER TABLE customers
ADD (address varchar2(50),
salary number(10,2)
);

ALTER TABLE dept80
MODIFY (surname char(30));

desc dept80;

ALTER TABLE dept80
MODIFY (last_name char(30));

ALTER TABLE customers
RENAME COLUMN id to cus_id;

ALTER TABLE customers RENAME TO contacts;

ALTER TABLE sales_reps
ADD CONSTRAINT emp_id_pk PRIMARY KEY(id);

desc sales_reps;

ALTER TABLE sales_reps
ADD CONSTRAINT emp_dept_id_fk
FOREIGN KEY(id) REFERENCES depts(dep_id);

desc depts;

drop table suppliers;
drop table sales_reps;
drop table dept;
drop table dept80;
drop table contacts;
drop table depts;
drop table emps;
drop table customer;
drop table order1;

--Practice #1
CREATE TABLE depts
( dept_id number(10) not null,
dept_name varchar2(50) not null,
PRIMARY KEY(dept_id)
);

alter table depts
rename to department;

drop table department;
