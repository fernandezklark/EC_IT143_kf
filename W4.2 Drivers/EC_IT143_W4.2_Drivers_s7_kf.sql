DROP PROCEDURE IF EXISTS dbo.usp_drivers_load;
GO

CREATE PROCEDURE dbo.usp_drivers_load
AS
/*****************************************************************************************************************
NAME:    dbo.usp_drivers_load
PURPOSE: Drivers - Load user stored procedure
******************************************************************************************************************/
BEGIN
    TRUNCATE TABLE dbo.t_drivers;

    INSERT INTO dbo.t_drivers (total_drivers)
    SELECT total_drivers FROM dbo.v_drivers_load;

    SELECT * FROM dbo.t_drivers;
END;
GO