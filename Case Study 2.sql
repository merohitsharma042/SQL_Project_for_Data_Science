Create database Case_study_2

Use Case_study_2

CREATE TABLE LOCATION (
  Location_ID INT PRIMARY KEY,
  City VARCHAR(50))

INSERT INTO LOCATION (Location_ID, City)
VALUES (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston')

Select * from LOCATION

CREATE TABLE DEPARTMENT (
  Department_Id INT PRIMARY KEY,
  Name VARCHAR(50),
  Location_Id INT,
  FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID))

INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167)

Select * from DEPARTMENT


CREATE TABLE JOB
(JOB_ID INT PRIMARY KEY,
DESIGNATION VARCHAR(20))

INSERT  INTO JOB VALUES
(667, 'CLERK'),
(668,'STAFF'),
(669,'ANALYST'),
(670,'SALES_PERSON'),
(671,'MANAGER'),
(672, 'PRESIDENT')

Select * from JOB

CREATE TABLE EMPLOYEE
(EMPLOYEE_ID INT,
LAST_NAME VARCHAR(20),
FIRST_NAME VARCHAR(20),
MIDDLE_NAME CHAR(1),
JOB_ID INT FOREIGN KEY
REFERENCES JOB(JOB_ID),
MANAGER_ID INT,
HIRE_DATE DATE,
SALARY INT,
COMM INT,
DEPARTMENT_ID  INT FOREIGN KEY
REFERENCES DEPARTMENT(DEPARTMENT_ID))


INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30)


Select * from EMPLOYEE


--Simple Queries:

--1. List all the employee details. 

Select * from EMPLOYEE

--2. List all the department details.

Select * from DEPARTMENT

--3. List all job details. 

Select * from JOB

--4. List all the locations.

Select * from LOCATION

--5. List out the First Name, Last Name, Salary, Commission for allEmployees. 

Select FIRST_NAME, lAST_NAME, SALARY, COMM FROM EMPLOYEE

--6. List out the Employee ID, Last Name, Department ID for all employeesandalias
--Employee ID as "ID of the Employee", Last Name as "Name of theEmployee", Department ID as "Dep_id". 

Select EMPLOYEE_ID as ID_of_the_Employee, LAST_NAME as Name_of_theEmployee, DEPARTMENT_ID as Dep_id from EMPLOYEE

--7. List out the annual salary of the employees with their names only.

Select FIRST_NAME, MIDDLE_NAME, LAST_NAME, SALARY FROM EMPLOYEE

--WHERE Condition:

--1. List the details about "Smith". 

Select * from EMPLOYEE where LAST_NAME = 'SMITH'

--2. List out the employees who are working in department 20. 

SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID = 20

--3. List out the employees who are earning salaries between 3000and4500. 

Select * from Employee Where SALARY between 3000 and 4500

--4. List out the employees who are working in department 10 or 20.

Select * from EMPLOYEE where DEPARTMENT_ID = 10 or DEPARTMENT_ID = 20

--5. Find out the employees who are not working in department 10 or 30.

Select * from EMPLOYEE where NOT DEPARTMENT_ID = 10 or DEPARTMENT_ID = 30

--6. List out the employees whose name starts with 'S'.

Select * from EMPLOYEE where LAST_NAME like 'S%'

--7. List out the employees whose name starts with 'S' and ends with'H'. 

Select * from EMPLOYEE where LAST_NAME like 'S%H'

--8. List out the employees whose name length is 4 and start with 'S'. 

SELECT * FROM EMPLOYEE WHERE LAST_NAME LIKE 'S____'

--9. List out employees who are working in department 10 and draw salaries more than 3500. 

Select * from EMPLOYEE where DEPARTMENT_ID = 10 AND SALARY > 3500

--10. List out the employees who are not receiving commission.

Select * from EMPLOYEE where COMM IS NULL

--ORDER BY Clause:

--1. List out the Employee ID and Last Name in ascending order based on the Employee ID. 

SELECT EMPLOYEE_ID, LAST_NAME FROM EMPLOYEE ORDER BY EMPLOYEE_ID ASC

--2. List out the Employee ID and Name in descending order based onsalary. 

SELECT EMPLOYEE_ID, LAST_NAME FROM EMPLOYEE ORDER BY SALARY DESC

--3. List out the employee details according to their Last Name in ascending-order.

SELECT * FROM EMPLOYEE ORDER BY LAST_NAME ASC

--4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order.

SELECT * FROM EMPLOYEE ORDER BY LAST_NAME ASC

SELECT * FROM EMPLOYEE ORDER BY DEPARTMENT_ID DESC

--GROUP BY and HAVING Clause:

--1. How many employees are in different departments in the organization?

SELECT DEPARTMENT_ID, COUNT(*) as Count_of_Employees
  FROM EMPLOYEE
  GROUP BY DEPARTMENT_ID

--2. List out the department wise maximum salary, minimumsalary and average salary of the employees. 


SELECT  DEPARTMENT_ID, MAX(SALARY) AS MAXIMUM_SALARY, MIN(SALARY) AS MINIMUM_SALARY, AVG(SALARY) AS AVERAGE_SALARY
FROM EMPLOYEE
GROUP BY DEPARTMENT_ID


--3. List out the job wise maximum salary, minimum salary and averagesalary of the employees. 

SELECT  JOB_ID, MAX(SALARY) MAXUM_SALARY, MIN(SALARY) MINMUM_SALARY, AVG(SALARY) AVERAGE_SALARY
FROM EMPLOYEE
GROUP BY JOB_ID

--4. List out the number of employees who joined each month in ascending order.

SELECT DATENAME(MM,HIRE_DATE) MONTH,COUNT(*) As No_Of_Employee
FROM EMPLOYEE
GROUP BY DATENAME(MM,HIRE_DATE)


--5. List out the number of employees for each month and year in
--ascending order based on the year and month. 

SELECT  DATEPART(YYYY,HIRE_DATE) YEAR, DATENAME(MM,HIRE_DATE) MONTH, COUNT(*) As No_Of_Employee
FROM EMPLOYEE
GROUP BY DATEPART(YYYY,HIRE_DATE),DATENAME(MM,HIRE_DATE)

--6. List out the Department ID having at least four employees. 

SELECT DEPARTMENT_ID,COUNT(*) As NUMBER_OF_EMPLOYEES
FROM EMPLOYEE
GROUP BY DEPARTMENT_ID
HAVING COUNT(*)>=4


--7. How many employees joined in the month of January?

SELECT DATENAME(MM,HIRE_DATE) MONTH,COUNT(*) As NUMBER_OF_EMPLOYEES
FROM EMPLOYEE
WHERE DATENAME(MM,HIRE_DATE)='January'
GROUP BY DATENAME(MM,HIRE_DATE)

--8. How many employees joined in the month of January or September?

SELECT DATENAME(MM,HIRE_DATE) MONTH,COUNT(*) As NUMBER_OF_EMPLOYEES
FROM EMPLOYEE
WHERE DATENAME(MM,HIRE_DATE) IN ('JANUARY','SEPTEMBER')
GROUP BY DATENAME(MM,HIRE_DATE)

--9. How many employees joined in 1985?

SELECT DATEPART(YY,HIRE_DATE) YEAR,COUNT(*) As NUMBER_OF_EMPLOYEES
FROM EMPLOYEE
WHERE DATEPART(YY,HIRE_DATE)=1985
GROUP BY DATEPART(YY,HIRE_DATE)

--10. How many employees joined each month in 1985?

SELECT DATEPART(YY,HIRE_DATE) YEAR, DATENAME(MM,HIRE_DATE) MONTH, COUNT(*) As NUMBER_OF_EMPLOYEES
FROM EMPLOYEE
WHERE DATEPART(YY,HIRE_DATE)=1985
GROUP BY DATEPART(YY,HIRE_DATE),DATENAME(MM,HIRE_DATE)

--11. How many employees joined in March 1985?


SELECT DATEPART(YY,HIRE_DATE) YEAR, DATENAME(MM,HIRE_DATE) MONTH, COUNT(*) As NUMBER_OF_EMPLOYEES
FROM  EMPLOYEE
WHERE DATEPART(YY,HIRE_DATE)=1985 AND DATENAME(MM,HIRE_DATE)='MARCH'
GROUP BY DATEPART(YY,HIRE_DATE),DATENAME(MM,HIRE_DATE)


--12. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?

SELECT  DEPARTMENT_ID, COUNT(*) As NUMBER_OF_EMPLOYEES
FROM  EMPLOYEE
WHERE DATEPART(YY,HIRE_DATE)=1985 AND DATENAME(MM,HIRE_DATE)='APRIL'
GROUP BY DEPARTMENT_ID
HAVING COUNT(*)>=3


--Joins:
--1. List out employees with their department names.

SELECT EMPLOYEE_ID,LAST_NAME,SALARY,EMPLOYEE.DEPARTMENT_ID,NAME
FROM EMPLOYEE
INNER JOIN DEPARTMENT
ON EMPLOYEE.DEPARTMENT_ID=DEPARTMENT.DEPARTMENT_ID


--2. Display employees with their designations.

SELECT EMPLOYEE_ID,LAST_NAME,SALARY,EMPLOYEE.DEPARTMENT_ID, JOB.DESIGNATION
FROM EMPLOYEE
INNER JOIN JOB
ON EMPLOYEE.JOB_ID=JOB.JOB_ID

--3. Display the employees with their department names and regional groups. 

SELECT EMPLOYEE_ID,LAST_NAME,SALARY,EMPLOYEE.DEPARTMENT_ID,NAME, City
FROM EMPLOYEE, DEPARTMENT, LOCATION
WHERE EMPLOYEE.DEPARTMENT_ID=DEPARTMENT.DEPARTMENT_ID AND DEPARTMENT.LOCATION_ID=LOCATION.LOCATION_ID

--4. How many employees are working in different departments? Display with department names. 

SELECT NAME, COUNT(*) AS NUMBER_OF_EMPLOYEES
FROM DEPARTMENT
INNER JOIN EMPLOYEE
ON EMPLOYEE.DEPARTMENT_ID=DEPARTMENT.DEPARTMENT_ID
GROUP BY NAME

--5. How many employees are working in the sales department?

SELECT NAME,COUNT(*) AS NUMBER_OF_EMPLOYEES
FROM DEPARTMENT
INNER JOIN EMPLOYEE
ON EMPLOYEE.DEPARTMENT_ID=DEPARTMENT.DEPARTMENT_ID
GROUP BY NAME
HAVING NAME='SALES'

--6. Which is the department having greater than or equal to 5
--employees? Display the department names in ascending
--order.

SELECT Name, COUNT(*) AS NUMBER_OF_EMPLOYEES
FROM DEPARTMENT
INNER JOIN EMPLOYEE
ON EMPLOYEE.DEPARTMENT_ID=DEPARTMENT.DEPARTMENT_ID
GROUP BY NAME
HAVING COUNT(*)>=5

--7. How many jobs are there in the organization? Display with designations. 

SELECT DESIGNATION, COUNT(*) AS NO_OF_JOBS
FROM JOB
INNER JOIN EMPLOYEE
ON EMPLOYEE.JOB_ID=JOB.JOB_ID
GROUP BY DESIGNATION

--8. How many employees are working in "New York"?

SELECT City, COUNT(*) NUMBER_OF_EMPLOYEES
FROM EMPLOYEE
INNER JOIN DEPARTMENT ON EMPLOYEE.DEPARTMENT_ID=DEPARTMENT.DEPARTMENT_ID
INNER JOIN LOCATION ON DEPARTMENT.LOCATION_ID=LOCATION.LOCATION_ID
GROUP BY City
HAVING City='New York'

--9. Display the employee details with salary grades. Use conditional statement to create a grade column.


SELECT Salary_Grade, COUNT(*) NUMBER_OF_EMPLOYEES
FROM 
(SELECT EMPLOYEE.*, CASE
WHEN Salary >= 5000 THEN 'A'
WHEN Salary >= 3000 AND 
     Salary < 5000 THEN 'B'
ELSE 'C'
END AS Salary_Grade
FROM EMPLOYEE) AS Salary_Grades
GROUP BY Salary_Grade


--10. List out the number of employees grade wise. Use conditional statementtocreate a grade column. 

SELECT Salary_Grade, COUNT(*) AS NUMBER_OF_EMPLOYEES
FROM 
(SELECT EMPLOYEE.*, CASE
WHEN Salary >= 5000 THEN 'A'
WHEN Salary >= 3000 AND 
	 Salary < 5000 THEN 'B'
ELSE 'C'
END AS Salary_Grade
FROM EMPLOYEE) AS Salary_Grades
GROUP BY Salary_Grade

--11.Display the employee salary grades and the number of employees
--between 2000 to 5000 range of salary. 

SELECT Salary_Grade, COUNT(*) AS NUMBER_OF_EMPLOYEES
FROM 
(SELECT EMPLOYEE.*, CASE
WHEN Salary >= 5000 THEN 'A'
WHEN Salary >= 3000 AND 
	 Salary < 5000 THEN 'B'
ELSE 'C'
END AS Salary_Grade
FROM EMPLOYEE
WHERE Salary BETWEEN 2000 AND 5000) AS Salary_Grades
GROUP BY Salary_Grade

--12. Display all employees in sales or operation departments.

SELECT EMPLOYEE_ID,LAST_NAME,EMPLOYEE.DEPARTMENT_ID,NAME
FROM EMPLOYEE
LEFT OUTER JOIN DEPARTMENT
ON EMPLOYEE.DEPARTMENT_ID=DEPARTMENT.DEPARTMENT_ID
AND DEPARTMENT.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM DEPARTMENT
WHERE NAME IN('SALES','OPERATIONS'))

--SET Operators:

--1. List out the distinct jobs in sales and accounting departments. 

SELECT DESIGNATION
FROM JOB WHERE JOB_ID IN(SELECT JOB_ID FROM EMPLOYEE
WHERE DEPARTMENT_ID=(SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE NAME='SALES'))
UNION
SELECT DESIGNATION
FROM JOB WHERE JOB_ID IN(SELECT JOB_ID FROM EMPLOYEE
WHERE DEPARTMENT_ID=(SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE NAME='ACCOUNTING'))

--2. List out all the jobs in sales and accounting departments. 

SELECT DESIGNATION
FROM JOB WHERE JOB_ID IN(SELECT JOB_ID FROM EMPLOYEE
WHERE DEPARTMENT_ID=(SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE NAME='SALES'))
UNION ALL
SELECT DESIGNATION
FROM JOB WHERE JOB_ID IN(SELECT JOB_ID FROM EMPLOYEE
WHERE DEPARTMENT_ID=(SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE NAME='ACCOUNTING'))

--3. List out the common jobs in research and accounting
--departments in ascending order.

SELECT DESIGNATION
FROM JOB WHERE JOB_ID IN(SELECT JOB_ID FROM EMPLOYEE
WHERE DEPARTMENT_ID=(SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE NAME='SALES'))
INTERSECT
SELECT DESIGNATION
FROM JOB WHERE JOB_ID IN(SELECT JOB_ID FROM EMPLOYEE
WHERE DEPARTMENT_ID=(SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE NAME='ACCOUNTING'))

--Subqueries:

--1. Display the employees list who got the maximum salary.

SELECT *
FROM EMPLOYEE
WHERE Salary = (SELECT MAX(Salary) FROM EMPLOYEE)

--2. Display the employees who are working in the sales department.

SELECT *
FROM EMPLOYEE
WHERE Department_ID = (SELECT Department_ID FROM DEPARTMENT WHERE Name = 'Sales')

--3. Display the employees who are working as 'Clerk'.

SELECT *
FROM EMPLOYEE
WHERE JOB_ID = (SELECT JOB_ID FROM JOB WHERE Designation = 'Clerk')

--4. Display the list of employees who are living in "New York".

SELECT * FROM EMPLOYEE
WHERE DEPARTMENT_ID IN 
(SELECT DEPARTMENT_ID
FROM DEPARTMENT
WHERE Location_id IN 
(SELECT Location_ID
FROM location
WHERE City = 'New York'))

--5. Find out the number of employees working in the sales department. 

SELECT COUNT(*) AS NUMBER_OF_EMPLOYEES
FROM EMPLOYEE
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE  Name = 'Sales')

--6. Update the salaries of employees who are working as clerks on the basis of
--10%. 

UPDATE EMPLOYEE
SET Salary = Salary * 1.1
WHERE Job_ID = (SELECT Job_ID FROM job WHERE Designation = 'Clerk')

--7. Delete the employees who are working in the accounting department. 

DELETE FROM EMPLOYEE
WHERE Department_ID = (SELECT Department_ID FROM DEPARTMENT WHERE Name = 'Accounting')

--8. Display the second highest salary drawing employee details.



--9. Display the nth highest salary drawing employee details. 

Select * from (Select  LAST_NAME, Salary, DENSE_RANK()
Over (order by salary Desc)r from Employee)
as Second_highest where r=3

--10. List out the employees who earn more than every employee in department 30.

SELECT * FROM EMPLOYEE
WHERE Salary > ALL 
(SELECT Salary
FROM EMPLOYEE
WHERE Department_ID = 30)

--11. List out the employees who earn more than the lowest salary in
--department.

SELECT * FROM EMPLOYEE
WHERE Salary > 
(SELECT MIN(Salary)
FROM EMPLOYEE
WHERE Department_ID = EMPLOYEE.Department_ID)
OR
(SELECT COUNT(*)
FROM EMPLOYEE
WHERE Department_ID = EMPLOYEE.Department_ID) = 0

--12. Find out which department has no employees.

SELECT Department_Id
FROM DEPARTMENT
WHERE Department_Id NOT IN (SELECT DISTINCT Department_ID FROM EMPLOYEE)

--13. Find out the employees who earn greater than the average salary for their department.

SELECT *
FROM EMPLOYEE
WHERE Salary > (
    SELECT AVG(Salary)
    FROM EMPLOYEE
    WHERE Department_ID = EMPLOYEE.Department_ID)
