select max(salary)
from employees;

SELECT round(AVG(salary),2), MAX(salary),
MIN(salary), SUM(salary)
FROM employees
WHERE job_id LIKE '%REP%';

SELECT MIN(hire_date), MAX(hire_date)
FROM employees;

select min(last_name) first_lastname, max(last_name) last_lastname
from employees;

SELECT COUNT(*)
FROM employees
WHERE department_id = 50;

SELECT COUNT(commission_pct)
FROM employees
WHERE department_id = 80;

SELECT COUNT(DISTINCT department_id)
FROM employees;

SELECT avg(commission_pct)
FROM employees;

SELECT avg(nvl(commission_pct,0))
FROM employees;

SELECT department_id, avg(salary)
FROM employees
GROUP BY department_id;

SELECT AVG(salary)
FROM employees
GROUP BY department_id;

SELECT to_char(AVG(salary), '99,999.99') "Average Salary"
FROM employees
GROUP BY department_id
order by 1;

SELECT department_id DEPT_ID, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;

SELECT department_id, COUNT(last_name)
FROM employees
group by department_id
order by 1;

SELECT department_id, job_id, COUNT(last_name)
FROM employees
GROUP BY department_id, job_id
order by 1;

SELECT department_id, AVG(salary)
FROM employees
having AVG(salary) > 8000
GROUP BY department_id;

SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 10000;

select department_id, round(avg(salary),2) "Average Salary"
from employees
group by department_id
having max(salary) > 12000;

select job_id, sum(salary)
from employees
where job_id like 'S%'
group by job_id
having sum(salary) > 13000
order by 1;

SELECT max(avg(salary))
FROM employees
GROUP BY department_id;

select count(*) total, 
count(case when hire_date like '%05' then 1 else null end) "2005",
count(case when hire_date like '%06' then 1 else null end) "2006",
count(case when hire_date like '%07' then 1 else null end) "2007",
count(case when hire_date like '%08' then 1 else null end) "2008"
from employees;

select first_name, e.department_id, department_name, city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;