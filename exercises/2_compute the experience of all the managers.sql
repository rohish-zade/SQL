/*
 From the following table, write a SQL query to compute the experience of all the managers. 
 Return employee ID, employee name, job name, joining date, and experience.
 experience format: 26 years 2 mons 17 days 
*/

select emp_id,emp_name,job_name,hire_date,  as exxperience
from employees 
where emp_id in (
    select manager_id from employees
)
