### Mode in Statistics  

The **mode** is the most frequently occurring value in a dataset.  

#### Types of Mode  
- **Unimodal**: `{1, 2, 2, 3, 4}` → Mode = **2**  
- **Bimodal**: `{1, 2, 2, 3, 3, 4}` → Modes = **2, 3**  
- **Multimodal**: `{1, 2, 2, 3, 3, 4, 4}` → Modes = **2, 3, 4**  
- **No Mode**: `{1, 2, 3, 4, 5}` (no repeats)  

Used in categorical & numerical data to find common values.  

### Given a below table with column id, find the mode in sql.

**Input:**

   ```sql
   select * from mode:
   ```
  | ID  |
  |-----|
  |  1  |
  |  2  |
  |  2  |
  |  3  |
  |  3  |
  |  3  |
  |  3  |
  |  4  |
  |  5  |

**Output:**
  | ID  |
  |-----|
  |  3  |

### Solution:

**Method 1:** Uing CTE
- CTE (freq_cte): Groups id and counts occurrences (freq_count).
- Final Selection: Retrieves id(s) with the highest freq_count.

  ```sql
  with freq_cte as (
    select id, count(*) as freq_count from mode
    group by id
  )
  select id from freq_cte where freq_count=(select max(freq_count) from freq_cte);
  ```

**Method 2:** Using CTE and Window functions
- freq_cte: Groups id and counts occurrences (freq_count).
- rank_cte: Assigns a rank (rn) to each id, ordering by freq_count DESC.
- Final Selection: Returns id(s) where rn = 1 (i.e., the most frequent id).
  ```sql
  -- Method 2: using cte and window functions
  with freq_cte as (
  select id, count(*) as freq_count from mode
  group by id
  ),
  rank_cte as (
   select *, rank() over(order by freq_count desc) as rn
   from freq_cte
  )
  select id from rank_cte where rn=1;
  ```