### Optimizing a long-running SQL query is a common challenge in data engineering. Here’s how I would approach it systematically:

**Analyze the Query:**
- Understand Requirements: Ensure the query retrieves only the necessary data. Avoid SELECT * and fetch only the required columns.
- Break Down the Query: Divide the query into smaller parts and run them individually to identify bottlenecks.

**Indexing:**
- Proper Indexing: Check if appropriate indexes (`clustered`/non-clustered) exist on the columns used in WHERE, JOIN, GROUP BY, and ORDER BY clauses.
- Avoid Over-indexing: Too many indexes can slow down writes and increase maintenance costs

**Use Query Execution Plan:**
Generate and analyze the query execution plan to identify:
- Full table scans.
- Expensive operations like nested loops, sort operations, or hash joins.
- Missing or unused indexes.

**Optimize Joins:**
- Ensure filtering happens before joins when possible.
- Use the appropriate join type (INNER JOIN, LEFT JOIN, etc.) based on the business requirement.
- Avoid joining unnecessary tables or complex derived tables.

**Use Partitioning and Clustering:**
- For large tables, implement table partitioning to process only relevant partitions.
- Use clustered tables in databases like BigQuery or Redshift to optimize storage and retrieval.

**Optimize Aggregations:**
- Replace expensive DISTINCT or GROUP BY operations with alternatives if applicable (e.g., window functions for deduplication).
- Aggregate at the earliest possible stage in the query.

**Avoid Expensive Operations:**
- Replace correlated subqueries with joins or Common Table Expressions (CTEs).
- Minimize the use of scalar functions in WHERE or SELECT clauses.

### Optimization Steps:

- `Create an index:` Create an index on customers(city, customer_id).
- `Filter early:` Apply the c.city = 'New York' filter before joining with the orders table.
- `Reorder joins:` If possible, join the orders table with another table that has a smaller number of rows before joining with the customers table.