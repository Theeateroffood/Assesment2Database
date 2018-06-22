CREATE TABLE [dbo].[TourEvent]
(
	[TourEventId] INT NOT NULL CONSTRAINT PK_TourEvent PRIMARY KEY, 
	[TourName] NVARCHAR(50) NOT NULL,
    [EventMonth] NVARCHAR(50) NULL, 
    [EventDay] NVARCHAR(50) NULL, 
    [EventYear] NVARCHAR(4) NULL, 
    [Fee] NVARCHAR(5) NULL
	CONSTRAINT FK_TourEvent_Tour FOREIGN KEY ([TourName]) REFERENCES [Tour] ([TourName])
)
