-- CHALLENGE: TIMESTAMPS

/*
    Challenge 1:

    During which months did payment occur?
    
*/

select * from payment;

select distinct(to_char(payment_date, 'Month')) from payment;


/*
	CHallenge 2:
	
	HOw many payments occurred on a Monday?
*/
select count(to_char(payment_date, 'Day')) from payment
where to_char(payment_date, 'Day') like 'Monday%';
