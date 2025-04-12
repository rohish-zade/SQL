### LEFT OUTER JOIN
- A LEFT OUTER JOIN (often just called LEFT JOIN) is a type of SQL join that returns all records from the left table (table1), and the matched records from the right table (table2). 
- If there is no match, the result is NULL on the side of the right table.

#### Try to guess the output of the below two queries 

  ```sql
  --First Query:
  select * from employee emp 
  left join dept on emp.dept_id=dept.dep_id and dept.dep_name = 'Analytics';
  
  --Second Query:
  select * from employee emp 
  left join dept on emp.dept_id=dept.dep_id 
  where dept.dep_name = 'Analytics';
  ```

**First Query Output:**
- In the first query, you are giving `dept.dep_name='Analytics'` in join condition, it first filter for the dept_name in the `dept` table then will perform a left join
- So you get all employees, and only those in 'Analytics' will have dept data; others will have NULLs in those columns.
- First query is equivalent to below query:
    ```sql
    select * from emp
    left join (select * from dept where dep_name='Analytics') dept 
    on emp.dep_id = dept.dep_id;
    ```
  | emp_id | emp_name | dept_id | salary | manager_id | emp_age | dep_id | dep_name  |
  |--------|----------|---------|--------|------------|---------|--------|-----------|
  | 1      | Ankit    | 100     | 10000  | 4          | 39      | 100    | Analytics |
  | 2      | Mohit    | 100     | 15000  | 5          | 48      | 100    | Analytics |
  | 3      | Vikas    | 100     | 10000  | 4          | 37      | 100    | Analytics |
  | 4      | Rohit    | 100     | 5000   | 2          | 16      | 100    | Analytics |
  | 5      | Mudit    | 200     | 12000  | 6          | 55      | NULL   | NULL      |
  | 6      | Agam     | 200     | 12000  | 2          | 14      | NULL   | NULL      |
  | 7      | Sanjay   | 200     | 9000   | 2          | 13      | NULL   | NULL      |
  | 8      | Ashish   | 200     | 5000   | 2          | 12      | NULL   | NULL      |
  | 9      | Mukesh   | 300     | 6000   | 6          | 51      | NULL   | NULL      |
  | 10     | Rakesh   | 500     | 7000   | 6          | 50      | NULL   | NULL      |


**Second Query Output:**
- In Second query, you are giving `dept.dep_name='Analytics'` in the `where` clause, it will first perform the join then on the result set of join will apply the filter condition.
- You will only see employees who are in the 'Analytics' department.
- All others are excluded, even if they're in emp.

  | emp_id | emp_name | dept_id | salary | manager_id | emp_age | dep_id | dep_name  |
  |--------|----------|---------|--------|------------|---------|--------|-----------|
  | 1      | Ankit    | 100     | 10000  | 4          | 39      | 100    | Analytics |
  | 2      | Mohit    | 100     | 15000  | 5          | 48      | 100    | Analytics |
  | 3      | Vikas    | 100     | 10000  | 4          | 37      | 100    | Analytics |
  | 4      | Rohit    | 100     | 5000   | 2          | 16      | 100    | Analytics |
  
