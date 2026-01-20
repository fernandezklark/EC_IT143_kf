/*****************************************************************************************************************
NAME:    Klark Omer Fernandez
PURPOSE: Adding deliverable W3.4.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/23/2022   JJAUSSI       1. Built this script for EC IT440


RUNTIME: 
Xm Xs

NOTES: 
Q1 - Jesus Toledo Cabatingan
Q2 - Jesus Toledo Cabatingan
Q3 - Jesus Toledo Cabatingan
Q4 - Klark Omer Fernandez
Q5 - Jennifer Leigh Groff
Q6 - Jesus Toledo Cabatingan
Q7 - Jennifer Leigh Groff
Q8 - Klark Omer Fernandez
******************************************************************************************************************/

-- Q1: What are the top five products by list price in the Production.Product table?
-- A1: 
		SELECT TOP 5 Name, ListPrice
		FROM Production.Product
		ORDER BY ListPrice DESC;
-- Q2:Which employees in the HumanResources.Employee table have the job title “Sales Representative”?
-- A2: 
		SELECT
		  BusinessEntityID,
		  JobTitle,
		  Gender,
		  HireDate
		FROM HumanResources.Employee
		WHERE JobTitle = 'Sales Representative';
-- Q3: Which three products generate the least net revenue (list price – standard cost) per unit sold, using Production.Product and Sales.SalesOrderDetail?
-- A3:
		SELECT DISTINCT TOP 3
			p.Name,
			(p.ListPrice - p.StandardCost) AS NetRevenuePerUnit
		FROM Production.Product AS p
		INNER JOIN Sales.SalesOrderDetail AS sod
			ON p.ProductID = sod.ProductID
		ORDER BY NetRevenuePerUnit ASC;
-- Q4: I am analyzing our customer geographic distribution for a new regional report. Which specific city name contains the highest number of our individual customers?
-- A4:
		SELECT TOP 1 A.City, COUNT(bea.BusinessEntityID) AS EntityCount
		FROM Person.Address AS A
		JOIN Person.BusinessEntityAddress AS bea
			ON A.AddressID = bea.AddressID
		GROUP BY A.City
		ORDER BY EntityCount DESC;
-- Q5: Management wants to showcase the priciest bikes by the window. They need to know what the most expensive bike in each of the three types of bikes is. Based on the list price, what is the most expensive bike for each type?
-- A5:
		WITH RankedBikes AS (
			SELECT 
				p.Name AS ProductName, 
				p.ListPrice, 
				ps.Name AS BikeType,
				-- Rank products by price (High to Low) within each category
				RANK() OVER (PARTITION BY ps.Name ORDER BY p.ListPrice DESC) AS PriceRank
			FROM Production.Product AS p
			INNER JOIN Production.ProductSubcategory AS ps 
				ON p.ProductSubcategoryID = ps.ProductSubcategoryID
			INNER JOIN Production.ProductCategory AS pc 
				ON ps.ProductCategoryID = pc.ProductCategoryID
			WHERE pc.Name = 'Bikes'
		)
		SELECT ProductName, ListPrice, BikeType
		FROM RankedBikes
WHERE PriceRank = 1;
-- Q6: Our executives want to analyze employee sales performance in 2013. Provide a list of sales representatives, their total sales revenue, and the number of orders handled. Use HumanResources.Employee, Sales.SalesOrderHeader, and Sales.SalesOrderDetail.
-- A6:
		SELECT
			p.FirstName,
			p.LastName,
			COUNT(DISTINCT soh.SalesOrderID) AS NumberOfOrders,
			SUM(sod.LineTotal) AS TotalSalesRevenue
		FROM HumanResources.Employee AS e
		INNER JOIN Person.Person AS p
			ON e.BusinessEntityID = p.BusinessEntityID
		INNER JOIN Sales.SalesOrderHeader AS soh
			ON e.BusinessEntityID = soh.SalesPersonID
		INNER JOIN Sales.SalesOrderDetail AS sod
			ON soh.SalesOrderID = sod.SalesOrderID
		WHERE e.JobTitle = 'Sales Representative'
		  AND soh.OrderDate >= '2013-01-01'
		  AND soh.OrderDate <= '2013-12-31'
		GROUP BY p.FirstName, p.LastName
		ORDER BY TotalSalesRevenue DESC;
-- Q7: Can you create a list of all the tables in AdventureWorks that contain a column named OrderQty?
-- A7:
		SELECT
			t.name AS TableName,
			s.name AS SchemaName
		FROM sys.columns c
		JOIN sys.tables t ON c.object_id = t.object_id
		JOIN sys.schemas s ON t.schema_id = s.schema_id
		WHERE c.name = 'OrderQty';
-- Q8: We are verifying data consistency across our employee records. What is the specific data type defined for the "JobTitle" column in the Employee table?
-- A8: 
		SELECT 
			TABLE_SCHEMA,
			TABLE_NAME,
			COLUMN_NAME,
			DATA_TYPE,
			CHARACTER_MAXIMUM_LENGTH
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME = 'Employee'
		  AND COLUMN_NAME = 'JobTitle';



SELECT GETDATE() AS my_date;