Create Database ABC_Fashion

Use ABC_Fashion

CREATE TABLE Salesman (
SalesmanId INT,
Name VARCHAR(255),
Commission DECIMAL(10, 2),
City VARCHAR(255),
Age INT
);

INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
(101, 'Joe', 50, 'California', 17),
(102, 'Simon', 75, 'Texas', 25),
(103, 'Jessie', 105, 'Florida', 35),
(104, 'Danny', 100, 'Texas', 22),
(105, 'Lia', 65, 'New Jersey', 30);

Select * from Salesman

CREATE TABLE Customer (
SalesmanId INT,
CustomerId INT,
CustomerName VARCHAR(255),
PurchaseAmount INT,
);

INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
(101, 2345, 'Andrew', 550),
(103, 1575, 'Lucky', 4500),
(104, 2345, 'Andrew', 4000),
(107, 3747, 'Remona', 2700),
(110, 4004, 'Julia', 4545);

Select * from Customer

CREATE TABLE Orders (OrderId int, CustomerId int, SalesmanId int, Orderdate Date, Amount
money)

INSERT INTO Orders Values
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500)

Select * from Orders

-- 1. Insert a new record in your Orders table

INSERT INTO Orders VALUES
(5005,6789,109,'2023-05-20',2050)

/* 2. Add Primary key constraint for SalesmanId column in Salesman table. Add default
constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
column in Customer table. Add not null constraint in Customer_name column for the
Customer table */

alter table Salesman alter column SalesmanId int not null 

alter table Salesman add constraint Pri_key Primary Key (SalesmanId)

alter table Salesman add constraint Df_c Default 'Texas' for City

alter table Customer with nocheck add constraint For_key Foreign key (SalesmanId) References Salesman(SalesmanId)

alter table Customer alter column CustomerName varchar(255) not null

/*3. Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase
amount value greater than 500.*/

Select * from Customer where CustomerName like '%n'

Select * from Salesman where Name like '%n'

Select * from Customer where PurchaseAmount > 500

/*4. Using SET operators, retrieve the first result with unique SalesmanId values from two
tables, and the other result containing SalesmanId with duplicates from two tables.*/

Select SalesmanId from Customer
Union
Select SalesmanId from Salesman

Select salesmanId from Customer
Union all
Select SalesmanId from Salesman

Select * from Customer

Select * from Salesman

Select * from Orders

/*5. Display the below columns which has the matching data.
Orderdate, Salesman Name, Customer Name, Commission, and City which has the
range of Purchase Amount between 500 to 1500.*/

Select Orders.Orderdate, Salesman.Name, Customer.Customername, Salesman.Commission, Salesman.City from Salesman
inner join Customer
	on Salesman.SalesmanId = Customer.SalesmanId
inner join Orders
	on orders.SalesmanId = Salesman.SalesmanId
where PurchaseAmount between 500 and 1500

-- 6. Using right join fetch all the results from Salesman and Orders table

Select * from Orders Right join Salesman  on Salesman.SalesmanId = Orders.SalesmanId

Select * from Salesman Right join Orders on Salesman.SalesmanId = Orders.SalesmanId
