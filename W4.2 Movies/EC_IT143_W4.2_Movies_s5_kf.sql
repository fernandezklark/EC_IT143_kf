DROP TABLE IF EXISTS dbo.t_movies;
GO

CREATE TABLE dbo.t_movies
(
    total_movies INT NOT NULL,
    load_date DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_t_movies PRIMARY KEY CLUSTERED (total_movies ASC)
);
GO