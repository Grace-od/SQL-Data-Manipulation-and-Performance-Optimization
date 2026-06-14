SELECT customerName
FROM dbo.Customers

SELECT CustomerName, Notes
FROM dbo.Customers

SELECT customerName
FROM KCC.dbo.Customers


SELECT customerName as [Customer Name]
FROM dbo.Customers


SELECT DISTINCT customerName as [Customer Name]
FROM dbo.Customers


SELECT *
FROM dbo.Customers


SELECT top(3) *
FROM dbo.Customers


SELECT *
FROM dbo.Customers 
WHERE State = 'WA'
--- This returns all customers in WA State 
/* This returns all  customers in WA State*/



SELECT *
FROM dbo.Customers 
WHERE State <> 'WA'
--- This returns all customers not in WA State 


SELECT *
FROM dbo.Customers 
WHERE State != 'WA'
--- This returns all customers not in WA State 


SELECT *
FROM dbo.Customers 
WHERE State = 'WA'
OR State = 'NY'
--- This returns all customers in WA State or in NY State


SELECT *
FROM dbo.Customers 
WHERE State = 'WA'
OR State = 'NY'
OR State = 'UT'
--- This returns all customers in WA State or in NY State or in UT State



SELECT *
FROM dbo.Customers 
WHERE State IN('WA', 'NY', 'UT')
--- This returns all customers either in WA State, NY State, or in UT State USING IN STATEMENT


SELECT *
FROM dbo.Customers 
WHERE State NOT IN('WA', 'NY', 'UT')
--- This returns all customers NOT in WA State, NY State, or in UT State USING IN STATEMENT

SELECT *
FROM dbo.Customers 
WHERE CustomerName = 'Tres Delicious' AND Country = 'United States'



SELECT *
FROM dbo.Customers 
WHERE CustomerName = 'Tres Delicious' AND (Country = 'United States'
OR Country = 'France')


SELECT *
FROM dbo.Customers 
WHERE CustomerName LIKE 'A%' AND (Country = 'United States'
OR Country = 'France')


SELECT *
FROM dbo.Customers 
WHERE CustomerName NOT LIKE 'A%' AND (Country = 'United States'
OR Country = 'France')


SELECT TOP (1000) [OrderID]
      ,[OrderDate]
      ,[CustomerID]
      ,[OrderTotal]
  FROM [KCC].[dbo].[Orders]
  WHERE OrderTotal > 1000



  SELECT TOP (1000) [OrderID]
      ,[OrderDate]
      ,[CustomerID]
      ,[OrderTotal]
  FROM [KCC].[dbo].[Orders]
  WHERE OrderTotal >= 1000


  SELECT TOP (1000) [OrderID]
      ,[OrderDate]
      ,[CustomerID]
      ,[OrderTotal]
  FROM [KCC].[dbo].[Orders]
  WHERE OrderTotal BETWEEN 1000 AND 2000



  SELECT OrderID, OrderDate, OrderTotal, CustomerName, Phone 
  FROM dbo.Orders
  JOIN dbo.Customers on dbo.Orders.CustomerID =dbo.Customers.CustomerID
---- Using INNER JOIN 


 
  SELECT OrderID, OrderDate, OrderTotal, CustomerName, Phone 
  FROM dbo.Orders o
  JOIN dbo.Customers c on o.CustomerID = c.CustomerID


   SELECT OrderID, OrderDate, OrderTotal, CustomerName, Phone 
  FROM dbo.Orders o
  INNER JOIN dbo.Customers c on o.CustomerID = c.CustomerID


  
   SELECT OrderID, OrderDate, OrderTotal, CustomerName, Phone 
  FROM dbo.Orders o
  RIGHT OUTER JOIN dbo.Customers c on o.CustomerID = c.CustomerID


  SELECT OrderID, OrderDate, OrderTotal, CustomerName, Phone 
  FROM dbo.Orders o
  LEFT OUTER JOIN dbo.Customers c on o.CustomerID = c.CustomerID



  SELECT OrderID, OrderDate, OrderTotal, CustomerName, Phone, CustomerID 
  FROM dbo.Orders o
  LEFT OUTER JOIN dbo.Customers c on o.CustomerID = c.CustomerID
  --- Error since the CustomerID was not specified and it does it not which of them in the order and customer table to use 


  SELECT OrderID, OrderDate, OrderTotal, CustomerName, Phone, c.CustomerID 
  FROM dbo.Orders o
  LEFT OUTER JOIN dbo.Customers c on o.CustomerID = c.CustomerID
  --- No error since the CustomerID from whcih taable was now specified 


  SELECT OrderID, OrderDate, OrderTotal, CustomerName, Phone, c.CustomerID 
  FROM dbo.Orders o
  LEFT OUTER JOIN dbo.Customers c on o.CustomerID = c.CustomerID
  ORDER BY OrderTotal DESC 


  SELECT *
  FROM dbo.Orders
  WHERE OrderDate >= '2/18/2022'


  SELECT *
  FROM dbo.Orders
  WHERE OrderDate >= Dateadd(month,-1,getdate())
  --- To see the previous month date 


  SELECT count(*)
  FROM dbo.Orders
  WHERE OrderDate >= Dateadd(month,-1,getdate())
  --- Count of all orders in the last month
  --- There were sixteen orders in the last month

  SELECT sum(OrderTotal)
  FROM dbo.Orders
  WHERE OrderDate >= Dateadd(month,-1,getdate())
   --- Sum up of all the total orders in the last month


  SELECT sum(OrderTotal)
  FROM dbo.Orders
  WHERE OrderDate >= Dateadd(month,-1,getdate())
  GROUP BY CustomerID
   --- Sum up of all the total orders BY the customerID in the last month


   SELECT        Customers.CustomerName AS [Customer Name], Orders.OrderDate, SUM(Orders.OrderTotal) AS Expr1, Orders.OrderID
FROM            Customers INNER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID
WHERE        (Orders.OrderDate >= CONVERT(DATETIME, '2022-02-18 00:00:00', 102))
GROUP BY Customers.CustomerName, Orders.OrderDate, Orders.OrderID
---- using DESIGN QUERY EDITOR 
























