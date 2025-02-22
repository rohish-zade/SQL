## How many records will be return by each join for below tables?

#### `Table A:`
  | id   |                
  |------|
  | 1    |
  | 1    |
  | NULL |
  | NULL |
  | 2    |
  | 3    |


#### `Table B:`
  | id   |
  |------|
  | NULL |
  | 1    |
  | 3    |
  | 4    |

### INNER JOIN:
- Returns only rows where there is a match in both tables.
- NULL values are not considered equal, so they are excluded.
- ```sql
  select *
  from A
  inner join B
  on A.id = B.id;
  ```
- **Number of Records Returned:** `3`

### LEFT JOIN
- Returns all rows from Table A and matching rows from Table B.
- If there is no match in Table A, `NULL` is returned for Table A columns.
- `NULL` values in Table A are included because they are part of Table A.
- ```sql
  select *
  from A
  left join B
  on A.id = B.id;
  ```
- **Number of Records Returned:** `6`

### RIGHT JOIN
- Returns all rows from Table B and matching rows from Table A.
- If there is no match in Table A, NULL is returned for Table A columns.
- `NULL` values in Table B are included because they are part of Table B
- ```sql
  select *
  from A
  right join B
  on A.id = B.id;
  ```
- **Number of Records Returned:** `5`

### FULL JOIN
- Returns all rows when there is a match in either Table A or Table B.
- If there is no match, `NULL` is returned for the missing side.
- `NULL` values from both tables are included.
- ```sql
  select *
  from A
  full join B
  on A.id = B.id;
  ```
- **Number of Records Returned:** `8`

### CROSS JOIN
- Returns the Cartesian product of Table A and Table B.
- Every row in Table A is combined with every row in Table B.
- `NULL` values are treated like any other value and included in the combinations.
- ```sql
  select *
  from A, B
  ```
- **Number of Records Returned:** `24`