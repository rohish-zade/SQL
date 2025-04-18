### Identify Customers with No Orders in the Last Year

In a retail database, we have two tables: `Customers` and `Orders`. Identify customers who **have not placed any orders in the last year** from a given reference date (e.g., today).

#### Tables:
**`Customers`**: (CustomerID, FirstName, LastName, RegistrationDate) 

**`Orders`**: (OrderID, CustomerID, OrderDate, Amount) 

#### Solution:

  ```sql
  select * from Customers C
  left join Orders O on C.CustomerID=O.CustomerID and O.OrderDate >= dateadd  (year, -1, getdate())
  where O.OrderID is null;
  ```

#### Explanation:
- The query performs a LEFT JOIN between Customers and Orders, matching only orders from the last year
- The WHERE clause filters for customers where no matching order was found (OrderID IS NULL)
- This returns customers who either:
  - Have never placed any order, or
  - Their most recent order is more than one year old 