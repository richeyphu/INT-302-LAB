select employee_id, first_name
from employees;

select *
from employees;

select *
from jobs;

select employee_id, first_name, last_name
from employees;

select first_name, salary, salary+300
from employees;

select job_id, job_title, min_salary, min_salary*1.05 "Min Salary"
from jobs;

select last_name, job_id, salary, commission_pct
from employees;

select employee_id "CODE", first_name "EMP Name", salary*12 "Anual Salary"
from employees;

SELECT first_name, last_name,
first_name || ' ' || last_name NAME
from employees;

select location_id, street_address, postal_code, city||' '||state_province city
from locations;

select last_name || ': 1 Month salary = ' || salary monthly
from employees;

select department_name || ' is manage by:' || manager_id "Dept Manager"
from departments;

select first_name || ' Employee''s Department Id: ' || department_id "Employee Name Department"
from employees;

SELECT distinct department_id 
FROM employees;

select distinct department_id, job_id
from employees;

describe jobs;

desc departments;