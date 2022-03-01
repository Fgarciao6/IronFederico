use sakila;

select * from film;
select * from film_actor;

#Get all pairs of actors that worked together.

select f1.film_id, f2.actor_id as actor_id1, f1.actor_id as actor_id2
from film_actor as f1
join film_actor as f2
on f1.film_id = f2.film_id
and f1.actor_id <> f2.actor_id;

#Get all pairs of customers that have rented the same film more than 3 times.

select * from customer;
select * from rental;

create temporary table num_customers_rental
select r1.inventory_id, r2.customer_id as customer_1, r1.customer_id as customer_2
from rental as r1
join rental as r2
on r1.inventory_id = r2.inventory_id
and r1.customer_id <> r2.customer_id;

create temporary table sum_num_rentals
select customer_1, customer_2, inventory_id, sum(inventory_id) as num_of_rentals
from num_customers_rental
group by customer_1, customer_2, inventory_id;

select * from sum_num_rentals;

select inventory_id, sum(num_of_rentals) as total_num_rentals
from sum_num_rentals
group by inventory_id;

#Get all possible pairs of actors and films.

select * from film;

select f1.film_id, f2.actor_id as actor_id1, f1.actor_id as actor_id2
from film_actor as f1
join film_actor as f2
on f1.film_id = f2.film_id
and f1.actor_id <> f2.actor_id;