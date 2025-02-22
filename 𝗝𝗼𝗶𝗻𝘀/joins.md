## SQL JOIN
A JOIN clause is used to combine rows from two or more tables, based on a related column between them.

### Types of Joins in SQL
#### `INNER JOIN:` 
- Returns records that have matching values in both tables.
- Example:
  ```sql
  SELECT employees.name, departments.department_name
  FROM employees
  INNER JOIN departments
  ON employees.department_id = departments.department_id;
  ```

#### `LEFT (OUTER) JOIN:`
- Returns all rows from the left table (`table1`) and the matched rows from the right table (`table2`). 
- If there is no match, `NULL` values are returned for columns from the right table.
- Example:
  ```sql
  SELECT employees.name, departments.department_name
  FROM employees
  LEFT JOIN departments
  ON employees.department_id = departments.department_id;
  ```

#### `RIGHT (OUTER) JOIN:` 
- Returns all rows from the left table (`table1`) and the matched rows from the right table (`table2`).
- If there is no match, `NULL` values are returned for columns from the right table.
- Example:
  ```sql
  SELECT employees.name, departments.department_name
  FROM employees
  RIGHT JOIN departments
  ON employees.department_id = departments.department_id;
  ```

#### `FULL (OUTER) JOIN:`
- Returns all rows when there is a match in either the left table (`table1`) or the right table (`table2`). 
- If there is no match, `NULL` values are returned for columns from the table without a match.
- - Example:
  ```sql
  SELECT employees.name, departments.department_name
  FROM employees
  FULL JOIN departments
  ON employees.department_id = departments.department_id;
  ```

#### CROSS JOIN:
- Returns the Cartesian product of the two tables, i.e., all possible combinations of rows.
- Example:
  ```sql
  SELECT employees.name, departments.department_name
  FROM employees
  CROSS JOIN departments;
  ```

#### SELF JOIN:
- A join of a table with itself. This is useful when you need to compare rows within the same table.
- Example:
   ```sql
   SELECT e1.name AS employee, e2.name AS manager
  FROM employees e1
  JOIN employees e2
  ON e1.manager_id = e2.employee_id;
  ```

