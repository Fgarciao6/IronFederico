use sakila;

select rating from film;

select release_year from film;

select * from film
where title like ('%armageddon%');

select * from film
where title like ('%apollo%');

select * from film
where title like ('%apollo');

select * from film
where title like ('%date%');

select * from film
order by length(title) desc
limit 10;

select * from film
order by length desc
limit 10;

select count(film_id) from film
where special_features like ('%behind the scenes%');

select * from film
order by release_year and title;

