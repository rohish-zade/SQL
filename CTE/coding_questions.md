### Q1. Use a CTE to split a full name into first and last names.
**input**
| full_name       |
|-----------------|
| Rohish Zade     |
| Lamine Yamal    |
| Jamal Musiala   |

**output:**
| full_name       | first_name | last_name |
|-----------------|------------|-----------|
| Rohish Zade     | Rohish     | Zade      |
| Lamine Yamal    | Lamine     | Yamal     |
| Jamal Musiala   | Jamal      | Musiala   |

  ```sql
  -- using charindex and substring
  with namesplit_cte as (
  	select full_name,
  	trim(substring(full_name, 1, charindex(' ', full_name) - 1)) as first_name,
  	trim(substring(full_name, charindex(' ', full_name) + 1, len(full_name))) as   last_name
  	from Employees
  )
  select full_name, last_name, last_name from namesplit_cte;
  ```

### Q2