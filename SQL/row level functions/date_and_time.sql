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
