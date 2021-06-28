SELECT employee_id, hire_date,

TO_CHAR(hire_date, 'dy dd MM/YY') Month_Hired

FROM employees
WHERE last_name = 'Higgins';

SELECT last_name,
TO_CHAR(hire_date, 'fmDD Month YYYY')
AS HIREDATE
FROM employees;

SELECT last_name,
TO_CHAR(hire_date, 'fmDdspth "of" Month YYYY  fmHH12:MI:SS AM')
AS HIREDATE
FROM employees;

SELECT TO_CHAR(salary, 'L99,999.00') SALARY
FROM employees
WHERE last_name = 'Ernst';

SELECT last_name,
UPPER(CONCAT(SUBSTR(last_name,1,8),'_US'))
AS "Last name"
FROM employees
WHERE department_id = 60;

select to_char(next_day(add_months(hire_date, 6),'friday'), 'fmDay,Month ddth,yyyy') "Next 6 Month Review"
from employees;

SELECT last_name, salary, commission_pct,
NVL(commission_pct,0) NVL_COMMISSION_PCT,
(salary*12) + (salary*12*NVL(commission_pct,0)) AN_SAL

FROM employees;

SELECT last_name, salary, commission_pct,
NVL2(commission_pct, 'SAL+COM', 'SAL') AS INCOME
FROM employees
WHERE department_id IN (50, 80);

SELECT first_name, LENGTH(first_name) "expr1",
last_name, LENGTH(last_name) "expr2",
NULLIF(LENGTH(first_name), LENGTH(last_name)) "result"
FROM employees;

SELECT last_name, manager_id, commission_pct,
COALESCE(TO_CHAR(commission_pct), TO_CHAR(manager_id),
'No commission and No manager') AS EXPRESSION

FROM employees;

select last_name, salary, commission_pct, 
coalesce (to_char(commission_pct)*salary+salary, salary+2000) "New Salary"
from employees;

SELECT last_name, job_id, salary,
to_char(
    CASE job_id WHEN 'IT_PROG' THEN 1.10*salary
                WHEN 'ST_CLERK' THEN 1.15*salary
                WHEN 'SA_REP' THEN 1.20*salary
                ELSE salary
    END, 'L99,999.99') AS "REVISED SALARY"
FROM employees;

SELECT last_name, job_id, salary,
to_char(
    decode (job_id , 'IT_PROG' , 1.10*salary
                , 'ST_CLERK' , 1.15*salary
                , 'SA_REP' , 1.20*salary
                , salary
    ), 'L99,999.99') AS "REVISED SALARY"
FROM employees;

select last_name, salary, 
    case when salary < 5000 then 'Low'
         when salary < 10000 then 'Medium'
         when salary < 20000 then 'Good'
         else null
    end as qualified_salary
from employees;

select last_name, salary,
    case when salary < 10000 then 0.4
         when salary < 12000 then 0.42
         when salary < 14000 then 0.44
         when salary < 16000 then 0.45
    end as tax_rate
from employees
where department_id = 80;

select job_id, job_title, min_salary,
to_char(
    case when job_title like 'A%' then min_salary*1.1
         when job_title like 'P%' then min_salary*1.2
         else min_salary
    end, '99,999.99') as new_min
from jobs;