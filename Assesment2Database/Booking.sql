﻿CREATE TABLE [dbo].[Booking]
(
	[BookingId] INT NOT NULL PRIMARY KEY, 
	[ClientId] INT NOT NULL, 
	[TourEventId] INT NOT NULL,
	[TourName] NVARCHAR(50) NOT NULL,
    [Payment] INT NULL, 
    [DateBooked] NVARCHAR(50) NULL
	CONSTRAINT FK_Booking_Tour FOREIGN KEY ([TourName]) REFERENCES [Tour] ([TourName])
	CONSTRAINT FK_Booking_Client FOREIGN KEY ([ClientId]) REFERENCES [Client] ([ClientId])
	CONSTRAINT FK_Booking_TourEvent FOREIGN KEY ([TourEventId]) REFERENCES [TourEvent] ([TourEventId])



)
