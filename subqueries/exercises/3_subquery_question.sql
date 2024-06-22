/* 3. From the following table, write a SQL query to find those employees who work as 
'MANAGERS' and 'ANALYST' and working in ‘SYDNEY’ or ‘PERTH’ 
with an experience more than 5 years without receiving the commission. 
Sort the result-set in ascending order by department location. 
Return employee ID, employee name, salary, and department name. */

select e.emp_id, e.emp_name, e.salary, d.dep_name
from employees e
inner join department d
on e.dep_id = d.dep_id and d.dep_location in ('SYDNEY','PERTH')
and e.job_name in ('MANAGER','ANALYST')
and datediff(y, e.hire_date, CURRENT_TIMESTAMP) > 5 
and e.commission is null;
