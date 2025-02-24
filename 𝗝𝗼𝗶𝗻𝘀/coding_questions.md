### 9. How many records will be return by each join(eg. inner join, left join, right join etc)
- Ans: [click here](https://github.com/rohish-zade/SQL/blob/main/sql_tips_and_tricks/How%20_many_records_will_be_return_by_each%20_join.md)

### Q2. Retrieve a list of customers who have placed orders and those who have not placed orders (Full Outer Join).
  ```sql
  select c.customerid, c.customername, o.orderid
  from customers c
  full outer join orders o on c.customerid = o.customerid
  order by c.customerid;
  ```

### Q3. write a query to print dep name and average salary of employees in that dep.
  ```sql
  select d.dep_name, avg(salary) as avg_salary
  from employee e
  inner join dept d on e.dept_id=d.dep_id
  group by d.dep_name;
  ```

### Q4. write a query to print dep names where none of the emplyees have same salary.
  ```sql
  select d.dep_name, count(*) as total_salary_records, count(distinct e.salary) as   distinct_salary
  from employee e
  inner join dept d on e.dept_id=d.dep_id
  group by d.dep_name
  having count(distinct e.salary) = 1;
  ```

### Q5. Retrieve employees and their managers using a self join.
  ```sql
  select e1.emp_name as emp_name, e2.emp_name as manager_name
  from employee e1 
  inner join employee e2 on e1.manager_id=e2.emp_id;
  ```

### Q6. Find all employees who work in the same department as ‘Ankit’.
  ```sql
  --using self join(if we have only one table)
  select e1.emp_id, e1.emp_name, e1.dept_id
  from employee e1 
  inner join employee e2 on e1.dept_id=e2.dept_id
  where e2.emp_name='Ankit';
  
  -- using join and subquery(if we have two tables)
  select emp_id,emp_name, dept_id from employee where dept_id =
  (select e.dept_id from employee e
  inner join dept d on e.dept_id=d.dep_id and e.emp_name='Ankit')
  ```

### Q7. Find employees who earn more than their department’s average salary.
```sql
  with cte as (
    select d.dep_id, avg(e.salary) as avg_salary
    from employee e
    inner join dept d on e.dept_id=d.dep_id
    group by d.dep_id
  )
  select e.emp_id, e.emp_name, e.salary, e.dept_id
  from employee e
  inner join cte c on e.dept_id=c.dep_id
  where e.salary > c.avg_salary
  ```

### Q8. write a query to print manager names along with the comma separated list(order by emp salary) of all employees directly reporting to him.
  ```sql
  select e2.emp_name as manager_name, 
  string_agg(e1.emp_name, ',') within group (order by e1.salary) as reporting_empoyees
  from employee e1
  inner join employee e2 on e1.manager_id=e2.emp_id
  group by e2.emp_name
  ```

### Q9. Find employees working on multiple projects using a self join.
  ```sql
  select distinct e1.emp_id
  from employee_projects e1
  join employee_projects e2
  on e1.emp_id = e2.emp_id
  and e1.project_id <> e2.project_id;
  ```
### Q10. write a query to print emp name, manager name and senior manager name (senior manager is manager's manager)
  ```sql
  select e1.emp_name as emp_name, e2.emp_name as manager_name, e3.emp_name as   senior_manager
  from employee e1
  inner join employee e2 on e1.manager_id=e2.emp_id
  inner join employee e3 on e2.manager_id=e3.emp_id
  ```
