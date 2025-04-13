## STRING_SPLIT
- STRING_SPLIT is a built-in function in SQL Server (2016 and later) that splits a string into rows based on a specified delimiter.
- Syntax: `STRING_SPLIT ( string , separator )`
- It returns a single-column table with the column name value.

### Question: Convert Comma Separated Values into Rows

Find the room types that are searched most no of times.
Output the room type alongside the number of searches for it.
If the filter for room types has more than one room type,
consider each unique room type as a separate row.
Sort the result based on the number of searches in descending order.

**Input:**
| user_id | date_searched | filter_room_types         |
|---------|----------------|----------------------------|
|   1     | 2022-01-01     | entire home,private room   |
|   2     | 2022-01-01     | entire home,shared room    |
|   3     | 2022-01-02     | private room,shared room   |
|   4     | 2022-01-03     | private room               |


**Output**
| value        | cnt |
|--------------|-----|
| private room |  3  |
| shared room  |  2  |
| entire home  |  2  |


### Soluttion:
- Split the filter_room_types column by comma into individual room types.
- Count how many times each room type appears.
- Sort the result by the count in descending order.

  ```sql
  select value as room_type, count(*) as cnt
  from airbnb_searches
  cross apply string_split(filter_room_types, ',')
  group by value
  order by count(*) desc
  ```


**NOTE:**
You can achieve the same using SPLIT + EXPLODE in Spark SQL