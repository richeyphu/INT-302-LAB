select location_id, department_name, count(*) "Emp num"
from departments d join employees e
on d.department_id = e.department_id
where location_id = 1700
group by location_id, department_name
having count(*) > 1;

select salary
from employees
where last_name = 'Abel';

select last_name
from employees
where salary > (select salary
                from employees
                where last_name = 'Abel');

SELECT last_name
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE employee_id = 149);

select last_name, job_id, salary
from employees
where salary < (select avg(salary) 
                from employees);
                
SELECT last_name,job_id
FROM employees
WHERE job_id = (select job_id
                from employees
                where employee_id = 141);
                
SELECT last_name,job_id,salary
FROM employees
WHERE job_id = (select job_id
                from employees
                where employee_id = 141)
and salary > (select salary
              from employees
              where employee_id = 141);
              
SELECT last_name,job_id,salary
FROM employees
WHERE (job_id,salary) = (select job_id,salary
                         from employees
                         where employee_id = 141);
                         
SELECT last_name,job_id, salary
FROM employees
WHERE salary = (select min(salary)
                from employees);
                
select department_id, min(salary)
from employees
group by department_id
having min(salary) > (select min(salary)
                      from employees
                      where department_id = 50);
                      
SELECT job_id,AVG(salary)
FROM employees
GROUP BY job_id
having avg(salary) = (select min(avg(salary))
                      from employees
                      group by job_id);
                      
select employee_id, last_name
from employees
where salary in (select min(salary)
                 from employees
                 group by department_id);
                 
SELECT last_name,salary,department_id
FROM employees
WHERE salary IN (select min(salary)
                 from employees
                 group by department_id);
                 
select employee_id, last_name
from employees
where department_id in (select department_id
                     from employees
                     where last_name like '%u%' or last_name like 'U%' or last_name like '%u');
                     
select employee_id, last_name, job_id, salary
from employees
where job_id != 'IT_PROG'
and salary < any(select salary
                 from employees
                 where job_id = 'IT_PROG');
                 
select first_name || '  ' || last_name as fullname, to_char(salary, '99,999') as salary,
j.job_id, job_title
from employees e join jobs j
on e.job_id = j.job_id
where salary > (select avg(salary)
                from employees)
and job_title not like '%t%';