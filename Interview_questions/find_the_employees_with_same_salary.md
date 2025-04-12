### Find employees with the same salary

To find employees with the same salary in SQL, you can use a subquery with GROUP BY and HAVING, then join it back to the main employee table.

**Employees table:**
  | id | name    | salary |
  |----|---------|--------|
  | 1  | Rohish  | 5000   |
  | 2  | Smith   | 6000   |
  | 3  | Faisal  | 5000   |
  | 4  | Pushpak | 7000   |
  | 5  | Vinit   | 6000   |
  | 6  | Tejas   | 8000   |
  | 7  | Rishi   | 9000   |
  | 8  | Anis    | 7000   |


**Solution:**
  ```sql
  select * from employees
  where salary in (
  	select salary
  	from employees
  	group by salary
  	having count(*) > 1
  )
order by salary;
  ```


**Output:**
  | id | name    | salary |
  |----|---------|--------|
  | 1  | Rohish  | 5000   |
  | 3  | Faisal  | 5000   |
  | 2  | Smith   | 6000   |
  | 5  | Vinit   | 6000   |
  | 8  | Anis    | 7000   |
  | 4  | Pushpak | 7000   |
