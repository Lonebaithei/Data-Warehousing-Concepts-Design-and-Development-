-- ===================================================== -- 2. Staging Database -- ===================================================== 
CREATE DATABASE Lone_University_Staging ; 
GO 
 
USE Lone_University_Staging ; 
GO 
 
CREATE TABLE Stg_Students ( 
    StudentID INT , 
    StudentNumber VARCHAR(20), 
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
    IsActive BIT 
); 
 
CREATE TABLE Stg_Courses ( 
    CourseID INT , 
    CourseCode VARCHAR(20), 
    CourseName VARCHAR(100), 
    Credits INT , 
    DepartmentID INT , 
    MaxStudents INT , 
    IsActive BIT 
); 
 
CREATE TABLE Stg_Departments ( 
    DepartmentID INT , 
    DepartmentCode VARCHAR(10), 
    DepartmentName VARCHAR(100), 
    Faculty VARCHAR(100) 
); 
 
CREATE TABLE Stg_Enrollments ( 
    EnrollmentID INT , 
    StudentID INT , 
    CourseID INT , 
    EnrollmentDate DATETIME , 
    Status VARCHAR(20), 
    Grade CHAR(2), 
    Semester VARCHAR(20), 
    AcademicYear VARCHAR(9) 
); 