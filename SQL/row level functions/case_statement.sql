-- CASE STATEMENT 

/*

- evalutes list of coniditons & returns value when first condition is met

- SYNTAX

case
when condition 1 then result1
when condition 2 then result2
else result
end
*/

-- MAIN PURPOSE IS DATA TRANSFORMATION

-- helps us derive new information for analytics

-- USECASE -> categorizing data - group data into diff categories based on certain conditions

/* Generate a report showing total sales for each category
High(sales over 50), medium(21-50), low(sales 20 or less)
Sort the categories from highest sales to lowest 
*/

use SalesDB;

select orderid,sales,
case 
    when sales > 50 then 'high'
    when sales > 20 then 'medium'
    else 'low'
end category_of_sales
from sales.orders;

select cateogory,sum(sales) as totalsales
from(
    select orderid, sales, 
    case
        when sales>50 then 'high'
        when sales>20 then 'medium'
        else 'low'
    end cateogory
    from sales.orders
)t
group by cateogory
order by totalsales desc

-- RULES 

-- date type of result should be matching
-- case statement can be used anywhere in the query

-- USE CASE 2 -> mapping values - transform values one from to another

-- retrieve employee details with gender displayed as full text

select employeeid,firstname,lastname, 
gender,
    case 
        when gender = 'f' then 'female'
        when gender = 'm' then 'male'
        else 'not available' 
    end gender_full_text
from sales.employees;


-- retrieve customer details with abbreviated country code
select customerid, firstname, lastname,country,
case
    when country = 'Germany' then 'ge'
    when country = 'USA' then 'us' 
    else 'n/a'
end countryabbr
from sales.customers;

select distinct country from sales.customers;


-- QUICK FORM 
/*
case country
        when 'germany' then 'ge'
        when 'india' then 'in'
        when 'italy' then 'it'
        else 'n/a'
end
*/

-- USE CASE 3 -> handling nulls - replace nulls with specific values

-- find avg scores of customers and treat nulls as 0 
-- and additional provide details such as customerid & lastname

select customerid, lastname, score,
case  
    when score is null then 0 
    else score
end scoreclean,

avg(case
        when score is null then 0
        else score 
    end) over() avgcustomerclean,
avg(score) over() avg_score 
from sales.customers;


-- count how many times each customer has made an order with sales greater than 30

select * from sales.orders;


select customerid,
    sum(case
        when sales>30 then 1
        else 0
    end) totalorders_higherthan30,
    count(*) totalorders
from sales.orders
group by customerid;

-- SUMMARY
/*
-> datatype of results must be matching
-> derive new information 
-> use cases - categorizing data, mapping values, handling nulls, conditinal aggregations
*/
