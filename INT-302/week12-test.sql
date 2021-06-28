declare
    v_fname varchar2(20);
begin
    select first_name
    into v_fname
    from employees
    where employee_id = 100;
    DBMS_OUTPUT.PUT_LINE(' The First Name of the Employee is ' || v_fname);
end;
/

DECLARE
    a NUMBER := 10;
    b NUMBER := 20;
    c NUMBER;
    f NUMBER(5,2);
BEGIN
    c := a + b;
    DBMS_OUTPUT.PUT_LINE('Value of c: ' || c);
    f := 70.0/3.0;
    DBMS_OUTPUT.PUT_LINE('Value of f: ' || f);
END;
/

DECLARE
    -- constant declaration
    pi CONSTANT NUMBER := 3.141592654;
    -- other declarations
    radius NUMBER(5,2);
    dia NUMBER(5,2);
    circumference NUMBER(7, 2);
    area NUMBER(10, 2);
BEGIN
    -- processing
    radius := 9.5;
    dia := radius * 2;
    circumference := 2.0 * pi * radius;
    area := pi * radius * radius;
    -- output
    dbms_output.put_line('Radius: ' || radius);
    dbms_output.put_line('Diameter: ' || dia);
    dbms_output.put_line('Circumference: ' || circumference);
    dbms_output.put_line('Area: ' || area);
END;
/

DECLARE
    service_charge number(2) := &service_charge ;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Service Charge is '||service_charge||'%');
END;
/

declare
    p_name varchar2(10) := '&PRODUCT';
    qty number(3) := &QUANTITY;
    price number(5,2) := &PRICE;
    total number(10,2) := qty * price;
begin
    dbms_output.put_line('Product : ' || p_name);
    dbms_output.put_line('Quantity : ' || qty);
    dbms_output.put_line('Price : ' || price);
    dbms_output.put_line('Total : ' || total);
end;
/

DECLARE
    v_father_name VARCHAR2(20):='Patrick';
    v_date_of_birth DATE:='20-Apr-1972';
BEGIN
    DECLARE
        v_child_name VARCHAR2(20):='Mike';
        v_date_of_birth DATE:='12-Dec-2002';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Father''s Name: '||v_father_name);
        DBMS_OUTPUT.PUT_LINE('Date of Birth: '||v_date_of_birth);
        DBMS_OUTPUT.PUT_LINE('Child''s Name: '||v_child_name);
    END;
    DBMS_OUTPUT.PUT_LINE('Date of Birth: '||v_date_of_birth);
END;
/

DECLARE
    -- Global variables
    num1 number := 95;
    num2 number := 85;
BEGIN
    dbms_output.put_line('Outer Variable num1: ' || num1);
    dbms_output.put_line('Outer Variable num2: ' || num2);
    DECLARE
        -- Local variables
        num1 number := 195;
        num2 number := 185;
    BEGIN
        dbms_output.put_line('Inner Variable num1: ' || num1);
        dbms_output.put_line('Inner Variable num2: ' || num2);
    END;
END;
/

declare
    h_date employees.hire_date%type;
    sal employees.salary%type;
begin
    select hire_date, salary
    into h_date, sal
    from employees
    where employee_id = 100;
    dbms_output.put_line('Hire Date= ' || h_date);
    dbms_output.put_line('Salary= ' || to_char(sal,'99,999.99'));
end;
/

declare
    sum_sal employees.salary%type;
begin
    select sum(salary)
    into sum_sal
    from employees
    where department_id = 60;
    --group by department_id;
    dbms_output.put_line('The sum of salary is ' || to_char(sum_sal,'99,999.99'));
end;
/

DECLARE
    M_FIRST_NAME varchar2(20);
    M_LAST_NAME varchar2(20);
    M_SALARY varchar2(20);
BEGIN
    SELECT FIRST_NAME,LAST_NAME,SALARY 
        INTO M_FIRST_NAME,M_LAST_NAME,M_SALARY
        FROM EMPLOYEES 
        WHERE EMPLOYEE_ID=205;
    DBMS_OUTPUT.PUT_LINE('NAME IS '||M_FIRST_NAME);
    DBMS_OUTPUT.PUT_LINE('LAST NAME IS ' ||M_LAST_NAME);
    DBMS_OUTPUT.PUT_LINE('SALARY IS ' ||M_SALARY);
EXCEPTION
    WHEN NO_DATA_FOUND THEN 
        DBMS_OUTPUT.PUT_LINE('INVALID EMPLOYEE ID');
END;
/

DECLARE
    c_id customers.id%type := 8;
    c_name customers.name%type;
    c_addr customers.address%type;
BEGIN
    SELECT name, address INTO c_name, c_addr
    FROM customers WHERE id = c_id;
    DBMS_OUTPUT.PUT_LINE ('Name: '|| c_name);
    DBMS_OUTPUT.PUT_LINE ('Address: ' || c_addr);
exception
    when no_data_found then
    dbms_output.put_line('No such customer!');
END;
/

DECLARE
    v_lname employees.last_name%TYPE;
BEGIN
    SELECT last_name INTO v_lname
    FROM employees
    WHERE first_name='John';
    DBMS_OUTPUT.PUT_LINE ('John''s last name is :'||v_lname);
exception
    when too_many_rows then
    DBMS_OUTPUT.PUT_LINE ('retrieved multiple rows.');
END;
/

DECLARE
    v_num1 number := &sv_num1;
    v_num2 number := &sv_num2;
    v_result number;
BEGIN
    v_result := v_num1 / v_num2;
    DBMS_OUTPUT.PUT_LINE ('v_result: '||v_result);
exception
    when zero_divide then
    DBMS_OUTPUT.PUT_LINE ('cannot be divided by zero.');
END;
/

DECLARE
    e_hiredate DATE := '&Start_Date';
    e_firstname employees.first_name%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Check the employee is start date');
    SELECT first_name INTO e_firstname
    FROM employees
    WHERE hire_date = e_hiredate;
    DBMS_OUTPUT.PUT_LINE('The employee is '||e_firstname);
    DBMS_OUTPUT.PUT_LINE('Employ on:'||e_hiredate);
exception
    when too_many_rows then
    DBMS_OUTPUT.PUT_LINE('too many employees');
    when no_data_found then
    DBMS_OUTPUT.PUT_LINE('no employee employed');
END;
/