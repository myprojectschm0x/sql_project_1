-- CHALLENGE: JOIN

/*
    CHALLENGE 1:

    California sales tax laws have changed and we need to alert
    our customers to this through email.

    What are the emails of the customers who live in California?
*/

select * from customer;
select * from address where district = 'California';

select c.email 
from customer as c
inner join address as a
on c.address_id = a.address_id
where a.district = 'California';

/*
	CHALLENGE 2:
	A customer walks in and is a huge fan of the actor 
	"Nick Wahlberg" and wants to know which movies he is in. 
	
	Get a list of all the movies "Nick Wahlberg" has been in. 
*/
select * from actor;
select * from actor where first_name = 'Nick' and last_name = 'Wahlberg';
select * from film;
select * from film_actor;

select f.title from film as f
inner join film_actor as f_a
on f_a.film_id = f.film_id
where f_a.actor_id = (select actor_id from actor where first_name = 'Nick' and last_name = 'Wahlberg');


