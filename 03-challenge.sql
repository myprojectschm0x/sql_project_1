-- Challenge: SELECT WHERE Clausule

select * from customer;
select first_name from customer 
where first_name = 'Jared';

-- Challenge no 1
select first_name, last_name, email from customer
where first_name = 'Nancy' and last_name = 'Thomas';

-- Challenge no 2
select * from film;

select title, description from film
where title = 'Outlaw Hanky';

-- Challenge no 3
select * from customer;
-- select * from customer where address_id = 259;
select * from address;
select address, phone from address 
where address='259 Ipoh Drive';