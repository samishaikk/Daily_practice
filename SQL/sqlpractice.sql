USE MyDatabase;

--select * from dbo.customers;

--select * from orders;

--select customer_id,order_id from orders;

--select first_name,country,score from customers;

--select * from dbo.sysdiagrams;

--select * from customers where score<500;

--select * from customers where score!= 0;

--select * from customers where country='germany';

--select first_name from customers where country = 'germany';

--select * from customers order by score desc;

--select * from customers order by score asc;

--select * from customers order by country asc, score desc;

--select * from customers order by score desc, country asc;

--select country,first_name, sum(score) as total_score from customers group by country,first_name;

--select sum(score) as total_score,count(id) as total_customers from customers group by country;

/* Having */

--select country, AVG(score) as avg_score from customers where score!=0 group by country having avg(score)>430;

/* distinct */

--select distinct country from customers;

--select top 3 * from customers; 

--select top 3 * from customers order by score desc;

--select top 2 * from customers order by score asc;

/* get two most recent orders */

--select top 2 * from orders order by order_date desc;

--select * from customers; select * from orders;

/* static values */

--select id,first_name, 'newcustomer' as customer_type from customers;

/* highlight & execute */

--select * from customers where country = 'germany';
--select * from orders;

/* create table called persons with columns: id,personname,birthdate and phone*/

/* create table persons(
id int not null,
person_name varchar(50) not null,
birth_date date,
phone varchar(20) not null,
constraint prkey_persons primary key (id)
) */

--select * from persons;

--alter table persons add email varchar(30) not null;

--alter table persons drop column phone;
--select * from persons;

--drop table persons;

/* manipulate */

--insert into customers (id,first_name,country,score) 
--values (7,'anne','USA',null),
--       (8,'sam',null,100);


/* insert data from 'customers' into 'persons' */
--create table persons(
--id int not null,
--person_name varchar(50) not null,
--birth_date date,
--phone varchar(20) not null,
--constraint prkey_persons primary key (id))

--select * from persons;

--insert into persons (id,person_name,birth_date,phone) select id,first_name,null,'unknown' from customers;

/* change score of customer 6 to 0 */

--update customers set score = 0 where id = 7;

--update customers set score = 999,country='NZ' where first_name='Peter';

--update customers set score = 0 where score is null;

--delete from customers;

/*
insert into customers (id,first_name,country,score) 
values (6,'Anna','USA',0),
      (7,'Sam',null,100),
      (8,'Aria','Germany',99),
      (9,'Andreas','Mexico',50);
      */

/* delete all data from table persons*/

--truncate table persons

/* where condition */

--select * from customers where country='usa';

--insert into customers (id,first_name,country,score) values (1,'Maria','Germany',350),(2,'John','USA',900),(3,'George','UK',750),(4,'Martin','Germany',500),(5,'Peter','USA',0);

--update customers set score = 1000 where first_name='Anna';

--select * from customers;

--select * from customers where country != 'GERMANY';

--select * from customers where score>500;

--select * from customers where score>= 500;

--select * from customers where score<99;

--select * from customers where score <=99;

--select * from customers where country='USA' and score>500;

--select * from customers where country = 'germany' or score>500;

--select * from customers where not score < 500;

--select * from customers where score between 100 and 500;

--select * from customers where score>=100 and score<=500; /* this command to be preffered for clairty */

/* retreive all customers from either germany or usa */

--select * from customers where country = 'germany' or country = 'usa';
--select * from customers where country in ('germany','usa'); -- to be preferred

/* LIKE -> searching patterns */

--select * from customers where first_name like 'M%';
--select * from customers where first_name like '%n';

/* find customers whose first name contains 'r' */

--select * from customers where first_name like '%r%';

--select * from customers where first_name like '__r%';

/* INNER JOIN */

--select * from customers;
--select * from orders;

--select * from customers inner join orders on id=customer_id;

--select customers.id,first_name,orders.order_id,sales from customers inner join orders on id=customer_id

--select 
--    customers.id,
--    customers.first_name,
--    orders.order_id,
--    orders.sales
--from customers inner join orders on customers.id=orders.customer_id;


--select 
--    c.id,
--    c.first_name,
--    o.order_id, 
--    o.sales 
--from customers as c inner join orders as o on c.id=o.customer_id;

--select 
--    c.id,
--    c.first_name,
--    o.order_id,
--    o.sales 
--from customers as c left join orders as o on c.id=o.customer_id;

 
--select 
--    customers.id,
--    customers.first_name,
--    orders.order_id,
--    orders.sales
--from customers right join orders on customers.id=orders.customer_id;


/* full join */

--select * from customers full join orders on customers.id = orders.customer_id;

/* advanced sql */

/* left anti join -> return from left that has NO MATCH in right */

--select * from customers as c left join orders as o on c.id=o.customer_id where o.customer_id is null;

--select * from customers as c left join orders as o on c.id=o.customer_id; 

--select * from customers as c full join orders as o on c.id = o.customer_id where c.id is null or o.customer_id is null;


--select * from customers as c left join orders as o on c.id=o.customer_id where country is not null and customer_id is not null;


/* cross join */

--select * from customers as c cross join orders as o;

--use SalesDB;

--select 
--    o.OrderID,
--    o.Sales,
--    c.FirstName as customerfirstname,
--    c.LastName as customerlastname,
--    p.Product as ProductName,
--    p.Price,
--    e.FirstName as employeefirstname,
--    e.LastName as employeelastname
--from Sales.Orders as o left join Sales.Customers as c on o.CustomerID=c.CustomerID 
--left join Sales.Products as p on o.ProductID=p.ProductID
--left join sales.Employees as e on o.ProductID=e.EmployeeID;



/* SET OPERATORS */

--select FirstName,LastName from sales.Customers
--union
--select FirstName,LastName from sales.Employees;

--select FirstName,lastname from sales.Customers
--union
--select firstname,lastname from sales.Employees;

--select customerid,lastname from sales.customers
--union
--select EmployeeID,lastname from sales.Employees

-- union all -> return all rows from both queries, including duplicates 

-- use union all for faster performance and to find duplicates and quality issues

--select FirstName,LastName from sales.Customers
--union all
--select FirstName,LastName from sales.Employees;


--except 

--select FirstName,LastName from sales.Employees
--except
--select FirstName,LastName from sales.Customers;   


-- intersect 

--select FirstName,LastName from sales.Employees
--intersect
--select FirstName,LastName from sales.Customers;   


-- combine data

--select  
--'Orders' as sourcetable,
--[OrderID]
--      ,[ProductID]
--      ,[CustomerID]
--      ,[SalesPersonID]
--      ,[OrderDate]
--      ,[ShipDate]
--      ,[OrderStatus]
--      ,[ShipAddress]
--      ,[BillAddress]
--      ,[Quantity]
--      ,[Sales]
--      ,[CreationTime]
--from sales.Orders
--union
--select 
--'OrdersArchive' as sourcetable,
--[OrderID]
--      ,[ProductID]
--      ,[CustomerID]
--      ,[SalesPersonID]
--      ,[OrderDate]
--      ,[ShipDate]
--      ,[OrderStatus]
--      ,[ShipAddress]
--      ,[BillAddress]
--      ,[Quantity]
--      ,[Sales]
--      ,[CreationTime]
--from sales.OrdersArchive;




/* FUNCTIONS */

--concat
--select first_name,country, concat(first_name,'-',country) as name_country from customers;

--lowercase
--select lower(first_name) as lowercase from customers;

--uppercase
--select upper(first_name) as uppercase from customers;

--trim
--select first_name,len(first_name) as len_name,len(trim(first_name)) as len_trim_name from customers; 

--replace

--select('....')as ...,replace('filename','what to replace','what to put')as ....

-- length

--select first_name,len(first_name) as length from customers;

-- extract

--select first_name,left(trim(first_name),2) as first_2_char from customers;

--select first_name,right(first_name,2) as last_2_char from customers;

-- removing firstcharacter using substring
 
--select first_name, SUBSTRING(first_name,2,len(first_name)) as subname from customers;

