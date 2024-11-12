create database lab7;

--select * from countries where name = 'string';
create index countries_name_index on countries using hash (name);

--select * from employees where name = 'string' and surname = 'string';
create index employees_index on employees (name, surname);

--select * from employees where salary<value1 and salary>value2;
create unique index employees_salary_index on employees using btree(salary);

--select * from employees where substring(name from 1 to 4) = 'abcd';
create index employees_name_index on employees((substring(name from 1 to 4)));

--select * from employees e
--join departments d on d.department_id = e.department_id where d.budget>value2 and e.salary<value2;
create index department_budget_index on departments(budget);
create index employees_salary_index on employees(department_id, salary);