/*****************************************************************************************************************
NAME:    EC_IT143_W5.2_Movies_Answers_kf.sql
PURPOSE: Answer 4 business questions about the Movies community

MODIFICATION LOG:
Ver      Date        Author                 Description
-----   ----------   -----------            -------------------------------------------------------------------------------
1.0     02/14/2026   Klark Omer Fernandez   1. Built this script for EC IT143

RUNTIME: 
1s

NOTES: 
This script answers questions about genres, recent releases, runtimes, and languages.
******************************************************************************************************************/

-- Q1: Which movie genres have the highest average runtime?
-- A1: I will group by genres and calculate the average of the 'runtime' column.
SELECT genres
     , AVG(runtime) AS avg_runtime
  FROM dbo.Movies
 GROUP BY genres
 ORDER BY avg_runtime DESC;

-- Q2: Can you list all movies that were released in the year 2020 or later?
-- A2: I will filter the dataset using the 'release_date' column.
SELECT title
     , release_date
     , status
  FROM dbo.Movies
 WHERE release_date >= '2020-01-01'
 ORDER BY release_date DESC;

-- Q3: What are the top 5 longest movies by runtime?
-- A3: I will select the top 5 records ordered by 'runtime' descending.
SELECT TOP 5 title
           , runtime
           , homepage
  FROM dbo.Movies
 ORDER BY runtime DESC;

-- Q4: (Peer Question from Student B) Which original languages appear most frequently?
-- A4: I will count the movies grouped by 'original_language' to see diversity.
-- (Replaced "Director" question because that column does not exist)
SELECT original_language
     , COUNT(*) AS film_count
  FROM dbo.Movies
 GROUP BY original_language
 ORDER BY film_count DESC;