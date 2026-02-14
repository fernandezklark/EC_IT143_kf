DROP VIEW IF EXISTS dbo.v_drivers_load;
GO

CREATE VIEW dbo.v_drivers_load
AS
/*****************************************************************************************************************
NAME:    dbo.v_drivers_load
PURPOSE: Create the Drivers Load view
******************************************************************************************************************/
SELECT COUNT(*) AS total_drivers FROM dbo.drivers;
GO