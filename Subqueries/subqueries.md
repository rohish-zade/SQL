## Subqueries in SQL
- A subquery (also called an inner query or nested query) is a SQL query that is embedded within another SQL query (main query). 
- The subquery executes first, and its result is used by the main query.
- Subqueries can be used in `SELECT`, `INSERT`, `UPDATE`, `DELETE`, and `WHERE` clauses.

### Types of Subqueries:

#### Scalar Subquery:
- Returns a single value (one row and one column).
  ```sql
  SELECT employee_name 
  FROM employees 
  WHERE salary = (SELECT MAX(salary) FROM employees); 
  ```

#### Single-Row Subquery:
- Returns one row with one or more columns.
  ```sq
  SELECT employee_name 
  FROM employees 
  WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'Sales');
  ```

#### Multi-Row Subquery:
- Returns multiple rows with one or more columns.
  ```sql
  SELECT employee_name 
  FROM employees 
  WHERE department_id IN (SELECT department_id FROM departments WHERE location_id =1700);
  ```

#### Correlated Subquery: `(Imp)`
- A subquery that depends on the outer query for its values.
  ```sql
  SELECT employee_name 
  FROM employees e 
  WHERE salary > (SELECT AVG(salary) FROM employees WHERE department_id = e.department_id);
  ```

### `Potential Interview Questions:`

### Q1. What is Non-Correlated Subquery?
- A `non-correlated subquery` is independent of the outer query. It executes once and returns a result (a single value, a single row, or multiple rows) that is used by the outer query.
- The subquery does not depend on the outer query for its execution.
- It is typically more efficient than a correlated subquery because it runs only once.
- **Example of a Non-Correlated Subquery**:
   ```sql
   SELECT employee_name 
   FROM employees 
   WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'Sales');
   ```
  - The inner query (`SELECT department_id FROM departments WHERE department_name = 'Sales'`) runs first and returns a single value (`department_id`).
  - The outer query then uses this value to filter the employees table.


### Q2. What is Correlated Subquery?
- A correlated subquery depends on the outer query for its execution. 
- It is executed once for each row processed by the outer query.
- The subquery references a column from the outer query, creating a relationship between the two.
- Correlated subqueries are generally less efficient than non-correlated subqueries because they execute repeatedly for each row in the outer query.
- **Example of a Correlated Subquery**: The query retrieves the names of employees who earn more than the average salary of their respective departments.
  ```sql
  SELECT employee_name 
  FROM employees e 
  WHERE salary > (SELECT AVG(salary) FROM employees WHERE department_id = e.department_id);
  ```
  - The inner query (`SELECT AVG(salary) FROM employees WHERE department_id = e.department_id`) references the department_id from the outer query (`e.department_id`).
  - For each row in the employees table, the subquery calculates the average salary for the corresponding department and compares it with the employee's salary.

#### Performance Considerations
- Non-correlated subqueries are generally faster because they execute only once.
- Correlated subqueries can be slower because they execute repeatedly for each row in the outer query. 
- To optimize correlated subqueries:
  - Use indexing on the columns involved in the subquery.
  - Consider rewriting the query using `JOINs` or `CTEs` (Common Table Expressions) if possible.

### Q3. What are the limitations of subqueries?
- Subqueries can be less efficient than JOINs, especially correlated subqueries, as they may execute multiple times.
- `readability`: Subqueries can make the query harder to read and maintain if overused or nested too deeply.
- Some databases have limitations on the number of subqueries that can be nested.

### Q4. What is the difference between IN and EXISTS in subqueries?
- `IN` is used when the subquery returns a list of values, and the outer query checks if a value matches any value in the list
- `EXISTS` is used to check if the subquery returns any rows. It returns `TRUE` if at least one row is returned by the subquery.
- `EXISTS` is often more efficient than IN because it stops execution as soon as it finds a match.

### Q4. How would you optimize a slow-performing subquery?
- Rewrite the subquery as a JOIN if possible.
- Use `EXISTS` instead of `IN` for better performance.
- Ensure proper indexing on the columns used in the subquery.
- Avoid correlated subqueries if they are not necessary.
- Use a CTE or temporary table to simplify and optimize the query.

### Q4. EXISTS and NOT EXISTS in SQL
- `EXISTS` and `NOT EXISTS` are logical operators used in SQL to check for the existence of rows in a subquery.
- They are often used in `WHERE` clauses to filter results based on whether a subquery returns any rows.
- **EXISTS**
  - The `EXISTS` operator returns `TRUE` if the subquery returns at least one row.
  - It stops processing as soon as it finds the first matching row, making it efficient for large datasets.
  - It is commonly used to check for the existence of related records in another table.
  - **Example:** Find all departments that have at least one employee:
    ```sql
    SELECT department_name
    FROM departments d
    WHERE EXISTS (SELECT 1 FROM employees e WHERE e.department_id = d.department_id);
    ```
- **NOT EXISTS:**
  - The `NOT EXISTS` operator returns `TRUE` if the subquery returns no rows.
  - It is the opposite of `EXISTS` and is used to check for the absence of related records in another table.
  - **Example:** Find all departments that have no employees:
    ```sql
    SELECT department_name
    FROM departments d
    WHERE NOT EXISTS (SELECT 1 FROM employees e WHERE e.department_id = d.department_id);
    ```