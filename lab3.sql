create database lab3;

select lastname from employees;

select distinct lastname from employees;

select * from employees
where lastname = 'Smith';

select * from employees
where lastname in ('Smith', 'Doe');

select * from employees
where department = 14;

select * from employees
where department = 37 or department = 77;

select sum(budget) as totalBudget from departments;

select department, count(*) as numOfEmployees
from employees
group by department;

select department, count(*) as numOfEmployees
from employees
group by department having count(*)>2;

select name from departments
order by budget desc
limit 1 offset 1;

select name,lastname from employees
where department = (
    select code from departments
    order by budget
    limit 1
    );

select name from employees
where city = 'Almaty'
union
select name from customers
where city = 'Almaty';

select * from departments
where budget > 60000
order by budget, code desc;

update departments
set budget = budget * 0.9
where code = (
    select code from departments
    order by budget asc
    limit 1
    );

update employees
set department = (
    select code from departments
    where name = 'IT'
    )
where department = (
    select code from departments
    where name = 'Research'
    );

delete from employees
where department = (
    select code from departments
    where name = 'IT'
    );

delete from employees;