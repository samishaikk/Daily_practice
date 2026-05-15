use MyDatabase;

select * from orders;


-- find total number of orders

select count(*) as total_nr_orders from orders;


-- find total sales of all orders

select sum(sales) as total_sales from orders;


-- find highest& lowest sales of all orders

select
customer_id,
max(sales) as highest_sale,
min(sales) as lowest_sale
from orders
group by customer_id;

-- analyze scores in customer table
select id,
count(*) as scorecount,
sum(score) as total_score,
max(score) as highest_score,
min(score) as lowest_score
from customers
group by id;

select * from customers;