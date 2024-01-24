-- GENERAL CHALLENGE

-- 1. How many payment transactions were greater than $5.00?
-- R = 3,618
select count(*) from payment where amount > 5.00; 

-- 2. How many actors have a first name that starts with the letter P?
-- R = 5
select count(*) from actor
where first_name like 'P%';

-- 3. HOw many unique districts are our customer from?
-- R = 378
select count(distinct(district)) from address;

-- 4. Retrieve the list of names for those distinct district from the previous question. 
-- R = List a unique district
select distinct(district) from address;

-- eso lo hice. Optional
select * from customer 
where address_id IN 
( 	select address_id from address 
 	where district in 
 	(select distinct(district) from address) 
);

-- 5. How many films have a rating of R and a replacement cost between $5 and %15?
-- R = 52
select * from film;
select count(*) from film 
where rating = 'R' and replacement_cost between 5 and 15;


-- 6. How many films have the word Truman somewhere in the title?
-- R = 5
select * from film;
select count(title) from film
where title like '%Truman%';