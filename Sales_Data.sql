SELECT *
FROM [dbo].[Salesman$]

SELECT *
FROM [dbo].[Order$]

SELECT *
FROM [dbo].[Customer$]



--write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.
SELECT C.[Customer_ID]
      ,C.[Customer_Name]
      ,C.[City]
      ,C.[Grade]
      ,C.[Salesman_ID]
  FROM [dbo].[Customer$] AS C
  LEFT JOIN [dbo].[Salesman$] AS S
  ON C.[Salesman_ID] = S.[Salesman_id]
  WHERE C.[City] = S.[City]
    
    
--write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
SELECT O.[Order Number]
      ,O.[Purchase_Amount]
      ,C.[Customer_Name]
      ,C.[City]
  FROM [dbo].[Order$] AS O
  LEFT JOIN [dbo].[Customer$] AS C
  ON C.[Salesman_ID] = O.[Salesman_id]
  WHERE O.[Purchase_Amount] BETWEEN 500 AND 2000

--write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.
SELECT C.[Customer_Name]
      ,C.[City]
      ,S.[Salesman_id]
      ,S.[commission]
  FROM [dbo].[Customer$] AS C
  LEFT JOIN [dbo].[Salesman$] AS S
  ON C.[Salesman_ID] = S.[Salesman_id]
  ORDER BY [Salesman_id] ASC
  

--write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.
SELECT C.[Customer_Name]
      ,C.[City]
      ,S.[Salesman_id]
      ,S.[commission]
      FROM [dbo].[Customer$] AS C
  LEFT JOIN [dbo].[Salesman$] AS S
  ON C.[Salesman_ID] = S.[Salesman_id]
  WHERE S.[commission] >0.12

--write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission.  
SELECT C.[Customer_Name]
      ,C.[City]
      ,S.[Salesman_id]
      ,S.[city]
      ,S.[commission]
      FROM [dbo].[Customer$] AS C
  LEFT JOIN [dbo].[Salesman$] AS S
  ON C.[Salesman_ID] = S.[Salesman_id]
  WHERE S.[city] <> C.[City] AND S.[commission] > 0.12
 
--write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission
SELECT O.[Order Number]
      ,O.[Order Date]
      ,O.[Purchase_Amount]
      ,C.[Customer_Name]
      ,C.[Grade]
      ,C.[Salesman_ID]
      ,S.[commission]
      FROM [dbo].[Order$] AS O
  LEFT JOIN [dbo].[Customer$] AS C
  ON O.[Salesman_id] = C.[Salesman_ID]
  LEFT JOIN [dbo].[Salesman$] AS S
  ON C.[Salesman_ID] = S.[Salesman_id]
 

--Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned. 
SELECT O.[Order Number]
      ,O.[Purchase_Amount]
      ,O.[Order Date]
      ,O.[Customer ID]
      ,O.[Salesman_id]
  FROM [dbo].[Order$] AS O
  LEFT JOIN [dbo].[Customer$] AS C
  ON O.[Salesman_id] = C.[Salesman_ID]
  LEFT JOIN [dbo].[Salesman$] AS S
  ON S.[Salesman_id] = C.[Salesman_ID]

--write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.
SELECT C.[Customer_Name]
      ,C.[City]
      ,C.[Grade]
      ,S.[Salesman_id]
      ,S.[city]
      FROM [dbo].[Customer$] AS C
      LEFT JOIN [dbo].[Salesman$] AS S
      ON C.[Salesman_ID] = S.[Salesman_id]
      ORDER BY C.[Customer_ID] ASC


--write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id.
SELECT C.[Customer_Name]
      ,C.[City]
      ,C.[Grade]
      ,S.[Salesman_id]
      ,S.[city]
      FROM [dbo].[Customer$] AS C
      LEFT JOIN [dbo].[Salesman$] AS S
      ON C.[Salesman_ID] = S.[Salesman_id]
      WHERE [Grade] < 300

--Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not.
SELECT [Customer_Name]
      ,[City]
      ,[Order Number]
      ,[Order Date]
      ,[Purchase_Amount]
      FROM [dbo].[Customer$] AS C
      LEFT JOIN [dbo].[Order$] AS O
      ON C.[Salesman_ID] = O.[Salesman_id]
      ORDER BY O.[Purchase_Amount] ASC 

--SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.
SELECT C.[Customer_Name]
      ,C.[City]
      ,O.[Order Number]
      ,O.[Order Date]
      ,O.[Purchase_Amount]
      ,S.[Name]
      ,S.[commission]
      ,CASE
     WHEN O.[Order Number] is NULL THEN 'No Orders'
     when O.[Salesman_id] =  C.[Salesman_ID] THEN 'Ordered Through Assigned'
     WHEN O.[Salesman_id] IS NULL THEN 'Ordered By Themselves'
        ELSE 'Ordered Through Different Salesman'
      END as [Order Status]
      FROM [dbo].[Customer$] AS C
      LEFT JOIN [dbo].[Order$] AS O
      ON C.[Salesman_ID] = O.[Salesman_id]
      LEFT JOIN [dbo].[Salesman$] AS S
      ON S.[Salesman_id] = O.[Salesman_id]
     
--Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers.
SELECT S.[Salesman_id]
      ,S.[Name]
      ,S.[city]
      ,S.[commission]
      FROM [dbo].[Salesman$] AS S
      LEFT JOIN [dbo].[Customer$] AS C
      ON S.[Salesman_id] = C.[Salesman_ID]
      ORDER BY S.[Name] ASC
--write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount.
SELECT C.[Salesman_ID]
      ,C.[Customer_Name]
      ,C.[City]
      ,C.[Grade]
      ,O.[Order Number]
      ,O.[Order Date]
      ,O.[Purchase_Amount]
      FROM [dbo].[Customer$] AS C
      LEFT JOIN [dbo].[Order$] AS O
      ON C.Salesman_ID = O.Salesman_id

--Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.
SELECT DISTINCT
    S.Salesman_ID,
    S.[Name],
    S.[city],
    S.[commission]
FROM [dbo].[Salesman$] AS S
LEFT JOIN [dbo].[Customer$] AS C
    ON S.Salesman_ID = C.Salesman_ID
LEFT JOIN [dbo].[Order$] AS O
    ON C.Salesman_ID = O.[Salesman_id]
WHERE 
    (
        (O.Purchase_Amount >= 2000 AND C.Grade IS NOT NULL)
        OR O.[Order Number] IS NULL
    )

--For those customers from the existing list who put one or more orders, or which orders have been placed by the customer who is not on the list, create a report containing the customer name, city, order number, order date, and purchase amount
SELECT 
    ISNULL(C.Customer_Name, 'Not On Customer List') AS Customer_Name,
    C.City,
    O.[Order Number],
    O.[Order Date],
    O.Purchase_Amount
FROM dbo.Order$ AS O
LEFT JOIN dbo.Customer$ AS C
    ON O.[Salesman_id] = C.[Salesman_ID]


--Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade.
SELECT 
    C.Customer_Name,
    C.City,
    O.[Order Number],
    O.[Order Date],
    O.Purchase_Amount
FROM dbo.Order$ AS O
LEFT JOIN dbo.Customer$ AS C
    ON O.[Salesman_id] = C.[Salesman_ID]
WHERE 
    (
        C.Customer_ID IS NOT NULL
        AND C.Grade IS NOT NULL
    )
    OR
    (
        C.Customer_ID IS NULL
        AND C.Grade IS NULL
    )

--Write a SQL query to combine each row of the salesman table with each row of the customer table.
SELECT C.[Customer_ID]
      ,C.[Customer_Name]
      ,C.[City]
      ,C.[Grade]
      ,C.[Salesman_ID]
      FROM [dbo].[Customer$] AS C
      LEFT JOIN [dbo].[Salesman$] AS S
      ON C.[Salesman_ID] = S.[Salesman_id]
--Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for all customers and vice versa for that salesperson who belongs to that city.
SELECT 
    S.Name AS Salesman_Name,
    C.Customer_Name,
    S.city
FROM dbo.Salesman$ S
JOIN dbo.Customer$ C
    ON S.city = C.City;

--Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for every customer and vice versa for those salesmen who belong to a city and customers who require a grade.
SELECT 
    S.Name AS Salesman_Name,
    C.Customer_Name,
    S.city,
    C.Grade
FROM dbo.Salesman$ S
JOIN dbo.Customer$ C
    ON S.city = C.City
WHERE C.Grade IS NOT NULL


--Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman will appear for all customers and vice versa for those salesmen who must belong to a city which is not the same as his customer and the customers should have their own grade.
SELECT 
    S.Name AS Salesman_Name,
    S.city AS Salesman_City,
    C.Customer_Name,
    C.City AS Customer_City,
    C.Grade
FROM dbo.Salesman$ S
JOIN dbo.Customer$ C
    ON S.city <> C.City
WHERE C.Grade IS NOT NULL
ORDER BY S.Name ASC, C.Customer_Name ASC;

