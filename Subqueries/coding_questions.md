### Dataset
```sql
-- create a table
create table empployee_tbl (
empid int primary key,
empname varchar(50),
department varchar(50),
salary int,
joindate date
);

-- insert values into table
insert into empployee_tbl (empid, empname,department, salary, joindate) values(1,'rohit sharma','sales', 60000,'2021-05-10'),(2,'virat kohli','it', 85000,'2020-08-15'),(3,'ms dhoni','hr', 75000,'2019-01-22'),(4,'ravindra jadeja','sales', 67000,'2021-07-01'),(5,'kl rahul','it', 92000,'2021-02-11'),(6,'hardik pandya','hr', 71000,'2020-03-01'),(7,'jasprit bumrah','finance', 95000,'2020-12-12'),(8,'suresh raina','it', 86000,'2021-09-09'),(9,'shikhar dhawan','sales', 55000,'2018-11-20'),(10,'yuvraj singh','hr', 77000,'2019-06-15');
```

### Q1. Find the second highest salary in the company
  ```sql
  -- using subquery
  select max(salary) from empployee_tbl
  where salary < (select max(salary) from empployee_tbl);

  -- in sql server
  select salary from empployee_tbl order by salary desc
  offset 1 rows fetch next 1 rows only;

  -- in MySQL/PostgreSQL using LIMIT and OFFSET
  select salary from empployee_tbl order by salary desc LIMIT 1 OFFSET 1;
  ```

### Q2. Find the employee with the minimum salary in each department
  ```sql
  select  empname, department from (
  select *, dense_rank() over(partition by department order by salary asc) rank from empployee_tbl
  ) as rank_sal
  where rank=1

  -- using window fuctions: use window functions for all Nth salary probles
  with rank_sal_cte as (
  select *, dense_rank() over(partition by department order by salary asc) rank from empployee_tbl
  )
  select empname, department from rank_sal_cte where rank=1;
  ```

### Q3. Find employees earning the same salary as the highest-paid employee in their department
  ```sql
  select empname, department, salary from empployee_tbl e
  where salary = (
  select max(salary) from empployee_tbl
  where department=e.department
  );

  -- using CTE and join
  with cte as (
  select department, max(salary) as salary from empployee_tbl
  group by department
  )
  select e.empname, e.department, e.salary
  from empployee_tbl e
  inner join cte c on e.department=c.department and e.salary=c.salary
  ```

### Q4. Find employees whose salary is above the average salary of the company
  ```sql
  select empname, salary from empployee_tbl e
  where salary > (
  select avg(salary) from empployee_tbl
  )
  ```

### Q5. Find all departments that have at least one employee
  ```sql
  select department_name from departments d
  where exists (
  select 1 from employees e where e.department_id = d.department_id
  );
  ```

### Q6. Find all departments that have no employees.
  ```sql
  select department_name from departments d
  where not exists (
  select 1 from employees e where e.department_id = d.department_id
  );
  ```