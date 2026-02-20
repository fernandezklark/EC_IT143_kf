

-- 1. Unindexed query to generate missing index recommendation
SELECT SalesOrderID, OrderDate, AccountNumber, PurchaseOrderNumber
FROM Sales.SalesOrderHeader
WHERE PurchaseOrderNumber = 'PO18850127500';
GO

-- 2. Create the recommended missing index
CREATE NONCLUSTERED INDEX IX_SalesOrderHeader_PurchaseOrder
ON [Sales].[SalesOrderHeader] ([PurchaseOrderNumber])
INCLUDE ([SalesOrderID], [OrderDate], [AccountNumber]);
GO

-- 3. Re-run query to verify performance improvement
SELECT SalesOrderID, OrderDate, AccountNumber, PurchaseOrderNumber
FROM Sales.SalesOrderHeader
WHERE PurchaseOrderNumber = 'PO18850127500';
GO