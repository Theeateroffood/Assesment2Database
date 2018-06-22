CREATE TABLE [dbo].[Client]
(
	[ClientId] INT NOT NULL CONSTRAINT PK_Client PRIMARY KEY, 
    [Sname] NVARCHAR(50) NULL, 
    [Fname] NVARCHAR(50) NULL, 
    [Gender] NVARCHAR(50) NULL
)
