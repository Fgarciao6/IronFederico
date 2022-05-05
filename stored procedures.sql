use sakila;

create procedure action_movies (out param1 int) -- in x int, 
begin
  select first_name, last_name, email
  from customer
  join rental on customer.customer_id = rental.customer_id
  join inventory on rental.inventory_id = inventory.inventory_id
  join film on film.film_id = inventory.film_id
  join film_category on film_category.film_id = film.film_id
  join category on category.category_id = film_category.category_id
  where category.name = "Action"
  group by first_name, last_name, email;
end //
DELIMITER ;

call action_movies (@movies);

delimiter //
create procedure choose_movie (in param varchar(10))
begin
	declare avg_loss float; 
	 select first_name, last_name, email
  from customer
  join rental on customer.customer_id = rental.customer_id
  join inventory on rental.inventory_id = inventory.inventory_id
  join film on film.film_id = inventory.film_id
  join film_category on film_category.film_id = film.film_id
  join category on category.category_id = film_category.category_id
  where category.name = param
  group by first_name, last_name,email;
end;
//
delimiter ;

call choose_movie("animation");


DELIMITER //
CREATE PROCEDURE movies_released (	IN param VARCHAR(20), 
						OUT param2 INT
					)
BEGIN
	SELECT * 
    FROM (	SELECT 	c.name AS category 
					, COUNT(fc.film_id) AS movies
			FROM film_category fc
			JOIN category c
				ON fc.category_id = c.category_id
			GROUP BY c.name) AS movie_table
	WHERE movies > param;
END;
  // 
DELIMITER ;

CALL movies_released(2000, @movies);