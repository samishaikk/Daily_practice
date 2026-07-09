-- LEAD() -> access a value from next row within a window
-- LAG() -> access a value from previous row within a window

-- syntax
-- lead(sales,2,10) over(partition by productid order by orderdate)

-- -> offset(here 2) -> no of rows forward or backward from current row;default = 1
-- -> default(here 10) -> return default value if next/previous row is not available; default = NULL

use SalesDB;

-- analyze month-over-month(MoM) performance by finding percentage change
-- in sales between current and previous month

select 
*,
CurrentMonthSales - PreviousMonthsales as Mom_Change,
round(cast((currentmonthsales - PreviousMonthSales) as float)/PreviousMonthSales * 100, 1) as MonthOverMonth_perc
from(
	select 
		orderid,
		month(orderdate) ordermonth,
		sum(sales) currentmonthsales,
		lag(sum(sales)) over(order by month(orderdate)) PreviousMonthSales,
		sales
	from sales.orders
	group by orderid,month(orderdate),sales
)t

-- in order to analyze customer loyalty ,
-- rank customers based on average days between their orders

select 
customerid,
avg(Daysuntil_nxt_order)avg_days,
rank() over(order by coalesce(avg(Daysuntil_nxt_order),99999)) rank_avg
from(
	select
	orderid,
	customerid,
	orderdate Current_order,
	lead(orderdate) over(partition by customerid order by orderdate) Nxt_order,
	datediff(day,orderdate,lead(orderdate) over(partition by customerid order by orderdate)) Daysuntil_nxt_order
	from sales.orders
)t
group by customerid


-- find lowest and highest sales for each product

select 
	orderid,
	productid,
	sales,
	first_value(sales) over(partition by productid order by sales) Lowest_sales,
	last_value(sales) over(partition by productid order by sales
	rows between current row and unbounded following) Highest_sales,
	sales - first_value(sales) over(partition by productid order by sales) Sales_difference
from sales.orders

-- SUMMARYY
/*
-> allow access specific value from another row

Types 
previous value - lag()
next value - lead()
first value - first_value()
last value - last_value()

Rules  
expression -> any data type
order by -> required
frame -> optional 

Use cases 
time series analysis -> Mom +Yoy
time gaps analysis -> customer retention
comparision analysis -> extreme - highest & lowest
*/