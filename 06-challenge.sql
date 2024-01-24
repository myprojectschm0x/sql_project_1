-- CHALLENGE: GROUP BY

/* 1. Challenge:
	We have two staff members, with Staff IDS 1 and 2. We want to give a 
	bonus to the staff member that handled the most payments. (Most in term of number
	of payments processed, not total dollar amount).
	
	How many payment did each staff member handle and who gets the bonus?
*/

select * from payment;

select staff_id, count(amount) from payment
group by staff_id
order by count(amount) desc;

-- R = Staff Member number 2 has 7,304 payment processed; then  gets the bonus. 

---------------------------------------------------------------------
/*
	2. Challenge
	Corporate HQ is conducting a study on the relationship between replacement cost 
	and a movie MPAA rating (e.g G, PG, R, etc...)
	
	- What is the average replacement cost per MPAA rating?
*/
select * from film;
select rating, avg(replacement_cost) from film
group by rating
order by rating asc;

select rating, round(avg(replacement_cost), 2) from film
group by rating
order by rating asc;


/*
	3. Challenge
	
	We are running a promotion to reward our top 5 customers with coupons. 
	
	What are the customer ids of the top 5 customer by total spend?
*/
select customer_id, sum(amount) from payment
group by customer_id
order by sum(amount) desc
limit 5;

-- R = The ids are: 148, 526, 178, 137 and 144. 
