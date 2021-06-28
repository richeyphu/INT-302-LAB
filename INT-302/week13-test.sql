--Page 72++
create table job_bk
(   job_id  varchar2(10) 
            primary key,
    job_title   varchar2(35)
                not null,
    min_salary  number(6),
    max_salary  number(6)
);

begin
    insert into job_bk
    values ('EN_MGR', 'Engineer Manager', 20000, 60000);
    insert into job_bk
    values ('COM_EN', 'Computer Engineer', 10000, 25000);
    insert into job_bk
    values ('INST', 'Instructor', 5000, 10000);
end;
/

declare
    j_id    job_bk.job_id%type;
    j_name  job_bk.job_title%type;
begin
    update job_bk
    set job_title = 'IT Instructor'
    where job_id = 'INST';
    
    select job_id, job_title
    into j_id,j_name
    from job_bk
    where job_id = 'INST';
    
    DBMS_OUTPUT.PUT_LINE('job Id is : ' || j_id);
    DBMS_OUTPUT.PUT_LINE('New job title is : ' || j_name);
end;
/

select * from job_bk;

begin
    delete from job_bk
    where job_id = 'INST';
end;
/

declare
    f_name  employees.first_name%type;
begin
    select first_name
    into f_name
    from employees
    where employee_id = 206;
    DBMS_OUTPUT.PUT_LINE(sql%rowcount || ' record retrived');
    DBMS_OUTPUT.PUT_LINE(f_name);
    
    update employees
    set salary = 3000
    where department_id = 50 and salary < 2500;
    DBMS_OUTPUT.PUT_LINE(sql%rowcount || ' record update');
end;
/
rollback;

select * from employees
where department_id = 50 and salary < 2500;

DECLARE
v_myage number:=31;
BEGIN
IF v_myage < 11 THEN
DBMS_OUTPUT.PUT_LINE(' I am a child ');
ELSIF v_myage < 20 THEN
DBMS_OUTPUT.PUT_LINE(' I am young ');
ELSIF v_myage < 30 THEN
DBMS_OUTPUT.PUT_LINE(' I am in my twenties');
ELSIF v_myage < 40 THEN
DBMS_OUTPUT.PUT_LINE(' I am in my thirties');
ELSE
DBMS_OUTPUT.PUT_LINE(' I am always young ');
END IF;
END;
/

declare
    f_name  employees.first_name%type;
    sal     employees.salary%type;
    p       number(2);
begin
    select first_name,salary
    into f_name,sal
    from employees
    where employee_id = 190;
    
    if sal<3000 then
        sal := sal*1.3;
        p := 30;
    else
        sal := sal*1.2;
        p := 20;
    end if;
    
    DBMS_OUTPUT.PUT_LINE('Employee name : ' || f_name);
    DBMS_OUTPUT.PUT_LINE('New salary is : ' || sal);
    DBMS_OUTPUT.PUT_LINE(p || '% increasing');
end;
/

declare
    grade char(1) := upper('&grade');
    sen   varchar2(20);
begin
    case grade
        when 'A' then sen := 'Excellent';
        when 'B' then sen := 'Excellent';
        when 'C' then sen := 'Excellent';
        else sen := 'No such grade';
    end case;
    dbms_output.put_line('Grade: ' || grade || ' Appraisal ' || sen);
end;
/

declare
    code number(2) := &enter_code;
    total number(3);
begin
    case code
        when 10 then 
            select count(*) into total from employees;
            DBMS_OUTPUT.put_line(total || ' ROWS IN EMPLOYEES');
        when 20 then
            select count(*) into total from departments;
            DBMS_OUTPUT.put_line(total || ' ROWS IN DEPARTMENTS');
        when 30 then
            select count(*) into total from jobs;
            DBMS_OUTPUT.put_line(total || ' ROWS IN JOBS');
        else
            DBMS_OUTPUT.put_line('Out of Number!!!');
    end case;
end;
/

--LOOP
DECLARE
    x number := 10;
BEGIN
    LOOP
        dbms_output.put_line(x);
        x := x + 10;
    exit WHEN x > 50;
    END LOOP;
    -- after exit, control resumes here
    dbms_output.put_line('After Exit x is: ' || x);
END;
/

DECLARE
    a number(2) := 10;
BEGIN
    WHILE a < 20 LOOP
        dbms_output.put_line('value of a: ' || a);
        a := a + 1;
    END LOOP;
END;
/

DECLARE
    X NUMBER :=1;
    Y NUMBER :=1;
BEGIN
    WHILE(X<=10) LOOP
        DBMS_OUTPUT.PUT_LINE(X);
        X :=X+1;
        Y :=Y*3;
    EXIT WHEN Y>8;
    END LOOP;
END;
/

DECLARE
    a number(2);
BEGIN
    FOR a in 10 .. 20 LOOP
        dbms_output.put_line('value of a: ' || a);
    END LOOP;
END;
/

DECLARE
    a number(2);
BEGIN
    FOR a IN REVERSE 10 .. 20 LOOP
        dbms_output.put_line('value of a: ' || a);
    END LOOP;
END;
/

BEGIN
    FOR X IN 2..10 LOOP
        DBMS_OUTPUT.PUT_LINE(X);
    EXIT WHEN MOD(X,3)=0;
    END LOOP;
END;
/

--Basic loop
declare
    n number(2) := 1;
    total number(4) := 0;
begin
    loop
        total := total + n;
        n := n + 1;
        exit when n > 50;
    end loop;
    dbms_output.put_line('1+2+3+...+50 = ' || total);
end;
/

--While loop
declare
    n number(2) := 1;
    total number(4) := 0;
begin
    while n<=50 loop
        total := total + n;
        n := n + 1;
    end loop;
    dbms_output.put_line('1+2+3+...+50 = ' || total);
end;
/

--For loop
declare
    total number(4) := 0;
begin
    for n in 1..50 loop
        total := total + n;
    end loop;
    dbms_output.put_line('1+2+3+...+50 = ' || total);
end;
/

declare
    n number(2) := &enter_num;
    i number(2) := 1;
begin
    loop
    dbms_output.put_line(n || ' x ' || i || ' = ' || n*i);
    i := i + 1;
    exit when i > 12;
    end loop;
end;
/

declare
    n number(2) := &enter_num;
begin
    for i in 1..12 loop
        dbms_output.put_line(n || ' x ' || i || ' = ' || n*i);
    end loop;
end;
/