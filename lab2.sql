create database lab2;

create table countries(
    country_id serial primary key,
    country_names varchar(100),
    region_id int,
    population int
);

insert into countries (country_names, region_id, population)
    values ('Kazakhstan', 16, 19000000);

insert into countries (country_id, country_names)
    values (default, 'Georgia');

insert into countries (region_id)
    values (NULL);

insert into countries (country_names, region_id, population)
values ('China', 45, 124098),
       ('Italy', 5, 340935),
       ('Russia', 1, 3000000);

alter table countries
    alter column country_names set default 'Kazakhstan';

insert into countries (country_names, region_id, population)
values(default, 54, 9000000);

insert into countries default values;

create table countries_new (like countries including all);

insert into countries_new select * from countries;

update countries
set region_id = 1
where region_id is null;

select country_names, population*1.1 as new_population
from countries;

delete from countries
where population < 100000;

delete from countries_new
where country_id in (select country_id from countries)
returning *;

delete from countries
returning *;
