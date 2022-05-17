use sakila;

#Write a query to find what is the total business done by each store.

SELECT i.store_id, SUM(p.amount) AS total_sales 
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY store_id;

##Convert the previous query into a stored procedure.

DELIMITER //
create procedure total_sales_3 (in store int, out param1 int)
begin
 SELECT i.store_id, SUM(p.amount) AS total_sales 
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY store_id;
end //
DELIMITER ;

CALL total_sales_3 (2,@1);

## Convert the previous query into a stored procedure that takes the input for store_id and displays the total sales for that store

DELIMITER //
create procedure total_sales__ (in store int, out param1 int)
begin
 SELECT i.store_id, SUM(p.amount) AS total_sales 
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY store_id
Having store_id=store;
end //
DELIMITER ;

CALL total_sales__ (1,@try);

##Update the previous query. Declare a variable total_sales_value of float type, that will store the returned result (of the total sales amount for the store).
##Call the stored procedure and print the results.


DELIMITER //
CREATE PROCEDURE total_store_biz (IN store_no INT)
BEGIN
DECLARE TOTAL_SALES_AMOUNT FLOAT;
SELECT TOTAL_BUSINESS INTO TOTAL_SALES_AMOUNT
FROM
(SELECT STORE_ID,ROUND(SUM(AMOUNT)) AS TOTAL_BUSINESS
FROM PAYMENT
JOIN STAFF USING (STAFF_ID)
WHERE STORE_ID= STORE_NO
GROUP BY STORE_ID) AS TABLE1;
SELECT TOTAL_SALES_AMOUNT;
END//
DELIMITER;


CALL total_store_biz();
SELECT @try;



