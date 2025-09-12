select name from sys.databases;

CREATE DATABASE EmployeeDB;

USE EmployeeDB;



CREATE TABLE Departments(

	DepartmentID INT PRIMARY KEY IDENTITY(1, 1),
	DepartmentName NVARCHAR(100) NOT NULL

	);


CREATE TABLE Employees(

	EmployeeID INT PRIMARY KEY IDENTITY(1,1),
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Email NVARCHAR(100) UNIQUE NOT NULL,
	DepartmentID INT,
	Salary MONEY NOT NULL,
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)

	);


SELECT * FROM Employees;
SELECT * FROM Departments;



INSERT INTO Departments(DepartmentName)
VALUES
('Human Resources'),
('IT'),
('Sales'),
('Marketing');


SELECT * FROM Departments;


INSERT INTO Employees(FirstName, LastName, Email, DepartmentID, Salary)
VALUES
('Alice', 'Johnson', 'alice@gmail.com', 1, 70000.00),
('Bob', 'Marley', 'bob@gmail.com', 2, 85000.00),
('Charlie', 'Chaplin', 'charlie@gmail.com', 3, 480000),
('David', 'Goggins', 'David@gmail.com', 2, 75830.27),
('Eve', 'Moraco', 'Eve@gmail.com', 4, 89000.21);



SELECT * FROM Employees;




SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary>(SELECT AVG(Salary) FROM Employees);



SELECT FirstName, LastName
FROM Employees
WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'IT');



CREATE FUNCTION dbo.GetFullName(@EmployeeID INT)
RETURNS NVARCHAR(100)
AS
BEGIN
	DECLARE @FullName NVARCHAR(100);
	SELECT @FullName = FirstName + ' ' + LastName FROM Employees
	WHERE EmployeeID = @EmployeeID;

	RETURN @FullName;
END;



SELECT dbo.GetFullName(EmployeeID) AS FullName, Salary
FROM Employees;





--Used "SelectAll+F5" which is alternative for "GO" batch command
--Project Part 1
