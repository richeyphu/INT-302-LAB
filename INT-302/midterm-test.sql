---week 1---
--1
select *
from employees;

--2
select *
from countries;

--3
select employee_id, first_name||' '||last_name employee_name, salary
from employees;

--4
select 'Emp Id: ' || employee_id || 'get salary ' || salary || ' per month x 12 = ' || salary * 12 as employee_salary
from employees;

--5
select job_id || ' job''s title is ' || job_title as jobs_title
from jobs;

--6
select DISTINCT department_id
from EMPLOYEES;


---week2---
--1
select DISTINCT job_id
from employees;

--2
select employee_id||','||first_name||','||last_name||','||email||','||phone_number||','||hire_date||','||job_id||','||salary||','||commission_pct||','||manager_id||','||department_id
as the_output
from employees;

--3
select last_name, salary
from EMPLOYEES
where salary not between 5000 and 12000;

--4
select last_name, job_id, hire_date
from employees
where last_name in ('Matos', 'Taylor');

--5
select last_name, department_id
from employees
where department_id in (20, 50);

--6
select last_name
from employees
where last_name like '%a%' and last_name like '%e%';


---week 3---
--1
select last_name, salary
from employees
where salary > &EMP_SALARY;

--2
select last_name, salary, commission_pct
from employees
where commission_pct is not null
order by 3 DESC;

--3
select manager_id, employee_id, last_name, salary, department_id
from employees
where manager_id = &MANAGER_ID
order by &ORDER_COLUMN;

--4
select last_name
from employees
where last_name like '__a%';

--5
select last_name, job_id, salary
from employees
where job_id in ('ST_CLERK','SA_REP') and salary not in (2500,3500,7000);

--6
select last_name, salary, commission_pct
from EMPLOYEES
where commission_pct = 0.2;

--7
select last_name, job_id
from employees
where manager_id is null;

---week 4---
--1
select employee_id, hire_date, add_months(hire_date,6) "6th Month Review", next_day(add_months(hire_date,6),'friday') "Last day", MONTHS_BETWEEN(SYSDATE,hire_date) "Month work"
from EMPLOYEES
where MONTHS_BETWEEN(SYSDATE,hire_date) > 200;

--2
select last_name, length(last_name) 
from employees
where last_name like 'J%' or last_name like 'A%' or last_name like 'M%';

--3
select employee_id, last_name, salary, round(salary*1.155) "New salary"
from employees;

--4
select to_char(hire_date, 'MON DD, YY') "Hire Date"
from employees;

--5
select last_name, trunc(sysdate-hire_date) tenure
from employees
where department_id = 90;


---week 5---
--1
select last_name || ' earns ' || to_char(salary, 'fm$99,999.00') || ' but wants ' || to_char(salary*3, 'fm$99,999.00') "Dream Salaries"
from employees;

--2
select last_name, hire_date, to_char(next_day(add_months(hire_date, 6),'monday'), 'fmDay, "the" Ddspth "of" Month, yyyy') review
from employees;

--3
select job_id, 
    decode(job_id, 'AD_PRES', 'A',
                   'ST_MAN', 'B',
                   'IT_PROG', 'C',
                   'SA_REP', 'D',
                   'ST_CLERK', 'E',
                   'O') as grade
from jobs;

--4
select 'Dept:' || department_id || ' have ' || count(department_id) || ' employed' as "Emp in dept"
from employees
where department_id is not null
group by department_id;

--5
select d.department_id, department_name, count(last_name) as countdata
from departments d join employees e
on d.department_id = e.department_id
group by d.department_id, d.department_name
having count(last_name) < 3;

--6
select last_name, job_id, d.department_id, department_name
from employees e join departments d
on e.department_id = d.department_id
join locations l
on l.location_id = d.location_id
where city = 'Toronto';


---week 6---
--1
select substr(department_name,0,8) department_name, state_province, substr(city,0,7) city
from departments d join locations l
on d.location_id = l.location_id
where lower(state_province) not like '%h%'
and lower(state_province) not like 'h%'
and lower(state_province) not like '%h';

--3
select location_id, substr(street_address,1,10) street_address, country_name
from locations l join countries c
on c.country_id = l.country_id
where location_id > 2700
and l.street_address not BETWEEN '0' and '9';

--4
select first_name, salary, department_name, city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where salary in (12000, 13000);

--5
select country_id || ' of ' || country_name country, region_name
from countries c join regions r
on c.region_id = r.region_id
where r.region_name = 'Asia';

--6
select last_name, to_char(hire_date, 'Dy dd/mm/yy') hire_date, j.job_id, job_title
from employees e join jobs j
on e.job_id = j.job_id
where j.job_id = upper('&JOB_ID');

--7
select e.employee_id, to_char(start_date,'Day dd mon yy') start_date, end_date, d.department_name, round((end_date-start_date)/7) "week of work days"
from employees e join job_history j
on e.employee_id = j.employee_id
join departments d
on e.department_id = d.department_id
where e.employee_id between 170 and 200;


---practice---
--ch5-p38
select count(*) total, 
count(case when hire_date like '%05' then 1 else null end) "2005",
count(case when hire_date like '%06' then 1 else null end) "2006",
count(case when hire_date like '%07' then 1 else null end) "2007",
count(case when hire_date like '%08' then 1 else null end) "2008"
from employees;