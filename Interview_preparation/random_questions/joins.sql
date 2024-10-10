-- Question: How many rows will be returned for each type of join: 
-- LEFT JOIN, RIGHT JOIN, INNER JOIN, and FULL JOIN?

-- DDLs:
create table A
(id int);
insert into A values(1), (1), (NULL), (NULL), (2), (3);

create table B
(id int);
insert into B values (NULL),(1), (3), (4);

-- Table A:
id
1
1
NULL
NULL
2
3

-- Table B: 
id
NULL
1
3
4

-- Answer:

-- LEFT JOIN: 6 records
select A.* from A
left join B on A.id=B.id;

-- RIGHT JOIN: 5 records
select A.* from A
right join B on A.id=B.id;


-- INNER JOIN:  3 records
select A.* from A
inner join B on A.id=B.id;


-- FULL JOIN: 8 records
select A.* from A
full join B on A.id=B.id;

-- CROSS JOIN: 24 records(cartesian product)
select A.*, B.* from A
cross join B;