SELECT employee_id, last_name, salary
FROM employees
WHERE employee_id = &employee_num;

SELECT last_name, department_id, salary*12
FROM employees
WHERE job_id = '&job_title';

SELECT employee_id, &column_name
FROM employees
WHERE &condition
ORDER BY &order_column;

select job_id, min_salary "Min Salary"
from jobs
where &condition_user
order by &column_to_order;

SELECT employee_id, last_name, job_id, &&column_name
FROM employees
ORDER BY &column_name;

UNDEFINE column_name;

select employee_id, last_name, job_id, &&column_name
from employees
where &column_name is not null
order by &column_name desc;

UNDEFINE column_name;

DEFINE employee_num = 200;
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_num;


SELECT 'The job id for ' || UPPER(last_name) ||
' is ' || LOWER(job_id) AS "EMPLOYEE DETAILS"
FROM employees;

SELECT employee_id, last_name, department_id
FROM employees
WHERE LOWER(last_name) = 'higgins';

SELECT employee_id,
concat(first_name,last_name) NAME,
job_id,
length(last_name),
instr(last_name,'a') "Contains 'a'?"
FROM employees
WHERE SUBSTR(job_id,4) = 'REP';

SELECT employee_id,
concat(concat(first_name,' '),last_name) NAME,
job_id,
length(last_name),
instr(last_name,'a') "Contains 'a'?"
FROM employees
WHERE last_name like '%n';

SELECT LPAD('5000', 10, '*')
FROM dual;

SELECT RPAD('5000', 10, '*')
FROM dual;

select first_name, rpad(first_name, 20, ' ') first_name_1, lpad(first_name, 20, '*') first_name_2
from employees;

select mod(1750,1600)
from dual;

SELECT ROUND(67830.4557, 3),
ROUND(67830.4557, 2),
ROUND(67830.4557, -3)
FROM dual;

SELECT last_name, salary,
mod(salary, 5000) "Mod Salary"
FROM employees
where lower(job_id) = 'sa_rep';

SELECT last_name, hire_date
FROM employees
WHERE hire_date like '%03';

select sysdate
from dual;

SELECT last_name, (SYSDATE-hire_date)/7 AS WEEKS
FROM employees
WHERE department_id = 90;

SELECT last_name,
ROUND(MONTHS_BETWEEN(SYSDATE, hire_date))
AS MONTHS_WORKED
FROM employees;

SELECT employee_id, hire_date,
ROUND(hire_date, 'MONTH') AS ROUNDMONTH,
TRUNC(hire_date, 'MONTH') AS TRUNCMONTH
FROM employees
WHERE hire_date LIKE '%05';

select employee_id, hire_date, 
add_months(hire_date,6) review,
next_day(hire_date,'FRIDAY') "Next Hiredate",
last_day(add_months(hire_date,6)) "Last Hiredate", 
months_between(sysdate, hire_date) tenure
from employees
where months_between(sysdate, hire_date) > 200
order by tenure desc;