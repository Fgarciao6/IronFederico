use sakila;

select * from category;
select * from film;
select * from film_category;

#List the number of films per category

select count(f.film_id) as num_films, c.name
from category as c
left join film_category as f
on c.category_id = f.category_id
group by c.name
order by c.name asc;

#Display the first and the last names, as well as the address, of each staff member.
Select * from address;
select * from staff;

Select s.first_name, s.last_name, a.address 
from staff as s
left join address as a
on s.address_id = a.address_id
order by s.first_name;

#Display the total amount rung up by each staff member in August 2005.

select * from payment;
select * from staff;

select s.first_name, s.last_name, sum(p.amount) as total_amount
from staff as s
left join payment as p
on s.staff_id = p.staff_id
where payment_date between "2005-08-01" and "2005-08-31"
group by s.first_name, s.last_name
order by s.first_name, s.last_name;

#List all films and the number of actors who are listed for each film.

select * from film;
select * from film_actor;

select f.title, sum(a.actor_id)
from film as f
left join film_actor as a
on f.film_id = a.film_id
group by f.title
order by f.title;

#Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.

select * from payment;
select * from customer;

select c.last_name, c.first_name, sum(p.amount) as total_amount
from customer as c
left join payment as p
on c.customer_id = p.customer_id
group by c.last_name, c.first_name
order by last_name asc;