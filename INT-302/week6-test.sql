SELECT department_id, department_name, location_id, city
FROM departments
NATURAL JOIN locations;

select location_id, street_address, city, state_province, country_name
from locations natural join countries;

SELECT employee_id, last_name, location_id, department_id
FROM employees JOIN departments
USING (department_id);

select last_name, department_id, department_name
from employees join departments
using (department_id)
order by 2 desc;

SELECT l.city, d.department_name
FROM locations l JOIN departments d
on l.location_id = d.location_id
WHERE d.location_id = 1400;

SELECT e.employee_id, e.last_name, e.department_id,
d.department_id, d.location_id
FROM employees e JOIN departments d
ON e.department_id = d.department_id;

SELECT employee_id, city, department_name, country_name, region_name, job_title
FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
join countries c
on l.country_id = c.country_id
join regions r
on c.region_id = r.region_id
join jobs j
on e.job_id = e.job_id;         

select department_id, department_name, d.location_id, city
from departments d join locations l
on d.location_id = l.location_id
where department_id in (20,50);

SELECT worker.last_name emp, manager.last_name mgr
FROM employees worker JOIN employees manager
on worker.manager_id = manager.employee_id
where worker.last_name = 'Lorentz';

SELECT e.last_name, d.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id;

SELECT e.last_name, d.department_id, d.department_name
FROM employees e RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id;

SELECT e.last_name, d.department_id, d.department_name
FROM employees e FULL OUTER JOIN departments d
ON e.department_id = d.department_id;

select department_name, state_province
from departments d left outer join locations l
on d.location_id = l.location_id
where department_id in (10,20,30,40);

select employee_id, first_name || ' ' || last_name, e.job_id, min_salary
from employees e join jobs j
on e.job_id = j.job_id
and job_title not like 'A%' and job_title not like 'P%' and min_salary = 4000;