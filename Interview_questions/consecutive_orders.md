## 1. Find customers who placed 3 consecutive orders by calendar date (consecutive days).

we have Customer table below columns: 
`Customers(customer_id, customer_name, order_id, order_date)`

**SQL Query:**
For this, we will use the `LEAD()` function to check consecutive days.
  ```sql
  with orders_dates as (
  	select customer_id, customer_name, order_id, order_date, 
  	lead(order_date, 1) over(partition by customer_id order by order_date) as next1,
  	lead(order_date, 2) over(partition by customer_id order by order_date) as next2
  	from Customer
  )
  select distinct customer_id, customer_name
  from orders_dates
  where datediff(day, order_date, next1) = 1
  and datediff(day, order_date, next2) = 2;
  ```

**Explanation:**
- This query checks for 3 consecutive orders placed on consecutive days by using the `LEAD()` function.
- The `DATEDIFF()` function ensures that the difference between each consecutive order is exactly 1 day.


## 2. Find customers who placed 4 consecutive orders by calendar date (consecutive days).

Using the `LEAD()` function, create 3 columns and using `DATEDIFF()` function ensures that the difference between each consecutive order is exactly 1 day.

  ```sql
  with orders_dates as (
  	select customer_id, customer_name, order_id, order_date, 
  	lead(order_date, 1) over(partition by customer_id order by order_date) as next1,
  	lead(order_date, 2) over(partition by customer_id order by order_date) as next2,
  	lead(order_date, 3) over(partition by customer_id order by order_date) as next3
  	from Customer
  )
  select distinct customer_id, customer_name
  from orders_dates
  where datediff(day, order_date, next1) = 1
  and datediff(day, order_date, next2) = 2
  and datediff(day, order_date, next3) = 3;
  ```
