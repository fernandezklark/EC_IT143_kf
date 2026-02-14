-- Reload data
TRUNCATE TABLE dbo.t_drivers;

INSERT INTO dbo.t_drivers (total_drivers)
SELECT total_drivers FROM dbo.v_drivers_load;

-- Review results
SELECT * FROM dbo.t_drivers;