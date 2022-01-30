use sakila;
SELECT * FROM actor, film, customer;
select title from film;
select distinct language_ID as language
from film;
select count(store_id) from store;
select manager_staff_id from store