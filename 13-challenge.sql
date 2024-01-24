-- CHALLENGE: CASE Statement

/*
	Challenge 1:
	
	We want to know and compare the various amounts of films we have 
	per movie rating. 
*/

SELECT * FROM film;

SELECT
	SUM(
		CASE rating 
			WHEN 'R' THEN 1
			ELSE 0
		END 
	)
	AS RT, 
	SUM(
		CASE rating
			WHEN 'PG' THEN 1
			ELSE 0
		END
	)
	AS PG, 
	SUM(
		CASE rating	
			WHEN 'PG-13' THEN 1
			ELSE 0
		END
	)
	AS pg_13
FROM film;

