CREATE DATABASE RetailStoreDB;

USE RetailStoreDB;


CREATE TABLE Customers(

	CustomerID INT PRIMARY KEY IDENTITY(1,1),
	FullName NVARCHAR(100) NOT NULL,
	Email NVARCHAR(100) NOT NULL

	);


SELECT * FROM Customers;


CREATE TABLE Products(

	ProductID INT PRIMARY KEY IDENTITY(1,1),
	ProductName NVARCHAR(100) NOT NULL,
	Price DECIMAL(10,2) NOT NULL

	);


SELECT * FROM Products;




CREATE TABLE Orders(

	OrderID INT PRIMARY KEY IDENTITY(1,1),
	CustomerID INT,
	OrderDate DATE NOT NULL
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)

	);



SELECT * FROM Orders;



CREATE TABLE OrderDetails(

	OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
	OrderID INT,
	ProductID INT,
	Quantity INT NOT NULL
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)

	);


SELECT * FROM OrderDetails;




INSERT INTO Customers
VALUES
('Alice Johnson', 'alice@example.com'),
('Bob Smith', 'bob@example.com'),
('Charlie Brown', 'charlie@example.com');


INSERT INTO Products
VALUES
('Laptop', 899.99),
('Smart Phone', 399.99),
('Tablet', 199.97);



INSERT INTO Orders
VALUES
(1, '2024-09-01'), -- Alice's order
(2, '2024-09-02'); -- Bob's order


INSERT INTO OrderDetails
VALUES
(1, 1, 1), -- Alice ordered 1 Laptop
(1, 2, 2), -- Alice ordered 2 Smartphones
(2, 3, 1); -- Bob ordered 1 Tablet



SELECT * FROM Customers;

SELECT * FROM Products;

SELECT * FROM Orders;


SELECT * FROM OrderDetails;






--JOINING TABLES




--INNER  OUTER JOIN

--Retrieving all orders along with customer names.

SELECT O.OrderID, C.FullName, O.OrderDate
FROM Orders O
INNER JOIN Customers C ON O.CustomerID = C.CustomerID;



--LEFT OUTER JOIN

--Retrieving all customers and their orders, including those who haven't placed any orders.

SELECT C.FullName, O.OrderID, O.OrderDate
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID;


--RIGHT OUTER JOIN

--Retrieving all products and the orders they are associated with, including products that have not been ordered.


SELECT P.ProductName, O.OrderID, O.OrderDate
FROM Products P
RIGHT JOIN OrderDetails OD ON P.ProductID = OD.ProductID
RIGHT JOIN Orders O ON OD.OrderID = O.OrderID;



--FULL OUTER JOIN

--Retrieving all customers, orders, and products, including those without a match in any table.

SELECT C.FullName, O.OrderID, P.ProductName
FROM Customers C
FULL OUTER JOIN Orders O ON C.CustomerID = O.CustomerID
FULL OUTER JOIN OrderDetails OD ON O.OrderID = OD.OrderID
FULL OUTER JOIN Products P ON OD.ProductID = P.ProductID;

