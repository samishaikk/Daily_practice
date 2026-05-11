-- Write a SQL query to select all columns and rows from the Employees table.

select * from employees;


-- Write a SQL query to find the names and email addresses of all employees who work in the department with DepartmentID = 101.

select firstname, lastname, email,departmentid from employees where departmentid = 101;


-- Write a SQL query to find the total number of employees in the Employees table.

select count(employeeid) as total_num_of_employees from employees;
select count(*) as tne from employees;

-- Write a SQL query to find the details of employees who were hired in the year 2020.

select * from employees where year(hiredate) = 2020;


-- Write a SQL query to update the salary of 'Jane Doe' to 90,000.

update employees set salary = 90000 where firstname = 'Jane' and lastname = 'Doe'

select * from employees;