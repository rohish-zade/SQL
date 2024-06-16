--1. From the following table, write a SQL query to find the managers. 
--Return complete information about the managers.

select * from employees
where emp_id in (
    select manager_id from department
)


/*
Explanation:
The said query in SQL that selects all columns from the 'employees' table where the "emp_id" value is found in the results of a subquery. The subquery selects the "manager_id" values from the 'employees' table. The query likely returns a list of employees who are also managers.
*/

--Alternative Solutions: 

--Using EXISTS
select * from employees e1
where EXISTS (
    select 1 from employees e2
    where e2.manager_id=e1.emp_id
)

--  The subquery checks for the existence of at least one record where 'manager_id' matches 'emp_id' from the outer query

--Using a Correlated Subquery:
select * from employees
where emp_id = ANY (
    select manager_id from employees
    where manager_id is not null
)
-- The subquery selects 'manager_id' values from the 'employees' table, excluding NULL values
-- The main query selects all records from 'employees' where 'emp_id' matches ANY 'manager_id' value from the subquery
