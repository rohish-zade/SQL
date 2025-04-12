### SQL COUNT Function Variations

Differences Between COUNT Variations in SQL:

**COUNT(*):**
- Counts all rows in the table, including NULL values and duplicates
- Most common and efficient for counting total rows.

**COUNT(0), COUNT(1), COUNT(-1), COUNT(<string_value>):**
- These all behave the same as COUNT(*).
- SQL treats constants like 0, 1, -1 or any string value like 'Mango' as non-null values, so it counts every row.
- when you say count(1), it is counting this contant values once for each each in a table. so if we have 12 records it will count(1) 12 times.

**COUNT(column_name):**
- Counts non-NULL values in a specific column.
- Excludes NULL values from the count

**COUNT(DISTINCT column_name):**
- Counts distinct (unique) non-NULL values in a column
- Excludes both NULL values and duplicate values
- More computationally expensive than regular COUNT


**Example:**

Let say we have table with below data. let's see how many records will be return by each count variation

**Input:**
  | id   | name     | department |
  |------|----------|------------|
  | 1    | Ekta     | HR         |
  | 2    | Rohish   | IT         |
  | 3    | Nivedita | HR         |
  | 4    | Akshay   | Sales      |
  | 5    | Faisal   | IT         |
  | 6    | NULL     | HR         |
  | NULL | NULL     | NULL       |


**Output:**
  ```sql
  select count(*) as 'count_*',
  count(1) as 'count_1', count(0) as 'count_0', 
  count(-1) as 'count_-1', count('rohish') as 'count_string',
  count(name) as count_col,
  count(distinct department) as count_department
  from employees_1
  ```

  | count_* | count_1 | count_0 | count_-1 | count_string | count_col |   count_department |
  |---------|---------|---------|----------|---------------|-----------|  ------------------|
  | 7       | 7       | 7       | 7        | 7             | 5         | 3                |

