CREATE TABLE Student (
    StudentID NUMBER(5) PRIMARY KEY,
    StudentName VARCHAR2(20),
    DepartmentID NUMBER(5)
);

-- Insert Student records
INSERT INTO Student VALUES (1001, 'Arun', 10);
INSERT INTO Student VALUES (1002, 'Priya', 20);
INSERT INTO Student VALUES (1003, 'Kumar', 10);

-- Create the Department table
CREATE TABLE Department (
    DepartmentID NUMBER(5) PRIMARY KEY,
    DepartmentName VARCHAR2(50)
);

-- Insert Department records
INSERT INTO Department VALUES (10, 'Computer Science');
INSERT INTO Department VALUES (20, 'Mathematics');

-- Create the Course table
CREATE TABLE Course (
    CourseID NUMBER(5) PRIMARY KEY,
    CourseName VARCHAR2(50)
);

-- Insert Course records
INSERT INTO Course VALUES (201, 'Database Systems');
INSERT INTO Course VALUES (202, 'Data Structures');
INSERT INTO Course VALUES (203, 'Mathematics');

-- Create the Enrollment table
CREATE TABLE Enrollment (
    EnrollmentID NUMBER(5) PRIMARY KEY,
    StudentID NUMBER(5),
    CourseID NUMBER(5)
);

-- Insert Enrollment records
INSERT INTO Enrollment VALUES (1, 1001, 201);
INSERT INTO Enrollment VALUES (2, 1001, 202);
INSERT INTO Enrollment VALUES (3, 1002, 203);
INSERT INTO Enrollment VALUES (4, 1003, 201);

-- Create the StudentDetails view
CREATE VIEW StudentDetails AS
SELECT
    Student.StudentName,
    Course.CourseName,
    Department.DepartmentName
FROM Student
INNER JOIN Enrollment
    ON Student.StudentID = Enrollment.StudentID
INNER JOIN Course
    ON Enrollment.CourseID = Course.CourseID
INNER JOIN Department
    ON Student.DepartmentID = Department.DepartmentID;

-- Display the view
SELECT * FROM StudentDetails;
