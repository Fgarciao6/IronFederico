use sakila;

SELECT first_name,
			 last_name
            , LOWER(email) AS email
	FROM customer
	JOIN rental r
		ON customer.customer_id = r.customer_id
	GROUP BY email,
    first_name,last_name
    having count(r.rental_id)>0;
    
    SELECT c.customer_id, CONCAT(first_name, ' ', last_name) AS name
            , avg(amount)
	FROM customer c
	JOIN payment p
		ON c.customer_id = p.customer_id
        group by c.customer_id,name;
        
WITH name_cte AS (
SELECT CONCAT(first_name, ' ', last_name) AS full_name, LOWER(email) AS email
FROM customer c
),
film_cte AS(
SELECT name AS film_category
FROM category ca
WHERE name = 'Action'
)
SELECT DISTINCT *
FROM name_cte
JOIN film_cte;

SELECT CONCAT(first_name, ' ', last_name) AS full_name, LOWER(email) AS email
FROM customer c
JOIN store s
	ON c.store_id = s.store_id
JOIN inventory i
	ON s.store_id = i.store_id
JOIN film f
	ON i.film_id = f.film_id
JOIN film_category fc
	ON f.film_id = fc.film_id
JOIN category cg
	ON fc.category_id = cg.category_id;
    

SELECT 	customer_id, 
		CONCAT(first_name, ' ', last_name) AS cust_name, 
		ROUND(AVG(amount), 2) AS average,
        CASE WHEN amount < 2 THEN 'low'
			WHEN amount BETWEEN 2 AND 4 THEN 'medium'
            WHEN amount > 4 THEN 'high' END AS classification
FROM customer c
JOIN payment p
	USING (customer_id)
GROUP BY customer_id, cust_name,classification;