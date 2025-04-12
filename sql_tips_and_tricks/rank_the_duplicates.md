### Rank the Duplicates

**Input:**
  | id |
  |----|
  | a  |
  | a  |
  | b  |
  | c  |
  | c  |
  | c  |
  | d  |
  | d  |
  | e  |

**Output:**
  | id | output |
  |----|--------|
  | a  | DUP1   |
  | a  | DUP1   |
  | b  | NULL   |
  | c  | DUP2   |
  | c  | DUP2   |
  | c  | DUP2   |
  | d  | DUP3   |
  | d  | DUP3   |
  | e  | NULL   |


**Solution:**
- `dup_cte`: find the duplicate id's
- `rank_cte`: assign a rank using `rank()`.
- `final_output`: Join original data with the ranked duplicates and output 'DUP#' or NULL.

  ```sql
  with dup_cte as (
  	select id from list
  	group by id
  	having count(id) > 1
  ),
  rank_cte as (
  	select *, rank() over(order by id asc) as rnk from dup_cte
  )
  select a.id, 
  case when rnk is not null then concat('DUP',b.rnk) end as ouput
  from list a
  left join rank_cte b on a.id=b.id
  ```
