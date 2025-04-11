### FULL OUTER JOIN
- FULL OUTER JOIN combines the results of both LEFT JOIN and RIGHT JOIN, returning all records from both tables, with NULL values in places where there is no match.

### Question: Find the change in the employee status

**Input:**
  
  emp_2020:
  
  |    | emp_id | designation     |
  |----|--------|-----------------|
  | 1  | 1      | Trainee         |
  | 2  | 2      | Developer       |
  | 3  | 3      | Senior Developer|
  | 4  | 4      | Manager         |
  
  
  emp_2021:
  |    | emp_id | designation     |
  |----|--------|-----------------|
  | 1  | 1      | Developer       |
  | 2  | 2      | Developer       |
  | 3  | 3      | Manager         |
  | 4  | 5      | Trainee         |


**Output:**

  |    | emp_id | comment   |
  |----|--------|-----------|
  | 1  | 1      | Promoted  |
  | 2  | 3      | Promoted  |
  | 3  | 4      | Resigned  |
  | 4  | 5      | New       |


**Solution:**
- considering there is no demotion in the company
- The FULL OUTER JOIN ensures we capture all employees from both years
- The CASE statement determines the status
- The WHERE clause filters to only show changes (excluding 'No Change' cases)

  ```sql
  select coalesce(e20.emp_id, e21.emp_id),
  case
  	when e20.designation!=e21.designation then 'Promoted'
  	when e20.emp_id is null then 'New'
  	else 'Resigned'
  end as comment	
  from emp_2020 e20
  full join emp_2021 e21 on e20.emp_id=e21.emp_id
  where isnull(e20.designation, 'xxx') != isnull(e21.designation, 'yyy')
  ```