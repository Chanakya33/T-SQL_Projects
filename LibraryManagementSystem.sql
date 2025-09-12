CREATE DATABASE LibraryDB;
GO


USE LibraryDB;
GO




CREATE TABLE Authors(

	AuthorID INT primary Key IDENTITY(1,1),
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	BirthDate DATE

	);





CREATE TABLE Books(

	BookID INT primary key IDENTITY(1,1),
	Title VARCHAR(100) NOT NULL,
	AuthorID INT,
	PublicationYear INT,
	Genre VARCHAR(50),
	FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)

	);

GO



CREATE TABLE Members(

	MembersID INT primary key IDENTITY(1,1),
	FullName VARCHAR(50) NOT NULL,
	MembershipDate DATE,
	Email VARCHAR(60)

);
GO








INSERT INTO Authors VALUES('George', 'Orwell', '1903-06-25'),
						  ('Jane', 'Austen', '1775-12-16'),
						  ('Mark', 'Twain', '1835-11-30');
GO


SELECT * FROM Authors;
GO




INSERT INTO Books VALUES('1984', 1, 1949, 'Dystopian'),
						('Pride and Prejudice', 2, 1813, 'Romance'),
						('The Adventures of Huckleberry Finn', 3, 1884, 'Adventure');
GO



SELECT * FROM  Books;
GO





INSERT INTO Members VALUES('Alice Johnson', '2023-01-15', 'alice@example.com'),
						  ('Bob Smith', '2023-02-20', 'bob@example.com'),
						  ('Charlie Brown', '2023-03-05', 'charlie@example.com');
GO


SELECT * FROM Members;
GO


