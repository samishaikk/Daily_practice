use SalesDB;


-- rank the orders based on their sales from highest to lowest 

select
	orderid,
	productid,
	sales,
	row_number() over(order by sales desc) salesrank_row,
	rank() over(order by sales desc) salesrank_rank,
	dense_rank() over(order by sales desc) salesrank_dense
from sales.orders; 

-- dense_rank() 
/*
assign a rank to each row
it handles ties
it doesn't leave gaps in rankings
*/


-- find top highest sales for each product
select * from (
	select 
		orderid,
		productid,
		sales,
		row_number() over(partition by productid order by sales desc) rankbyproduct
	from sales.orders
)t
where rankbyproduct = 1;

-- find lowest 2 customers based on their total sales
select 
	customerid,
	sum(sales) totalsales,
	row_number() over(order by sum(sales)) rankcustomers
from sales.orders
group by customerid

-- assign unique IDs to the rows of the 'Orders Archive'

select 
	row_number() over(order by orderid, orderdate) uniqueid,
	* 
from Sales.OrdersArchive;

-- identify duplicate rows in the table 'orders archive' and return a clean result without any duplicates

select * from (
	select
		row_number() over(partition by orderid order by creationtime desc)rn,
		*
	from sales.OrdersArchive
	)t 
where rn>1;


-- NTILE	
-- -> divide rows into specified no of approximately equal groups
select 
orderid, 
sales,
ntile(3) over(order by sales desc) Threebucket,
ntile(2) over(order by sales desc) twobucket
from sales.orders;

-- segment all orders into 3 categories; high, medium and low sales
select 
*,
case 
when buckets = 1 then 'high'
when buckets = 2 then 'medium'
when buckets = 3 then 'low'
end salesSegmentations
from(
	select 
		orderid, sales,
		ntile(3) over(order by sales desc) buckets
	from sales.orders
)t

-- in order to export data, divide orders into 2 groups
select
ntile(2) over(order by orderid) buckets,
* 
from sales.orders;


-- percentage-based ranking 
/*
-> cume_dist() = position number / no of rows
inclusive i.e., current row is included
            
-> percentage_rank() = calculates relative posiion of each row
                  = position nr-1 / no of rows-1
exclusive i.e., current row is excluded 
*/

-- find products that fall highest 40% of prices
select 
*,
concat(distrank*100,'%') distrankpercentage
from(
	select
		product,
		price,
		cume_dist() over(order by price desc) distrank
	from sales.products
)t
where distrank<=0.4

