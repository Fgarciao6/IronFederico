SELECT * FROM sakila.actor;

select * from actor
where first_name='Scarlett';

select * from actor
where last_name='johansson';

select count(film_id) from film;

select count(rental_id) from rental;

select MAX(rental_duration) from film;

select MAX(length) from film;

select Min(length) from film;

select AVG(length) from film;

SELECT time_FORMAT('lenght', '%r') FROM film;





