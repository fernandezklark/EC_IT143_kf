DROP TABLE IF EXISTS dbo.t_drivers;
GO

CREATE TABLE dbo.t_drivers
(
    total_drivers INT NOT NULL,
    load_date DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_t_drivers PRIMARY KEY CLUSTERED (total_drivers ASC)
);
GO