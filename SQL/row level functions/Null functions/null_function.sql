use SalesDB;
/* 
NULL function
-> means nothing, unknown!
-> not equal to anything i.e., 
-> not zero, not empty string, not blankspace
*/

-- isnull() -> replaces null with specified value
-- isnull(value, replacement_vlue)
-- isnull(shipping_address, 'unknown') <- default value

/*
Is value null? 
if yes -> replacement
if no -> value
*/

-- COALESCE() 
-- returns first non-null value from list
-- coalesce(value1,value2,value3,...)
-- coalesce(shipping_address,billing_address)
-- coalesce(shipping_address,billing_address,'unknown')

/*
isnull vs coalesce

is null 
-> limited to two values 
-> fast
-> sqlserver - isnull
   oracle - nvl
   mysql - if null

coalesce
-> unlimited
-> slow
-> available in all databases
*/


-- USE CASE -> Handle the null before doing data aggregations

-- Find average scores of customers
select 
customerid,score
from sales.Customers; -- here last customer score is 0

select customerid,score,
avg(score) over() avgscores,
avg(coalesce(score,0)) over() avgscore2
from sales.Customers
--group by AVG(score);


-- USE CASE -> handle null before doing mathematical operations

/*
diplay full name of customers in single field by merging their 
first and last names, and add 10 bonus points to each customres's score
*/

select 
CustomerID,FirstName,LastName,
firstname+' '+lastname as fullname,
--coalesce(LastName,'')lastname2,
firstname + ' ' + coalesce(LastName,'') as fullname2,
Score,
coalesce(score,0) + 10 as scorewithbonus
--score + 10 as scorewithbonus
from sales.Customers;

--understanding logic
/*
select firstname+''+lastname as fullname -> we get null for mary bcz last name is null
for that we use coalesce
coalesce(lastname,'')
select firstname + ''+ coalesce(lastname,'') as fullnamee
*/


-- USECASE -> handle null before joining tables

-- sort customers from lowest to highest scores, 
-- with nulls appearing last

select customerid,score from sales.customers;

select customerid,score,coalesce(score,9999) [acsorder]
from sales.customers
order by coalesce(score,9999); 

select customerid,score,
case when score is null then 1 else 0 end flag
from sales.customers;

select customerid,score
from sales.customers
order by case when score is null then 1 else 0 end,score;

-- null if
-- nullif (val1, value2)
-- if value1=value2, then null else return value1


-- find sales price for each order by dividing sales by quantity

select * from sales.Orders;

select OrderID,Sales,Quantity,
/*Sales/Quantity as Price*/
sales/nullif(quantity,0) as price
from  
sales.Orders;

-- identify customers who have no scores

select * from sales.Customers where score is null;
select * from sales.Customers where score is not null;

-- list all details for customers woh have not placed any orders

select 
c.*,
o.orderid
from sales.customers c
left join sales.orders o
on c.customerid = o.customerid

