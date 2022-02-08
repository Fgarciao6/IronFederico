use sakila;
select * from staff;

alter table staff drop column picture;

select * from customer
where first_name = 'tammy';

select * from staff;

insert into staff values(3,'tammy','sanders',79,'tammy.sanders@sakilacustomer.org',2,1,'tammy','abc','2006-02-15 04:57:20' );

select * from film
where title = 'Academy Dinosaur';

create table deleted_users (customer_id int(8), email text(25), date int(15)); 

select customer_id, email, create_date from customer 
where active = 0
group by customer_id, email, create_date;

select * from customer;
