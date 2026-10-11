-- ============== ======================================= -- 1. OLTP Database -- ===================================================== 
CREATE DATABASE Lone_University_DB ; 
GO 
 
USE Lone_University_DB ; 
GO 
 
CREATE TABLE Students (  
    StudentID INT PRIMARY KEY IDENTITY (1,1),  
    StudentNumber VARCHAR(20) UNIQUE,  
    FirstName VARCHAR(50),  
    LastName VARCHAR(50),  
    Email VARCHAR(100),  
    Phone VARCHAR(20),  
    AddressLine1 VARCHAR(100),  
    AddressLine2 VARCHAR(100),  
    City VARCHAR(50),  
    PostalCode VARCHAR(20),  
    DateOfBirth DATE,  
    EnrollmentDate DATE,  
    IsActive BIT DEFAULT 1  
);  
 
CREATE TABLE Courses (  
    CourseID INT PRIMARY KEY IDENTITY (1,1),  
    CourseCode VARCHAR(20) UNIQUE,  
    CourseName VARCHAR(100),  
    Credits INT ,  
    DepartmentID INT ,  
    MaxStudents INT ,  
    IsActive BIT DEFAULT 1  
);  
 
CREATE TABLE Departments (  
    DepartmentID INT PRIMARY KEY IDENTITY (1,1),  
    DepartmentCode VARCHAR(10),  
    DepartmentName VARCHAR(100),  
    Faculty VARCHAR(100)  
);  
 
CREATE TABLE Enrollments (  
    EnrollmentID INT PRIMARY KEY IDENTITY (1,1),  
    StudentID INT FOREIGN KEY REFERENCES Students (StudentID ),  
    CourseID INT FOREIGN KEY REFERENCES Courses (CourseID ),  
    EnrollmentDate DATETIME DEFAULT GETDATE(),  
    Status VARCHAR(20), -- 'Enrolled', 'Dropped', 'Completed'  
    Grade CHAR(2),  
    Semester VARCHAR(20),  
    AcademicYear VARCHAR(9)  
);  
 
