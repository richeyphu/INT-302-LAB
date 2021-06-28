--1
declare
    V_Name      employees.first_name%type;
    V_Salary    employees.salary%type;
    inc         number(2);
begin
    select first_name, salary
    into V_name, V_salary
    from employees
    where employee_id = 108;
    dbms_output.put_line('Employee name : ' || v_name);
    if v_salary > 10000 
        then v_salary := v_salary * 1.2;
        inc:=20;
    else v_salary := v_salary * 1.3;
        inc:=30;
    end if;
    dbms_output.put_line('New Salary : ' || v_salary);
    dbms_output.put_line(inc || '% increasing');
end;
/

--2
declare
    emp_id      employees.employee_id%type;
    emp_name    employees.first_name%type;
    emp_last    employees.last_name%type;
    emp_sal     employees.salary%type;
    emp_job     employees.job_id%type;
    bonus       number(4);
begin
    select employee_id, first_name, last_name, salary, job_id
    into emp_id, emp_name, emp_last, emp_sal, emp_job
    from employees
    where first_name = 'Neena';
    if emp_sal < 5500 OR emp_job = 'AD_VP'
        then bonus := 5000;
    else bonus := 10000;
    end if;
    dbms_output.put_line('Employee ID = ' || emp_id);
    dbms_output.put_line('First Name : ' || emp_name);
    dbms_output.put_line('Last Name : ' || emp_last);
    dbms_output.put_line('Bonus :  ' || bonus);
end;
/

--3
declare
    v_id        employees.employee_id%type;
    v_salary    employees.salary%type;
    grade       char(1);
begin
    select employee_id, salary
    into v_id, v_salary
    from employees
    where employee_id = 204;
    dbms_output.put_line('Employee ID = ' || v_id);
    dbms_output.put_line('Salary amount is : ' || v_salary);
    case
        when v_salary <= 5000 then grade := 'C';
        when v_salary between 10000 and 20000 then grade := 'B';
        else grade := 'A';
        end case;
    dbms_output.put_line('GRADE ' || grade);
end;
/