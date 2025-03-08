## Common Table Expressions (CTE) in SQL
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


### Types of CTEs
There are two main types of Common Table Expressions (CTEs) in SQL

#### Non-Recursive CTEs (Standard CTEs)
- These are the most common type of CTEs.
- A Non-Recursive CTE is standard CTE is used to simplify queries by breaking down complex logic into reusable temporary result sets. It behaves like a simple inline view (subquery).
- **Example:**
  ```sql
  WITH Sales_CTE AS (
    SELECT SalesPersonID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY SalesPersonID
  )
  SELECT SalesPersonID, TotalSales
  FROM Sales_CTE
  WHERE TotalSales > 100000;
  ```

#### Recursive CTE
- A recursive CTE is one that references itself within that CTE. The recursive CTE is useful when working with hierarchical data as the CTE continues to execute until the query returns the entire hierarchy.
- A recursive CTE must have union all statement and a second query definition tht references the CTE itself in order to be recursive.
- useful for tranversing tree structures, organizational hierarchies and recursive relationships.
- **Example:**
  ```sql
  WITH EmployeeHierarchy AS (
    -- Anchor query (Base Case)
    SELECT EmployeeID, Name, ManagerID, 1 AS Level
    FROM Employees
    WHERE ManagerID IS NULL

    UNION ALL

    -- Recursive query (Iterates on itself)
    SELECT e.EmployeeID, e.Name, e.ManagerID, eh.Level + 1
    FROM Employees e
    INNER JOIN EmployeeHierarchy eh ON e.ManagerID = eh.EmployeeID
  )
  SELECT * FROM EmployeeHierarchy;
  ```