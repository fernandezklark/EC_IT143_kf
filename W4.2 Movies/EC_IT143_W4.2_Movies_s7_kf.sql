DROP PROCEDURE IF EXISTS dbo.usp_movies_load;
GO

CREATE PROCEDURE dbo.usp_movies_load
AS
/*****************************************************************************************************************
NAME:    dbo.usp_movies_load
PURPOSE: Movies - Load user stored procedure
******************************************************************************************************************/
BEGIN
    TRUNCATE TABLE dbo.t_movies;

    INSERT INTO dbo.t_movies (total_movies)
    SELECT total_movies FROM dbo.v_movies_load;

    SELECT * FROM dbo.t_movies;
END;
GO