CREATE TABLE [dbo].[Booking]
(
	[BookingId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
	[TourName] NVARCHAR(50) NOT NULL,
	[EventMonth] NVARCHAR(50) NULL,
	[EventDay] NVARCHAR(50) NULL,
	[EventYear] NVARCHAR(4) NULL,
    [Payment] INT NULL, 
    [DateBooked] DATE NULL
	CONSTRAINT FK_Booking_TourEvent_TourName FOREIGN KEY ([TourName]) REFERENCES [TourEvent] ([TourName])
	CONSTRAINT FK_Booking_TourEvent_EventMonth FOREIGN KEY ([EventMonth]) REFERENCES [TourEvent] ([EventMonth])
	CONSTRAINT FK_Booking_TourEvent_EventDay FOREIGN KEY ([EventDay]) REFERENCES [TourEvent] ([EventDay])
	CONSTRAINT FK_Booking_TourEvent_EventYear FOREIGN KEY ([EventYear]) REFERENCES [TourEvent] ([EventYear])
)
