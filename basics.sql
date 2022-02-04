use bank;

select * from client
where district_id = "1" limit 5;

select max(client_id) from client
where district_id = "72";

select amount from loan
order by amount asc
limit 3;

select distinct(status) from loan
order by status asc;

select loan_id from loan
order by payments
limit 1;

select account_id, amount from loan
order by account_id asc
limit 5;









