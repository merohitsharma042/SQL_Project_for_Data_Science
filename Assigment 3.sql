Use Jomato

Select * from Jomato

/*1. Create a stored procedure to display the restaurant name, type and cuisine where the
table booking is not zero*/

Create Procedure Booked_Table
as
Select RestaurantName, RestaurantType, CuisinesType
from Jomato where TableBooking <> 0

Exec Booked_Table

/*2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result
and rollback it.*/

BEGIN TRANSACTION;

UPDATE Jomato
SET CuisinesType = 'Cafeteria'
WHERE CuisinesType = 'Cafe';

SELECT * FROM Jomato WHERE CuisinesType = 'Cafeteria';

ROLLBACK;

SELECT * FROM Jomato WHERE CuisinesType = 'Cafe'


/*3. Generate a row number column and find the top 5 areas with the highest rating of
restaurants.*/

Select TOP(5) Rating, RestaurantName, Area from Jomato Order by Rating Desc

/*4. Use the while loop to display the 1 to 50.*/

Declare @i int = 1

while @i <=50 
begin
	print @i;
	Set @i = @i + 1;
End

/*5. Write a query to Create a Top rating view to store the generated top 5 highest rating of
restaurants.*/

Create View TopRating as Select TOP 5 Rating, RestaurantName, Area from Jomato Order by Rating Desc

Select * from TopRating

/*6. Create a trigger that give an message whenever a new record is inserted.*/CREATE TRIGGER New_Record_Trigger
ON Jomato
AFTER INSERT
AS
BEGIN
    PRINT 'A new restaurant record has been inserted.'
END;

