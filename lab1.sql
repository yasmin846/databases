create database lab1;

create table users(
    id SERIAL,
    firstname varchar(50),
    lastname varchar(50)
);

alter table users
    add column isadmin int;

alter table users
    alter column isadmin drop default,
    alter column isadmin set data type boolean
        using
        case isadmin when 1 then true else false end,
    alter column isadmin set default false;

alter table users
    add primary key (id);

create table tasks(
    id SERIAL,
    name varchar(50),
    user_id integer
);

drop table if exists tasks
drop database if exists lab1