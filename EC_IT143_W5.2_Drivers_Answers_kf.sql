/*****************************************************************************************************************
NAME:    EC_IT143_W5.2_Drivers_Answers_kf.sql
PURPOSE: Answer 4 business questions about the Formula 1 community

MODIFICATION LOG:
Ver      Date        Author                  Description
-----   ----------   -----------            -------------------------------------------------------------------------------
1.0     02/14/2026   Klark Omer Fernandez   1. Built this script for EC IT143

RUNTIME: 
1s

NOTES: 
This script answers questions about driver nationalities, team history, age, and youth talent.
******************************************************************************************************************/

-- Q1: Which countries have produced the highest number of drivers?
-- A1: I will group the drivers by nationality and count them to find the top regions.
SELECT nationality
     , COUNT(*) AS driver_count
  FROM dbo.drivers
 GROUP BY nationality
 ORDER BY driver_count DESC;

-- Q2: Can you provide a list of drivers who have competed for the 'Ferrari' team?
-- A2: I will search for 'ferrari' in the driver's URL or bio field to identify team history.
SELECT forename
     , surname
     , url
  FROM dbo.drivers
 WHERE url LIKE '%ferrari%';

-- Q3: What is the average age of drivers?
-- A3: I will calculate the difference between the Date of Birth (dob) and today.
SELECT AVG(DATEDIFF(year, dob, GETDATE())) AS avg_current_age
  FROM dbo.drivers
 WHERE dob IS NOT NULL;

-- Q4: (Peer Question from Student A) Who are the youngest drivers in the dataset?
-- A4: I will sort the drivers by Date of Birth in descending order to see the youngest first.
SELECT TOP 10 forename
            , surname
            , dob
            , nationality
  FROM dbo.drivers
 ORDER BY dob DESC;