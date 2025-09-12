CREATE DATABASE CompanyDB;

USE CompanyDB;


SELECT name  FROM sys.databases;




CREATE TABLE Employee(

	EmployeeID INT PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Email VARCHAR(100) UNIQUE,
	HireDate DATE DEFAULT('15-08-2025'),
	Salary DECIMAL(10,2) CHECK(Salary>0)

	);



SELECT * FROM Employee;



CREATE TABLE Departments(

	DeptID INT PRIMARY KEY IDENTITY(1,1),
	DeptName NVARCHAR(100) UNIQUE NOT NULL

	);


SELECT * FROM Departments;





ALTER TABLE Employee ADD DeptID INT;


SELECT * FROM Employee;


ALTER TABLE Employee ADD CONSTRAINT FK_DeptID FOREIGN KEY (DeptID) REFERENCES Departments(DeptID);



EXEC sp_rename 'Employee','Employees';


SELECT * FROM Employees;

SELECT * FROM Departments;


INSERT INTO Departments(DeptName)
VALUES('Sales'), ('Marketing'), ('Finance');


SELECT * FROM Departments;


SELECT * FROM Employees;

INSERT INTO Employees (FirstName, LastName, Email, HireDate, Salary, DeptID)
VALUES
('Chanakya', 'Racharla', 'chanu86886@gmail.com', '2024-01-16', 451976.94, 3),
('Chikku', 'Thudi', 'chikkapotti@gmail.com', '2024-08-17', 350000, 1),
('Vinay', 'Vemumuri', 'VinayVemumuri123@gmail.com', '2023-03-12', 350174.16, 2),
('Naresh', 'Nenavath', 'NareshNenavath143@gmail.com', '2025-04-23', 348000, 3),
('Bomku', 'Muniganti', 'BomkuMuniganti420@gmail.com', '2022-02-28', 255000, 1);


SELECT * FROM Employees;


UPDATE Employees
SET Salary = Salary + (Salary*0.10)
WHERE FirstName = 'Chanakya';



SELECT * FROM Employees;



DELETE FROM Employees WHERE EmployeeID = 6;



SELECT * FROM Employees;



CREATE TABLE Products(

	ProductID INT PRIMARY KEY,
	ProductName NVARCHAR(100),
	Price MONEY,
	AvailableFrom DATETIME,
	IsActive BIT

	);



INSERT INTO Products
VALUES
(101, 'Tea Cup', 220, '2023-01-16 11:00:00', 0),
(102, 'Knife', 350, '2023-01-16 11:00:00', 1),
(103, 'Ice Cream', 450, '2023-01-16 11:00:00', 1);



CREATE TABLE Customers(
	
	CustomerID INT PRIMARY KEY,
	Email VARCHAR(60) UNIQUE,
	PhoneNumber VARCHAR(15)

	);




INSERT INTO Customers
VALUES
(201, 'chanu86886@gmail.com', '8688605730'),
(311, 'chanu984@gmail.com', '9849021632');


SELECT * FROM Employees WHERE HireDate > '2023-12-31';


SELECT * FROM Employees;


UPDATE Employees
SET Salary = 451976.94 + (451976.94*0.10)
WHERE EmployeeID = 2;

SELECT * FROM Employees;


SELECT TOP 3 FirstName, Salary 
FROM Employees 
ORDER BY Salary DESC




SELECT DeptID, AVG(Salary) as AverageSalaryPerDepartment 
FROM Employees 
GROUP BY DeptID;




SELECT FirstName 
FROM Employees 
WHERE FirstName LIKE 'C%';





SELECT *
FROM Employees 
WHERE Salary BETWEEN 50000.00 AND 80000.00;


SELECT * FROM Departments;


ALTER TABLE Employees ADD DeptName NVARCHAR(100);


SELECT  * FROM Employees;



UPDATE Employees
SET DeptName = 'Finance'
WHERE EmployeeID = 2;

UPDATE Employees
SET DeptName = 'Sales'
WHERE EmployeeID = 3;

UPDATE Employees
SET DeptName = 'Marketing'
WHERE EmployeeID = 4;

;UPDATE Employees
SET DeptName = 'Sales'
WHERE EmployeeID = 5;



SELECT * FROM Employees;


SELECT FirstName
FROM Employees
WHERE DeptName IN ('Sales', 'Marketing');



SELECT *
FROM Employees
WHERE Email IS NULL;



SELECT *
FROM Employees
WHERE HireDate<'2020' AND Salary>70000;


