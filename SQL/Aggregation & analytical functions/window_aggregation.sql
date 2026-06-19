
-- WINDOW AGGREGATE FUNCTIONS

-- syntax -> avg(sales) over(partition by productid order by sales)


-- count() -> counts number of values in colum, regardless of their data types

-- find total no of orders

use SalesDB;
select * from sales.orders;
select 
count(*) totalorders
from sales.orders;

-- find total no of orders and additional details orderid, orderdate

select 
orderid, orderdate,
count(*) over() totalorders
from sales.orders;

-- find total orders for each customer

select 
	orderid, 
	orderdate,
	count(*) over() totalorders,
	count(*) over(partition by customerid) ordersbycustomers
from sales.orders


-- find total no of customers , additionally provide all customer details

select 
*,
count(*) over() totalcustomers,
count(score) over() totalscores
from sales.customers;

select * from sales.ordersarchive;

-- find total sales across all orders,and for each product 
select 
orderid, orderdate,sales,productid, 
sum(sales) over() totalsales,
sum(sales) over(partition by productid) salesbyproduct
from sales.orders;

-- find percentage contribution of each products' sales to total sales

select
orderid, productid, sales,
sum(sales) over() totalsales,
round(cast(sales as float) /sum(sales) over() *100,2) as Percentage_of_contribution
from sales.orders;

-- find average sales for each product

select orderid,sales,
avg(coalesce(sales,0)) over(partition by productid) Avgsales_by_products
from sales.orders;


-- find all orders where sales are higher than avg sales across all orders

select * from(
	select 
		orderid, productid, sales,
		avg(sales) over() avgsales
	from sales.orders)t

where sales>avgsales


-- find highest and lowest sales of all orders & for each product

select orderid, orderdate, productid, sales,

max(sales) over() highestsales,
min(sales) over() lowestsales,
max(sales) over(partition by productid) highestsalesbyproduct,
min(sales) over(partition by productid) lowestsalesbyproduct
from sales.orders;


-- show employees who have highest salaries+
select * from (
select 
*,
max(salary) over() highestsalary
from sales.employees
)t where salary = highestsalary;


-- find deviation of each sales from minimum and maximum sales amount

select 
	orderid,
	orderdate,
	productid,
	sales,
	max(sales) over() highestsales,
	min(sales) over() lowestsales,
	sales - min(sales) over() deviationfrommin,
	max(sales) over() - sales deviationfrommax
from sales.orders; 


-- calculate moving average of the sales for each product over time
select 
	orderid, 
	productid, 
	orderdate, 
	sales,
	avg(sales) over(partition by productid) avgbyproduct,
	avg(sales) over(partition by productid order by orderdate) movingavg
from sales.orders;


-- calculate moving average of the sales for each product over time, including only the next order 
select 
	orderid, 
	productid, 
	orderdate, 
	sales,
	avg(sales) over(partition by productid) avgbyproduct,
	avg(sales) over(partition by productid order by orderdate) movingavg,
	avg(sales) over(partition by productid order by orderdate rows between current row and 1 following) rollingavg
from sales.orders;

