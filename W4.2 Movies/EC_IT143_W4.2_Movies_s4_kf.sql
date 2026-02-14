DROP VIEW IF EXISTS dbo.v_movies_load;
GO

CREATE VIEW dbo.v_movies_load
AS
/*****************************************************************************************************************
NAME:    dbo.v_movies_load
PURPOSE: Create the Movies Load view
******************************************************************************************************************/
SELECT COUNT(*) AS total_movies FROM dbo.Movies;
GO