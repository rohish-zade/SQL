## Common Table Expression (CTE) in SQL
- A Common Table Expression (CTE) in SQL is a temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement.
- It helps make queries more readable and modular by breaking complex logic into smaller, reusable parts.
- CTEs are defined using the `WITH` clause and can be referenced multiple times within the main SQL query. This makes `CTEs` a great alternative to `subqueries`, especially in cases where we need to perform the same operation multiple times or create recursive queries.

### Syntax:
  ```sql
  WITH cte_name AS (
    -- CTE definition (SELECT statement)
  )
  -- Main query that references the CTE
  SELECT ...
  FROM cte_name
  WHERE ...;
  ```
### Benefits of Using CTEs:
- **Temporary:** - CTEs are not stored permanently in the database
- **Improves Readability** – Breaks down complex queries into logical blocks.
- **Enhances Reusability** – Can be referenced multiple times within the main query.
- **Supports Recursion** – Recursive CTEs allow working with hierarchical data.
- **Avoids Repetition** – Eliminates the need for subqueries by defining the result set.
- **Improved Performance** - In some cases, CTEs can improve query performance by allowing the database to optimize the query execution plan.