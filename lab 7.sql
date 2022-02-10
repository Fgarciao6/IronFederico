use sakila;

select * from actor;

select last_name, count(last_name) as group_last_name from actor
group by last_name
having (group_last_name) = 1
order by last_name;

select last_name, count(last_name) as group_last_name from actor
group by last_name
having group_last_name > 1
order by last_name;

select staff_id, count(rental_id)
from rental
group by staff_id;

select release_year, count(title) from film
group by release_year;

select rating, count(title) from film
group by rating;

select rating, round(avg(length)) as mean_length from film
group by rating;


select rating, round(avg(length)) as mean_length from film
group by rating
order by (mean_length) < 2;


