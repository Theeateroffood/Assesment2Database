/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

IF '$(LoadTestData)' = 'true'

BEGIN

DELETE FROM Booking;
DELETE FROM TourEvent;
DELETE FROM Client;
DELETE FROM Tour;

INSERT INTO Tour(TourName, [Description]) VALUES
('West','Tour of wineries and outlets of the Geelong and Otways region'),
('East','Tour of wineries and outlets of the Yarra Valley'),
('South','Tour of wineries and outlets of Mornington Penisula'),
('North','Tour of wineries and outlets of the Bedigo and Castlemaine');


INSERT INTO Client(ClientId, Sname, Fname, Gender) VALUES
('1', 'Price', 'Taylor', 'M'),
('2', 'Gamble', 'Ellyse', 'F'),
('3', 'Tan', 'Tilly', 'F');

INSERT INTO TourEvent (TourEventId,TourName,EventMonth,EventDay,EventYear,Fee) VALUES
(1, 'North', 'Jan', '9', '2016','200'),
(2, 'North', 'Feb', '13', '2016','225'),
(3, 'South', 'Jan', '16', '2016','200'),
(4, 'West', 'Jan', '29', '2016','225');

INSERT INTO Booking (BookingId,ClientId,TourEventId,TourName,Payment,DateBooked) VALUES
(1,'1', 1,'North', 200, '10/12/2015'),
(2,'2', 1,'North', 200, '16/12/2015'),
(3,'1', 2,'North', 225, '8/01/2016'),
(4,'2', 2,'North',  225, '14/01/2016'),
(5,'3', 2,'North', 200, '3/02/2016'),
(6,'1', 3,'South', 200, '10/12/2015'),
(7,'2', 3,'South', 200, '18/12/2016'),
(8,'3', 3,'South', 200, '9/01/2016'),
(9,'2', 4,'West', 200, '17/12/2015'),
(10,'3', 4,'West', 200, '18/12/2015');



END;