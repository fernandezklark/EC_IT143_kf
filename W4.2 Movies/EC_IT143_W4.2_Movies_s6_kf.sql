-- Reload data
TRUNCATE TABLE dbo.t_movies;

INSERT INTO dbo.t_movies (total_movies)
SELECT total_movies FROM dbo.v_movies_load;

-- Review results
SELECT * FROM dbo.t_movies;