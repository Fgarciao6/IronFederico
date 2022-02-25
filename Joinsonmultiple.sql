#Write a query to display for each store its store ID, city, and country.

use sakila;

select * from country;
select * from store;
select * from address;
select * from city;

select s.store_id, c.city, co.country
from store as s
join address as a
using (address_id)
join city as c
using (city_id)
join country as co
using (country_id);

#Write a query to display how much business, in dollars, each store brought in.

select * from film;
select * from payment;
select * from staff;
select * from store;

select s.store_id, sum(p.amount)
from store as s
join customer as c
on s.store_id = c.store_id
join payment as p
on c.customer_id = p.customer_id
group by store_id
order by store_id;


#What is the average running time of films by category?

# category-film_category-film

select * from category;

select c.name, avg(f.length) as average_length
from category as c
join film_category as fc
using(category_id)
join film as f
using (film_id)
group by c.name
order by c.name;

#Which film categories are longest?

create temporary table average_length
select c.name, avg(f.length) as average_length
from category as c
join film_category as fc
using(category_id)
join film as f
using (film_id)
group by c.name
order by c.name;

select name, average_length
from average_length
order by average_length desc;

#Display the most frequently rented movies in descending order.

#film-inventory_id

select * from rental;
select * from inventory;
select * from film;

select f.title, count(i.inventory_id) as num_rental
from film as f
join inventory as i
using (film_id)
group by f.title
order by f.title;

create temporary table total_num_rental
select f.title, count(i.inventory_id) as num_rental
from film as f
join inventory as i
using (film_id)
group by f.title
order by f.title;

select title, num_rental
from total_num_rental
order by num_rental desc;

#List the top five genres in gross revenue in descending order.

select * from category;
select * from payment;
select * from film;
select * from film_category;

create temporary table total_revenue_category
select c.name, sum(f.rental_rate * f.rental_duration) as total_revenue
from category as c
join film_category as fc
using(category_id)
join film as f
using (film_id)
group by c.name
order by c.name;

select name, total_revenue
from total_revenue_category
order by total_revenue desc;


#Is "Academy Dinosaur" available for rent from Store 1?

select * from film;
select * from rental;
select * from store;
select * from address;
select * from inventory;

select f.title, s.store_id
from film as f
join inventory as i
using (film_id)
join store as s
using (store_id)
where f.title = "Academy Dinosaur" and store_id = 1;