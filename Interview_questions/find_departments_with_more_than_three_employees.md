### Find Departments with More Than Three Employees

Given below two tables, find Departments with More Than Three Employees
- employee(emp_id, emp_name, dept_id, salary)
- dept(dep_id, dep_name)

To find departments with more than three employees, you can use a GROUP BY with a HAVING clause in SQL.

  ```sql
  select d.dep_id, d.dep_name, count(1) from employee e
  inner join dept d on e.dept_id=d.dep_id
  group by d.dep_id, d.dep_name
  having count(1) > 3
  ```