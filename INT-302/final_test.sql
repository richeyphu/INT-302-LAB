---week 13
--2
create table Customer
(   customer_id     varchar2(5)
                    primary key,
    customer_name   varchar2(30)
                    not null,
    Income          number(6)
                    not null
);
desc Customer;

--3
begin
    insert into Customer
    values('C1001','Suttipong Ratjan',25000);
    insert into Customer
    values('C1002','Nisachon Chidchon',50000);
    insert into Customer
    values('C1003','Pawarit Puchay',75000);
end;
/

--4
declare
    id      customer.customer_id%type := 'C1001';
    name    customer.customer_name%type;
    income  customer.income%type;
begin
    update Customer
    set customer_name = 'Chanon Sukmeang'
    where customer_id = id;
    select customer_name, income
    into name, income
    from customer
    where customer_id = id;
    dbms_output.put_line('CUSTOMER ID = ' || id);
    dbms_output.put_line('NAME   = ' || name);
    dbms_output.put_line('INCOME = ' || income);
end;
/

--5
begin
    delete from Customer
    where customer_id = 'C1003';
    DBMS_OUTPUT.PUT_LINE('Delete already...');
end;
/

---week12
--1
declare
    j_id    jobs.job_id%type;
    j_title jobs.job_title%type;
    mins     jobs.min_salary%type;
    maxs     jobs.max_salary%type;
begin
    select job_id, job_title, min_salary, max_salary
    into j_id, j_title, mins, maxs
    from jobs
    where job_id = 'IT_PROG';
    dbms_output.put_line('JOB ID     = ' || j_id);
    dbms_output.put_line('JOB TITLE  = ' || j_title);
    dbms_output.put_line('MIN SALARY = ' || mins);
    dbms_output.put_line('MAX SALARY = ' || maxs);
end;
/

--loop
declare
    num number(2) := 0;
begin
    loop
        num := num + 1;
        exit when num >= 10;
    end loop;
    dbms_output.put_line(num);
end;
/

declare
    num number(2) := 0;
begin
    while num<10 loop
        num := num + 1;
    end loop;
    dbms_output.put_line(num);
end;
/

declare
    num number(2) := 0;
begin
    for i in 1..10 loop
        num := num + i;
    end loop;
    dbms_output.put_line(num);
end;
/