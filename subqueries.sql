use sakila;

#How many copies of the film Hunchback Impossible exist in the inventory system?

select film_id
from film
where title = "Hunchback Impossible";

select count(inventory_id) as copies
from inventory
where film_id = (select film_id
from film
where title = "Hunchback Impossible");

#List all films whose length is longer than the average of all the films.

select round(avg(length))
from film;

select title, round(avg(length)) as avg_length
from film
group by title
having avg_length > (select round(avg(length))
from film);

#Use subqueries to display all actors who appear in the film Alone Trip.

select film_id
from film
where title = "Alone Trip";

select actor_id
from film_actor
where film_id = (select film_id
from film
where title = "Alone Trip");

select concat(first_name, " ", last_name) as name
from actor
where actor_id in(select actor_id
from film_actor
where film_id = (select film_id
from film
where title = "Alone Trip"));

#Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.

select category_id
from category
where name = "family";

select film_id
from film_category
where category_id = (select category_id
from category
where name = "family");

select title 
from film
where film_id in (select film_id
from film_category
where category_id = (select category_id
from category
where name = "family"));

#Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.

select country_id
from country
where country = "canada";

select city_id
from city
where country_id = (select country_id
from country
where country = "canada");

select address_id
from address
where city_id in (select city_id
from city
where country_id = (select country_id
from country
where country = "canada"));

select concat(first_name, " ", last_name) as name, email
from customer
where address_id in (select address_id
from address
where city_id in (select city_id
from city
where country_id = (select country_id
from country
where country = "canada")));

select c.city_id, a.address
from city c
join country
using (country_id)
where country ="canada"
join address a
using (address_id);

#Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.

select actor_id, count(film_id)
from film_actor
group by actor_id
order by count(film_id) desc
limit 1;

select film_id
from film_actor
where actor_id = (select actor_id, count(film_id)
from film_actor
group by actor_id
order by count(actor_id) desc
limit 1);

#Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments

select customer_id, sum(amount) as sum_payments
from payment
group by customer_id
order by sum_payments desc
limit 1;

select c.first_name, c.last_name
from customer c
join payment p
using (customer_id)
where customer_id = (select customer_id, sum(amount) as sum_payments
from payment
group by customer_id
order by sum_payments desc
limit 1);

#Get the client_id and the total_amount_spent of those clients who spent more than the average of the total_amount spent by each client.
