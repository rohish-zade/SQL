-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | department  | varchar |
-- | managerId   | int     |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the name of an employee, their department, and the id of their manager.
-- If managerId is null, then the employee does not have a manager.
-- No employee will be the manager of themself.
 

-- Write a solution to find managers with at least five direct reports.

-- Return the result table in any order.

-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- Employee table:
-- +-----+-------+------------+-----------+
-- | id  | name  | department | managerId |
-- +-----+-------+------------+-----------+
-- | 101 | John  | A          | null      |
-- | 102 | Dan   | A          | 101       |
-- | 103 | James | A          | 101       |
-- | 104 | Amy   | A          | 101       |
-- | 105 | Anne  | A          | 101       |
-- | 106 | Ron   | B          | 101       |
-- +-----+-------+------------+-----------+
-- Output: 
-- +------+
-- | name |
-- +------+
-- | John |
-- +------+


-- Solution 1: using in
select name from employee where id in 
(select managerId 
from employee 
group by managerId 
having count(*) >= 5)

-- Explanation: 
--     1. get all the mangerIDs that have count bigger than 5
--     2. use the subquery result as a table and check with origin table at id equals to managerId


-- Solution 2: using join
select e.name from employee e
inner join 
(select managerId 
from employee 
group by managerId 
having count(*) >= 5) a
on e.id=a.managerId

-- Explanation: 
--     1. get all the mangerIDs that have count bigger than 5
--     2. use the subquery result as a table and do join with origin table at id equals to managerId