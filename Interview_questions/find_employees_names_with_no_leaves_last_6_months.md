### find the names of employees who did not take any leave in the last 6 months

**Employee Table:**
  | emp_id | name           |
  |--------|----------------|
  | 1      | Rohish Zade    |
  | 2      | Priya Ramteke  |
  | 3      | Chetan Badgujar|
  | 4      | Melody Emme    |
  | 5      | Smit Ramteke   |
  | 6      | Faisal Reza    |


**Leave Table:**
  | leave_date | emp_id |
  |------------|--------|
  | 2024-11-10 | 1      |
  | 2025-01-05 | 2      |
  | 2024-07-15 | 3      |
  | 2025-02-20 | 1      |
  | 2024-12-25 | 2      |


**SQL Query:**
  ```sql
  select e.name
  from Employee e 
  where emp_id not in (
  	select l.emp_id 
  	from Leave l
  	where l.leave_date >= dateadd(month, -6, getdate())
  );
  ```

**Explanation:**
- Filters leave records from the last 6 months.
- Gets all employee IDs who took leave in that period.
- Selects employees not in that list.