---DATABASE CREATION
CREATE DATABASE DeKUT_DB;
USE DeKUT_DB;

---STUDENTS TABLE
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Gender VARCHAR(10),
    Course VARCHAR(100),
    YearOfStudy INT
);

INSERT INTO Students
(StudentID, FullName, Gender, Course, YearOfStudy)

VALUES
(101, 'Eliud Kigen', 'Male', 'Telecommunication Engineering', 2),
(102, 'Faith Wanjiru', 'Female', 'Computer Science', 1),
(103, 'Kevin Otieno', 'Male', 'Electrical Engineering', 3),
(104, 'Mercy Njeri', 'Female', 'Information Technology', 4),
(105, 'Brian Mwangi', 'Male', 'Mechanical Engineering', 2);

SELECT * FROM Students;

---LIBRARY TABLE
CREATE TABLE Library(
  BookID INT PRIMARY KEY,
  BookTitle VARCHAR(100),
  Author VARCHAR(100),
  Department VARCHAR(100),
  CopiesAvailable INT
);

SELECT * FROM Library;

INSERT INTO Library
(BookID, BookTitle, Author, Department, CopiesAvailable)

VALUES
(1, 'Digital Electronics', 'Morris Mano', 'Electrical', 10),
(2, 'Database Systems', 'Elmasri', 'Computer Science', 5),
(3, 'Engineering Mathematics', 'K.A Stroud', 'Mathematics', 8),
(4, 'Networking Basics', 'Cisco', 'Networking', 6),
(5, 'Python Programming', 'John Zelle', 'Programming', 12);


---FINANCE TABLE
CREATE TABLE Finance (
   TransactionID INT PRIMARY KEY,
   StudentID INT,
   FeeAmount INT,
   Balance INT,

   FOREIGN KEY (StudentID)
   REFERENCES Students(StudentID)
);

INSERT INTO Finance
(TransactionID, StudentID, FeeAmount, Balance)

VALUES 
(201, 101, 8000,5000),
(202, 102,9000, 10000),
(203, 103, 85000, 0),
(204, 104, 95000, 15000),
(205,105, 87000, 7000);

SELECT * FROM Finance;

---CLASSROM TABLE
CREATE TABLE Classrooms (
    RoomID INT PRIMARY KEY,
    RoomName VARCHAR(50),
    Capacity INT,
    Building VARCHAR(50)
);

INSERT INTO Classrooms
(RoomID, RoomName, Capacity, Building)

VALUES
(1, 'RC1', 200, 'Resource Center'),
(2, 'RC19', 150, 'Resource Center'),
(3, 'CNT Lab', 60, 'Engineering Block'),
(4, 'Satima', 50, 'Engineering Block'),
(5, 'Room 204', 80, 'Administration Block');

SELECT * FROM Classrooms;

---VEHICLES TABLE
CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY,
    VehicleName VARCHAR(50),
    RegistrationNumber VARCHAR(20),
    Capacity INT
);

SELECT * FROM Vehicles;


---STAFF TABLE
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Department VARCHAR(50),
    Position VARCHAR(50),
    Salary INT
);

INSERT INTO Staff
(StaffID, FullName, Department, Position, Salary)

VALUES
(1, 'Dr. Maina', 'Engineering', 'Lecturer', 120000),
(2, 'Mary Wambui', 'Finance', 'Accountant', 90000),
(3, 'John Kariuki', 'Library', 'Librarian', 70000),
(4, 'Peter Mwangi', 'ICT', 'System Admin', 110000),
(5, 'Grace Njeri', 'Administration', 'Registrar', 130000);

SELECT * FROM Staff;

SELECT 
    Students.FullName,
    Students.Course,
    Finance.FeeAmount,
    Finance.Balance
 
 FROM Students
 
 INNER JOIN Finance
 ON Students.StudentID = Finance.StudentID;

 SELECT
     Students.FullNAME,
     Finance.Balance

 FROM Students

 INNER JOIN Finance
 ON Students.StudentID = Finance.StudentID
 WHERE Finance.Balance > 0;

 SELECT
    Students.FullName,
    Finance.FeeAmount

FROM Students

INNER JOIN Finance
ON Students.StudentID = Finance.StudentID

ORDER BY Finance.FeeAmount DESC;

SELECT COUNT(*) AS TotalStudents
FROM STUDENTS

SELECT AVG(Salary) AS AverageSalary
FROM Staff;

SELECT *
FROM Classrooms
ORDER BY Capacity DESC;

SELECT *
FROM Vehicles
WHERE Capacity > 30;

SELECT 
    Course,
    COUNT(*) AS NumbeerOfStudents

FROM Students

GROUP BY Course

SELECT SUM(FeeAmount) AS totalFeeCollected
FROM Finance;

SELECT *
FROM Staff
WHERE Salary > 100000;

SELECT *
FROM Library
WHERE CopiesAvailable < 7;

SELECT 
    Course,
    COUNT(*) AS StudentCount

 FROM Students
 
 GROUP BY Course

 HAVING COUNT(*) >= 1;