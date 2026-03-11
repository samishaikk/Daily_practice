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
 


-- FORMAT & CASTING
-- YYYY--MM--DD & HH:mm:ss  

-- FORMATTING
-- changing format of value from one to another
-- changing how the data looks

--c -> currency 
--p -> percentage

-- CASTING 
-- changing data type from one to another
-- cast() or convert()
-- string to number , date to string, etc...

-- SYNTAX 
-- FORMAT(value, format [,culture])

-- default culture = 'en-US'



-- task
-- show cret.time using following format
-- day wed jan q1 2025 12:34:56PM


select 
orderid,CreationTime,
format(creationtime,'yyyy-MM-dd')standard,
format(creationtime,'MM-dd-yyyy')USA_format,
format(creationtime,'dd')dd,
format(creationtime,'ddd')ddd,
format(creationtime,'dddd')dddd,
format(creationtime,'M')m,
format(creationtime,'MM')mm,
format(creationtime,'MMM')mmm
from sales.orders;

  
select format(orderdate, 'MMM yy')Orderdate,count(*) from sales.orders group by format(orderdate, 'MMM yy');


-- CONVERT()
-- syntax
-- convert(data_type, value [,style])
-- default value for style = 0

select 
convert(int,'123') as [string to int convertion],
convert(date,'2026-3-11') as [string to date],
creationtime,
convert(date,creationtime) as [datetime to date],
convert(varchar,creationtime,32) as [usa std. Style:32]
from sales.orders;

-- CAST() -> value to specified datatype
-- syntax
-- cast(value as data_type)

select 
cast('123' as int) as [string to int],
cast(123 as varchar) as [int to string],
cast('2026-3-11' as date) as [string to date],
creationtime,
cast(creationtime as date) as [datetime to date]
from sales.Orders;

-- FORMAT VS CONVERT VS CAST

 /*
 CAST ->
 for casting -> anytype to anytype
 for formatting -> no formatting

 CONVERT ->
 for casting -> anytpe to anytype
 for formatting -> formats only date&time

 FORMAT ->
 for casting -> anytype to only STRING
 for formatting -> formates date&time, numbers
*/
 
