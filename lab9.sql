create database lab9;

create or replace function increase_value(a INT) returns INT as
    $$
    begin
        return a+10;
    end;
    $$
    language plpgsql;

create or replace function compare_num(a int, b int, out answer text) as
    $$
    begin
        if a>b then
            answer := 'Greater';
        elseif a=b then
            answer := 'Equal';
        else
            answer :='Lesser';
        end if;
    end;
    $$
    language plpgsql;

create or replace function number_series(n int) returns setof int as
    $$
    declare
        i int;
    begin
        for i in 1..n loop
            return next i;
        end loop;
    end;
    $$
    language plpgsql;

create or replace function find_employee(employee_name text)
returns table(id int, name text, salary numeric, department text) as
    $$
    begin
        return query
        select id, name, salary, department
        from employees
        where name = employee_name;
    end;
    $$
    language plpgsql;

create or replace function list_products(product_category text) returns table(id int, price numeric, name text, category text) as
    $$
    begin
        return query
        select id, price, name, category
        from products
        where category = product_category;
    end;
    $$
    language plpgsql;

create or replace function calculate_bonus(employee_id int)
returns numeric as
    $$
    declare
        salary numeric;
        bonus numeric;
    begin
        select salary into salary
        from employees
        where id = employee_id;
        bonus := salary*0.2;
        return bonus;
    end;
    $$
    language plpgsql;

create or replace function update_salary(employee_id int)
returns void as
    $$
    declare
        bonus numeric;
        current numeric;
    begin
        select salary into current
        from employees
        where id = employee_id;
        bonus := calculate_bonus(employee_id);
        update employees
        set salary = current
        where id = employee_id;
    end;
    $$
    language plpgsql;

create or replace function complex_calculation(num_input int, str_input varchar)
returns text as
    $$
    declare
        num_result int;
        str_result varchar;
        final_result text;
    begin
        <<numeric>>
        begin
            num_result := num_input*5;
        end;
        <<string>>
        begin
            str_result := upper(str_input);
        end;
        final_result := concat('Num: ', num_result, ' , Str:', str_result);
        return final_result;
    end;
    $$
    language plpgsql;


