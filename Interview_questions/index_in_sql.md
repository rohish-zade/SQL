## What is an index in sql?

An index in SQL is a database object that improves the speed of data retrieval operations on a table at the cost of additional writes and storage space.

It acts as a data structure that organizes the values of one or more columns in a way that makes it faster for the database to search for and retrieve rows.

### Key Features of an Index
- `Improves Query Performance:` By reducing the number of rows the database scans during a query.
- `Acts as a Lookup Table:` It provides a quick way to locate specific data without scanning the entire table.

### How an Index Works
When an index is created on a column, the database builds a sorted data structure (like a B-tree or hash table) that contains the indexed column's values and pointers to the corresponding rows in the table. This makes searching and filtering operations much faster.

**Example:**
Given a table `Employees`, if you create an index on the `emp_id` column, the database will internally create a sorted structure for the `emp_id` column, allowing it to quickly find entries like "69" without scanning the entire table.

### Types of Indexes

#### 1. Clustered Index
- A clustered index determines the physical order of row in a table. Each table can
have only one clustered index, and it is generally created on the primary key
column(s).
- Each table can have only one clustered index because rows can be physically ordered in only one way.
- Faster for range queries and sorting.
- Example:
  - A primary key often creates a clustered index by default.
  ```sql
  CREATE CLUSTERED INDEX idx_clustered ON Employees(emp_id);
  ```

#### 2. Non-Clustered Index
- A non-clustered index creates a separate structure that stores the indexed column's values and pointers to the rows in the table. 
- It does not alter the physical order of the table.
- A table can have multiple non-clustered indexes.
- Useful for quick lookups on frequently queried columns.
- Example:
  ```sql
  CREATE NONCLUSTERED INDEX idx_nonclustered ON Employees(deptartment);
  ```
   