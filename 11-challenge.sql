-- GENERAL CHALLENGE ON A NEW DATABASE WITH ALL KNOWLEDGE


/*
	1.
	How can you retrieve all the information from the cd.facilities table?
*/
select * from cd.facilities;

/*
	2. 
	You want to print out a list of all of the facilities and 
	their cost to members. How would you retrieve a list of only 
	facility names and costs?
*/
select f.name, f.membercost from cd.facilities as f;

/*
	3. 
	How can you produce a list of facilities that charge a fee to members?
*/
select * from cd.facilities as f 
where f.membercost > 0;


/*
	4. 
	How can you produce a list of facilities that charge a fee to members, 
	and that fee is less than 1/50th of the monthly maintenance cost? 
	Return the facid, facility name, member cost, and monthly maintenance 
	of the facilities in question.
*/
select f.facid, f.name, f.membercost, f.monthlymaintenance
from cd.facilities as f 
where f.membercost > 0 
and f.membercost < ( (1/50.0) * monthlymaintenance);

/*
	5. 
	How can you produce a list of all 
	facilities with the word 'Tennis' in their name?
*/
select * from cd.facilities as f
where f.name like '%Tennis%';

/*
	6.
	How can you retrieve the details of facilities 
	with ID 1 and 5? Try to do it without using the OR operator.
*/
select * from cd.facilities;

select * from cd.facilities
where facid in (1,5);

/*
	7.
	How can you produce a list of members who joined after 
	the start of September 2012? Return the memid, surname, 
	firstname, and joindate of the members in question.
*/

select m.memid, m.surname,m.firstname, m.joindate from cd.members as m
where date(m.joindate) >= '2012-09-01';

/*
	8. 
	How can you produce an ordered list of the 
	first 10 surnames in the members table? The 
	list must not contain duplicates.
*/

select * from cd.members;

select distinct(m.surname) from cd.members as m
order by m.surname 
limit 10;

/*
	9. 
	You'd like to get the signup date of your last member. 
	How can you retrieve this information?
*/

select m.memid, m.joindate  from cd.members as m
order by m.joindate desc
limit 1;

-- other way 
select max(joindate) from cd.members;

-- the first member
select min(joindate) from cd.members;

/*
	10.
	Produce a count of the number of facilities that have a 
	cost to guests of 10 or more.
*/

select count(*) from cd.facilities as f
where f.guestcost >= 10;

/*
	11.
	Produce a list of the total number of slots booked per facility 
	in the month of September 2012. Produce an output table consisting of 
	facility id and slots, sorted by the number of slots.
*/

select * from cd.bookings;
select * from cd.facilities;
select * from cd.members;

select b.facid, sum(b.slots) as total_slots
from cd.bookings as b
where date(b.starttime) >= '2012-09-01' and date(b.starttime) <= '2012-10-01'
group by b.facid
order by sum(b.slots);


/*
	12.
	Produce a list of facilities with more than 1000 slots booked. 
	Produce an output table consisting of facility id and total slots, 
	sorted by facility id.
*/

select b.facid, sum(b.slots) 
from cd.bookings as b
group by b.facid
having sum(b.slots) > 1000
order by b.facid;

/*
	13.
	How can you produce a list of the start times for bookings for tennis courts, 
	for the date '2012-09-21'? Return a list of start time and facility 
	name pairings, ordered by the time.
*/						
select b.starttime, f.name
from cd.bookings as b
inner join cd.facilities as f
on b.facid = f.facid
where f.name like '%Tennis Court%'
and date(b.starttime) >= '2012-09-21'
and date(b.starttime) < '2012-09-22'
order by date(b.starttime);

/*
	14.
	How can you produce a list of the start times for bookings 
	by members named 'David Farrell'?
*/

select b.starttime
from cd.bookings as b
where b.memid = (
	select m.memid from cd.members as m
	where firstname = 'David' and surname = 'Farrell'
);






