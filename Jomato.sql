Use Jomato

Select * from Jomato

/*1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick
Chicken Bites’.*/

Create Function Chicken (@Quick_bites varchar(255)) 
returns varchar(255)
as begin
return (substring (@Quick_bites,1,5) + ' Chicken ' + Substring(@Quick_bites,7,5))
End

Select dbo.chicken('Quick bites')

/*2. Use the function to display the restaurant name and cuisine type which has the
maximum number of rating.*/

Select RestaurantName, CuisinesType, No_of_Rating from Jomato where No_of_Rating = (Select Max(No_of_Rating) from Jomato)

/*3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4
start rating, ‘Good’ if it has above 3.5 and below 5 star rating, ‘Average’ if it is above 3
and below 3.5 and ‘Bad’ if it is below 3 star rating.*/

SELECT 
    Rating,
    CASE
        WHEN Rating > 4 THEN 'Excellent'
        WHEN Rating > 3.5 AND Rating <= 4 THEN 'Good'
        WHEN Rating > 3 AND Rating <= 3.5 THEN 'Average'
        WHEN Rating <= 3 THEN 'Bad'
    END AS Rating_Status
FROM Jomato


/*4. Find the Ceil, floor and absolute values of the rating column and display the current date
and separately display the year, month_name and day.*/

SELECT 
    Rating,
    CEILING(Rating)   AS Ceil_Value,
    FLOOR(Rating)     AS Floor_Value,
    ABS(Rating)       AS Absolute_Value,
    GETDATE()         AS Current_DateTime,
    YEAR(GETDATE())   AS Year,
    DATENAME(MONTH, GETDATE()) AS Month_Name,
    DAY(GETDATE())    AS Day
FROM Jomato


/*5. Display the restaurant type and total average cost using rollup.*/

SELECT RestaurantType, SUM(AverageCost) AS Total_Average_cost
FROM Jomato
GROUP BY RestaurantType with Rollup
