CREATE TABLE EmployeeSales (
    SaleID INT PRIMARY KEY,
    EmployeeID INT,
    Department VARCHAR(50),
    SaleAmount DECIMAL(10, 2),
    SaleDate DATE
);

INSERT INTO EmployeeSales (SaleID, EmployeeID, Department, SaleAmount, SaleDate)
VALUES 
(1, 101, 'Electronics', 500.00, '2023-08-01'),
(2, 102, 'Electronics', 300.00, '2023-08-03'),
(3, 101, 'Furniture', 150.00, '2023-08-02'),
(4, 103, 'Electronics', 250.00, '2023-08-04'),
(5, 104, 'Furniture', 200.00, '2023-08-02'),
(6, 101, 'Furniture', 450.00, '2023-08-05'),
(7, 102, 'Electronics', 700.00, '2023-08-05'),
(8, 103, 'Furniture', 100.00, '2023-08-06');

select * from EmployeeSales;

-- Write a query to calculate the total sales amount for each department in the EmployeeSales table

select Department,sum(SaleAmount) as totalsales from EmployeeSales group by Department;


-- Write a query to count the number of sales made by each employee.

select EmployeeID,COUNT(*) AS NumberOfSales from EmployeeSales group by EmployeeID;


-- Write a query to calculate the average sale amount for each department.

select SaleID, SaleAmount, Department, Avg(SaleAmount) as average from EmployeeSales Group by SaleID,SaleAmount,Department;

select Department, Avg(SaleAmount) as average from EmployeeSales group by Department;


-- Write a query to find the total sales amount for each employee, but only include employees who have made more than one sale.

select EmployeeID, sum(saleamount) as totalsalesamount, COUNT(*) AS NumberOfSales from EmployeeSales group by EmployeeID having count(*)>1;


-- Write a query to find the total sales for each month in 2023

select datename(month,saledate) as salemonth,sum(saleamount) as totalsalesamount from EmployeeSales where year(saledate)=2023 
group by datename(month,saledate) 
order by salemonth;

--select month(saledate)as salemonth,sum(saleamount) as totsa from employeesales where year(saledate)=2023
--group by month(saledate)
--order by salemonth;   


