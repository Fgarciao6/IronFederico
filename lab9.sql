use sakila;



#Create a table rentals_may to store the data from rental table with information for the month of May.

select * from rental where rental_date like '%-05-%';

create table rentals_may as (
	select *
    from rental
    where rental_date like '%-05-%');
    
#Create a table rentals_june to store the data from rental table with information for the month of June.

#Insert values in the table rentals_june using the table rental, filtering values only for the month of June.    
    
    create table rentals_jun as (
	select *
    from rental
    where rental_date like '%-06-%');
    

#Check the number of rentals for each customer for May.
    
select customer_id, count(rental_id) as num_rentals
from rentals_may
group by customer_id
order by num_rentals desc;

#Check the number of rentals for each customer for June.

select customer_id, count(rental_id) as num_rentals
from rentals_jun
group by customer_id
order by num_rentals desc;


    
