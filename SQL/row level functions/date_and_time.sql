use SalesDB;

--select OrderID,OrderDate,ShipDate,CreationTime from sales.Orders;

--select GETDATE() today;

--part extraction

--select CreationTime, year(CreationTime) year, month(CreationTime) month, day(CreationTime) day from sales.Orders

-- we can extract week, quarter
-- datepart(part,date)
-- datepart(month,Orderdate)

select 
orderid,
creationtime,
datename(month,creationtime) month_dn,
datename(weekday,creationtime) weekday_dn,
--datepart
DATEPART(year, CreationTime) year_dp,
datepart(month, CreationTime) month_dp,
datepart(hour, creationtime) hour_dp,
datepart(quarter, creationtime) quarter_dp
from sales.Orders;

--datetrunc
-- It removes day, hour, minute, seconds and gives the start of the month.

select 
OrderID,CreationTime,
DATETRUNC(day,creationtime)day_dt,
DATETRUNC(month,CreationTime)month_dt
from sales.Orders;

select datetrunc(year,creationtime)creation,
count(*) from sales.orders 
group by datetrunc(year,creationtime)

--eomonth
-- Returns last day of the month

select orderid,creationtime,
eomonth(creationtime)endofmonth,
datetrunc(month,creationtime)startofmonth
from sales.orders


--how many orders were placed each year?
select orderdate,count(*) NrOfOrders from sales.orders group by OrderDate
select year(orderdate), count(*) NrOforders from sales.orders group by year(orderdate)

select month(orderdate), count(*) NrOforders from sales.orders group by month(orderdate)

select datename(month,orderdate), count(*) NrOforders from sales.orders group by datename(month,orderdate)


--Data filtering

-- show all orderes that were placed during the month of feb
select * from sales.orders where month(orderdate)=2; 

--datatype output of each functions
--day month year datepart -> output is integer
--datename                -> output is string
--datetrunc               -> output is datetime
--eomonth                 -> output is date 




--understanding the logic
select orderid,creationtime,datepart(month,creationtime) month_dp from sales.orders;
select orderid,creationtime,datename(month,creationtime) month_dp from sales.orders;
select orderid,creationtime,datetrunc(month,creationtime) month_dp from sales.orders;

select orderid,creationtime,datepart(DAYOFYEAR,creationtime) dayofyear from sales.orders;
select orderid,creationtime,datepart(weekday,creationtime) month_dp from sales.orders;

