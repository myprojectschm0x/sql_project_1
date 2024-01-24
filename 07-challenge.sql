-- Challenge: HAVING clause

-- 1. 
/*
	We are launching a platinum service for our most loyal customers. We will 
	assign platinum status to customers that have had 40 or more transaction payments. 
	
	What customer_ids are eligible for platinum status?
	
	R = customers's IDS are: 144,526 and 148
*/
select customer_id, count(amount) from payment
group by customer_id
having count(amount) >= 40;


/*
	2. 
	
	What are the customer ids of customers who have spent more than $100 in payment
	transactions with our Staff_id member 2?
	
	R = there are 5 customers who spent the most. 
*/

select customer_id, staff_id, sum(amount) from payment
where staff_id = 2
group by customer_id, staff_id
having sum(amount) >= 100
order by sum(amount) desc;

-- part 2
select customer_id, sum(amount) from payment
where staff_id = 2
group by customer_id
having sum(amount) >= 100
order by sum(amount) desc;