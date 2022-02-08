use bank;

SELECT * FROM bank.order;

select amount from bank.order
where account_to = 30067122;

select trans_id, trans.date, trans.type, amount from trans
where account_id = 793 
order by trans.date desc; 

select district_id, count(client_id) as num_of_clients from client
where district_id <10 
group by district_id
order by district_id asc;

select type, count(card_id) as num_of_cards from card
group by card.type
order by num_of_cards desc;

select account_id, sum(amount) as sum_amount from loan
group by account_id
order by sum_amount desc
limit 11;

select loan.date, count(loan_id) as num_loan_perday from loan
where loan.date < 930907
group by loan.date
order by num_loan_perday desc;


select date, duration, count(loan_id) as num_loan from loan
where date between 971201 and 971231
group by date, duration
order by date, duration asc;

select account_id, type, sum(amount) as total_amount from trans
where account_id = 396
group by account_id, type
order by type asc;



