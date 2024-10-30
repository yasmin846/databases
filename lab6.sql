create database lab6;

create table locations(
    location_id serial primary key,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);

create table departments(
    department_id serial primary key,
    department_name varchar(50) unique,
    budget int,
    location_id int references locations
);

create table employees(
    employee_id serial primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary int,
    department_id int references departments
);

select first_name, last_name, d.department_id, d.department_name
from employees e
inner join departments d on e.department_id = d.department_id;

select first_name, last_name, department_name, d.department_id
from employees
inner join departments d on employees.department_id = d.department_id
where d.department_id = 80 or d.department_id = 40;

select e.first_name, e.last_name, d.department_name, l.city, l.state_province
from employees e
inner join departments d on e.department_id = d.department_id
inner join locations l on l.location_id = d.location_id;

select d.department_name, d.department_id
from departments d
left join employees e on d.department_id = e.department_id;

select e.first_name, e.last_name, d.department_id, d.department_name
from employees e
left join departments d on e.department_id = d.department_id;