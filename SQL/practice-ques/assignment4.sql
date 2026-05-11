CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(100)
);

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(101, 'Human Resources'),
(102, 'Finance'),
(103, 'IT');

select * from employees; 
select * from departments;

-- Write a SQL query to list the names of employees along with the names of the departments they work in.

SELECT e.firstname, e.lastname, d.departmentname from employees e join departments d on e.Departmentid = d.departmentid;


-- Write a SQL query to list all the departments and the employees working in them, including departments with no employees.

select d.departmentname, e.firstname, e.lastname from departments d left join employees e on d.DepartmentID = e.departmentid;


-- Write a SQL query to find the names of employees who do not belong to any department (i.e., no matching department ID)

select e.firstname, e.lastname from employees e left join departments d on e.DepartmentID = d.DepartmentID where d.departmentid = null ;


-- Write a SQL query to list the names of employees who work in the same department as 'Jane Doe'.

    select firstname, lastname from employees where departmentid = (select departmentid from employees where firstname = 'Jane' and lastname = 'Doe')


-- Write a SQL query to find the department with the highest total salary paid to its employees

select d.departmentname, sum(e.salary) as totalsalary from employees e join departments d on e.departmentid = d.departmentid group by d.departmentname order by totalsalary desc;


