use sakila;
select count(distinct(last_name)) from actor;

select count(distinct(language_id)) from film;
select count(distinct(name)) from language;

select count(rating) from film
where rating = "PG-13";

select count(length) from film
where release_year = "2006";

select * from film
where release_year = "2006"
order by length desc limit 10;

select count(rental_date), datediff(day, "2005-05-24", "2005-05-31") from rental;



