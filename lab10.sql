create database lab10;

create table books(
    book_id int primary key,
    title varchar(255),
    author varchar(255),
    price decimal,
    quantity int
);

create table orders(
    order_id int primary key,
    book_id int references books(book_id),
    customer_id int,
    order_date date,
    quantity int
);

create table customers(
    customer_id int primary key,
    name varchar(255),
    email varchar(255)
);
drop table customers;
insert into books(book_id, title, author, price, quantity)
values (1, 'Database 101', 'A.Smith', 40, 10),
       (2, 'Learn SQL', 'B.Johnson', 35, 15),
       (3, 'Advanced DB', 'C.Lee', 50, 5);

insert into customers(customer_id, name, email)
values (101, 'John Doe', 'johndoe@example.com'),
       (102, 'Jane Doe', 'janedoe@example.com');

--task1
begin;
insert into orders(order_id, book_id, customer_id, order_date, quantity)
values (1, 1, 101, current_date, 2);

update books
set quantity = quantity-2
where book_id = 1;
commit;

begin;
select * from books;
commit;

--task2
begin;
do $$
    begin
        if(select quantity from books where book_id = 3)>=10 then
            insert into orders(order_id, book_id, customer_id, order_date, quantity)
            values(2, 3, 102, current_date, 10);
            update books
            set quantity = quantity-10
            where book_id=3;
        else
            raise notice 'not enough books in stock';
        end if;
end
$$;
rollback;

--task3
--session 1
begin transaction isolation level read committed;
update books
set price = price+100
where book_id=2;
commit;
--session 2
begin transaction isolation level read committed;
select price from books where book_id=2;
commit;

--task4
begin;
update customers
set email = 'email@example.com'
where customer_id=101;
commit;

select * from customers where customer_id=101;


