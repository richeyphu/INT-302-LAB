--table.JPG
create table STUDENT
( stu_num       number(3)     
                primary key,
  stu_name      varchar2(10)
                not null
);

create table CLASS
( class_code    char(5)     
                primary key,
  class_section char(2)
                not null,
  crs_code      char(7)
                not null
);

create table ENROLL
( class_code    char(5)
                references CLASS(class_code),
  stu_num       number(3)
                references STUDENT(stu_num),
  enroll_grade  char(2),
  primary key(class_code, stu_num)
);

insert into STUDENT
values (201,'Somjit');
insert into STUDENT
values (205,'Manee');

select * from STUDENT;

insert into CLASS
values ('P9056','01','int-301');
insert into CLASS
values ('P8020','03','ite-303');
insert into CLASS
values ('P7034','02','jpn-102');

select * from CLASS;

insert into ENROLL
values ('P8020',205,'B+');
insert into ENROLL
values ('P7034',201,'C+');
insert into ENROLL
values ('P9056',205,'A');
insert into ENROLL
values ('P8020',201,'D+');

select * from ENROLL;

---------------------------------------------
--View
drop view dept50;
drop view employees_vu;
drop view ve1;
drop view ve2;

CREATE VIEW emp80
AS SELECT employee_id, last_name,salary
FROM employees
WHERE department_id = 80;

desc emp80;

create view empit
as select employee_id, last_name, job_title
from employees e join jobs j
on e.job_id = j.job_id
where e.job_id = 'IT_PROG';

select * from empit;

CREATE VIEW sal50
  AS SELECT employee_id ID_NUMBER,
            last_name ,
            salary*12 ANN_SALARY
    FROM employees
    WHERE department_id = 50;
    
SELECT * FROM sal50;

create view dept_view("Dep No","Dep Name","Emp Name")
as select d.department_id, department_name, first_name
   from departments d join employees e
   on d.department_id = e.department_id
   where d.department_id = 100;
   
select * from dept_View;

CREATE OR REPLACE VIEW emp80
    (id_number, name, sal, department_id)
AS SELECT employee_id, first_name || ' '
            || last_name, salary, department_id
    FROM employees
    WHERE department_id = 80;
    
select * from emp80;

create or replace view empit(code,"Name",social,"Job Name")
as select employee_id, first_name || last_name, 
0.03 * salary || ' BAHT', job_title
from employees e join jobs j
on e.job_id = j.job_id
where e.job_id in ('ST_CLERK','PU_CLERK');

select * from empit;

CREATE OR REPLACE VIEW dept_sum_vu
(name, minsal, maxsal, avgsal)
AS SELECT department_name, MIN(salary),
MAX(salary),AVG(salary)
FROM employees e,departments d
WHERE e.department_id = d.department_id
GROUP BY department_name;

DESCRIBE dept_sum_vu;
SELECT * FROM dept_sum_vu;

create or replace view job_view("JOB NAME", "AVG SAL", "TOTAL SAL")
as select job_title, to_char(avg(salary),'99,999.99'), to_char(sum(salary),'999,999.99')
from jobs j join employees e
on j.job_id = e.job_id
where job_title like 'P%' or job_title like 'S%'
group by job_title
having sum(salary) > 10000
order by 1;

select * from job_view;

------------------------------------------------
--Sequence
CREATE SEQUENCE dept_deptid_seq
INCREMENT BY 10
START WITH 300
MAXVALUE 9999
NOCACHE
NOCYCLE;

INSERT INTO departments(department_id,
department_name, location_id)
VALUES (dept_deptid_seq.NEXTVAL,
'HR', 1400);

SELECT dept_deptid_seq.CURRVAL FROM dual;

ALTER SEQUENCE dept_deptid_seq
INCREMENT BY 20
MAXVALUE 999999
NOCACHE
NOCYCLE;

INSERT INTO departments(department_id,
department_name, location_id)
VALUES (dept_deptid_seq.NEXTVAL,
'HR', 1800);

DROP SEQUENCE dept_deptid_seq;