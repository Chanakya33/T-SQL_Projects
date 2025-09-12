CREATE DATABASE UniversityDB;

USE UniversityDB;


CREATE TABLE StudentInfo(

	StudentID INT PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Email VARCHAR(100) NOT NULL UNIQUE

	);



SELECT * FROM  StudentInfo;




CREATE TABLE Courses(

	CourseID INT PRIMARY KEY IDENTITY(1,1),
	CourseName VARCHAR(100) NOT NULL,
	Credits INT NOT NULL CHECK (Credits > 0)


	);



SELECT * FROM Courses;





CREATE TABLE Enrollments(

	EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
	StudentID INT,
	CourseID INT,
	EnrollmentDate DATE NOT NULL,
	FOREIGN KEY (StudentID) REFERENCES StudentInfo(StudentID),
	FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)

	);




SELECT * FROM Enrollments;






INSERT INTO StudentInfo(FirstName, LastName, Email)
VALUES('Alice', 'Johnson', 'alice.johnson@example.com'),
	  ('Bob', 'Smith', 'bob.smith@example.com'),
	  ('Charlie', 'Brown', 'charlie.brown@example.com');



SELECT * FROM  StudentInfo;






INSERT INTO Courses( CourseName, Credits )
VALUES('Database Systems', 3),
	  ('Data Structures', 4),
	  ('Web Development', 3);




SELECT * FROM Courses;




INSERT INTO Enrollments(StudentID, CourseID, EnrollmentDate)
VALUES(1, 1, '2024-09-01'),
	  (1, 2, '2024-09-01'),
	  (2, 1, '2024-09-01'),
	  (3, 3, '2024-09-01');




SELECT * FROM Enrollments;




SELECT E.EnrollmentID, S.FirstName, S.LastName, C.CourseName, E.EnrollmentDate
FROM Enrollments E
JOIN StudentInfo S ON E.StudentID = S.StudentID
JOIN Courses C ON E.CourseID = C.CourseID;
