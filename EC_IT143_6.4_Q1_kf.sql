
USE AdventureWorks2025;
GO

-- 1. Unindexed query to generate missing index recommendation
SELECT SalesOrderID, SalesOrderDetailID, OrderQty, LineTotal
FROM Sales.SalesOrderDetail
WHERE CarrierTrackingNumber = '4859-42B8-85';
GO

-- 2. Create the recommended missing index
CREATE NONCLUSTERED INDEX IX_SalesOrderDetail_CarrierTracking
ON [Sales].[SalesOrderDetail] ([CarrierTrackingNumber])
INCLUDE ([SalesOrderID],[SalesOrderDetailID],[OrderQty],[LineTotal]);
GO

-- 3. Re-run query to verify performance improvement
SELECT SalesOrderID, SalesOrderDetailID, OrderQty, LineTotal
FROM Sales.SalesOrderDetail
WHERE CarrierTrackingNumber = '4859-42B8-85';
GO

GO