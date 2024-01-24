-- CHALLENGE: ORDER BY and LIMIT. 

-- Challenge 1: 
/*
	"We want to reward our first 10 paying customers"
	"What are the customer ids of the first 10 customers who created a payment?"
*/
select customer_id from payment
order by payment_date asc
limit 10;

select customer_id, first_name, email from customer
where customer_id in (select customer_id from payment order by payment_date asc limit 10);

-- Challenge 2 
/*
	"A customer wants to quickly rent a video to watch over their short lunch break."
	"What are the titles of the 5 shortest (in length of runtime) movies?"
*/
select * from film;

select title, length from film
order by length asc
limit 5;

select min(length) from film;

-- same result as above. 
select title, length from film
where length = (select min(length) from film)
limit 5;

-- cuantas peliculas son el que tiene menos de 46 min. 
select count(title) from film
where length = (select min(length ) from film);

-- Un poco mas avanzado. Lo hice. 
-- Explanation: quiero sacar todas las peliculas que tiene 46 min de duracion
-- junto con el limite. 
select title, length from film 
where length = (select min(length) from film)
limit (select count(title) from film where length = (select min(length) from film))


-- ---------------------------------------------------------------------------------
-- Challenge: Bonus
/*
	"If the previous customer can watch any movie that is 50 minutes
	or less in run time, how many options does she have?"
*/
-- Correct
select count(*) from film
where length <= 50;

