-- window functions

-- perform calculations (eg. aggregation) on specific subset of data without losing level of details of rows
/*
group by - simple;
window  - aggregations + simple 
*/

-- find total sales across all orders

use SalesDB;

select sum(sales) totalsales from sales.orders;


-- find total sales for each product

select productid, sum(sales) as totalsales from sales.orders group by productid

-- additionally provide details
select orderid, orderdate, productid, sum(sales) as totalsales from sales.orders group by productid, orderid, orderdate
/*
group by limits 
can't do aggregations and provide details at same time
*/

-- over() in the sense we're talking about window functions

-- window functions returns a result for each row
select 
	orderid,
	orderdate,
	productid,
	sum(sales) over(partition by productid) totalsales_byproduct
from sales.orders;
/*
window functions 
-> aggregate functions - count,sum,avg,max,min
-> rank functions - row_number,rank,dense_rank,cume_dist,percent_rank,ntile
-> value (analytics) functions - lead,lag,first_value,last_value
*/

/*
partition by - divides the result into windows
-> divides the rows into groups, based on the columns

-> without partition by, while calculation whole data will be counted as one widow

-> with partition by, calculation done individualy one each window

without p.by -> select sum (sales) over()
p.by single column -> sum(sales) over(partition by product)
p.by combined columns -> sum(sales) over(partition by product, orderstatus)
*/


-- find total sales across all orders; additionally provide details such as orderid & order date

select orderid, orderdate, sum(sales) over() TotalSales from sales.orders;
  
-- find total sales for each product; additionallly provide orderid, orderdate

select orderid, orderdate, productid, sum(sales) over(partition by productid) totalsales from sales.orders;

-- find total sales, all orders, each product and provide details too.

select orderid, orderdate, productid, sum(sales) over() totalsales, sum(sales) over(partition by productid) by_productid from sales.orders;

-- rank each order based on their sales from highest to lowest
-- additionally provide details such as orderid, orderdate

select 
orderid, orderdate, sales,
rank() over(order by sales desc) ranksales
from sales.orders;

select orderid, orderdate, orderstatus,
sales,
sum(sales) over(partition by orderstatus order by orderdate
rows between current row and 2 following) totalsales
from sales.orders;

-- default frame 
/*
sql uses default frame, if order by is used without frame
order by always uses a frame
*/


-- RULES , LIMITATIONS 
/*
1. Window funcs can be used only in select and order by clauses
Can't be used to filter data eg: where ..>100
2. Nesting window functions is not allowed
3. SQl executes window functions afer WHERE clause
4. Window function can be used together with group by 
*/

-- find total sales for each order status only for two products 101 & 102
select 
orderid, orderdate, orderstatus, productid, 
sum(sales) 
over(partition by orderstatus) totalsales from sales.orders;


-- rank customers based on their total sales

select 
customerid,sum(sales) as totalsales,
rank() over(order by sum(sales)desc) rankcustomers
from sales.orders 
group by customerid;

-- CONCLUSION
-- performs calculations on subset of data without losing details
-- use group by + window in same query, only if same column
