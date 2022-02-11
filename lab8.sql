SELECT * FROM sakila.category;

# How many films are there for each of the categories in the category table. Use appropriate join to write this query
select d.name, count(film_id) as num_film
from category as d
join film_category as c
on d.category_id = c.category_id
group by d.name;


#Which actor has appeared in the most films?
select d.first_name, last_name, count(film_id) as num_film
from actor as d
join film_actor as c
on d.actor_id = c.actor_id
group by d.first_name, d.last_name
order by num_film desc
limit 1;

#Most active customer (the customer that has rented the most number of films)
select c.customer_id, d.first_name, last_name, count(r.rental_id) as num_rent
from customer as c
join rental as r
on d.customer_id = r.customer_id
group by d.first_name, d.last_name
order by num_rent desc
limit 1;

select * from rental;
select * from customer;

use sakila;

#Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.

select title, length, rank() over (order by length desc) as "rank" from film where title is not null;

#Rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, rating and the rank.

select title, length, rating, rank() over (partition by rating  order by length desc) as "rank" from film where title is not null;