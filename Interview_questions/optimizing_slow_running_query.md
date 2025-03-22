### How would you optimize a slow-running SQL query?

To optimize a slow-running SQL query:

1. **Analyze Query Execution Plan:** Use `EXPLAIN` plan to see how the query is executed and identify bottlenecks.
2. **Understand the SQL internals:** especially the order in which statements are executed.
3. **Filter Early:** Apply filters in the `WHERE` clause as early as possible to reduce the amount of data processed.
4. Wherever possible avoid functions in WHERE clause.
5. **Use appropriate indexes:** Ensure that the columns used in `WHERE`, `JOIN`, and `ORDER BY` clauses have appropriate indexes.
Over indexing can affect write performance, so understand the usage patterns to optimize the tables. Design is all about trade - offs based use cases.
6. **Optimize Joins:** Use appropriate join types (`INNER JOIN`, `LEFT JOIN`, etc.) and reduce the number of joins if possible.
7. **Limit the use of `SELECT *`:** Select only the columns you need instead of using `SELECT *` and use `LIMIT` to restrict the number of rows.
8. Where possible avoid DISTINCT keyword, and use GROUP BY as distinct happens towards the end in the order of execution.
9. Use EXISTS instead of IN in queries.
10. Use appropriate data types, avoid data type conversions.
11. Minimize the use of wildcard character.
12. **Use Caching:** Cache frequently accessed data to avoid repeated computations.
13. **Avoid using subqueries whenever possible:** Subqueries can be performance-intensive, especially if they are nested. Instead of using subqueries, try to use JOINs or other optimized techniques to achieve the same result.