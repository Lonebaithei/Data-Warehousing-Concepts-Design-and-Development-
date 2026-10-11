-- Created by GitHub Copilot in SSMS - review carefully before executing
-- ===================================================== 
-- 5. Data Warehouse  
-- ===================================================== 
CREATE DATABASE University_DW ; 
GO

-- ===================================================== 
-- 6. Dimension Tables (using three-part names)
-- ===================================================== 
-- DimDate (populated for a wide date range) 
CREATE TABLE University_DW.dbo.DimDate ( 
    DateKey INT PRIMARY KEY, 
    FullDate DATE, 
    Year INT, 
    Month INT, 
    Day INT 
); 
GO 

DECLARE @StartDate DATE = '2020-01-01'; 
DECLARE @EndDate DATE = '2026-12-31'; 
WHILE @StartDate <= @EndDate 
BEGIN 
    INSERT INTO University_DW.dbo.DimDate (DateKey, FullDate, Year, Month, Day) 
    VALUES ( 
        CONVERT(INT, FORMAT(@StartDate, 'yyyyMMdd')), 
        @StartDate, 
        YEAR(@StartDate), 
        MONTH(@StartDate), 
        DAY(@StartDate) 
    ); 
    SET @StartDate = DATEADD(DAY, 1, @StartDate); 
END 
GO 

-- DimStudent (SCD Type 1) 
CREATE TABLE University_DW.dbo.DimStudent ( 
    StudentKey INT IDENTITY (1,1) PRIMARY KEY, 
    StudentID INT,                -- natural key 
    StudentNumber VARCHAR(20), 
    FirstName VARCHAR(50), 
    LastName VARCHAR(50), 
    Email VARCHAR(100), 
    Phone VARCHAR(20), 
    City VARCHAR(50), 
    EnrollmentDate DATE, 
    IsActive BIT 
); 

-- DimCourse 
CREATE TABLE University_DW.dbo.DimCourse ( 
    CourseKey INT IDENTITY (1,1) PRIMARY KEY, 
    CourseID INT,                 -- natural key 
    CourseCode VARCHAR(20), 
    CourseName VARCHAR(100), 
    Credits INT, 
    MaxStudents INT, 
    DepartmentCode VARCHAR(10), 
    DepartmentName VARCHAR(100), 
    Faculty VARCHAR(100), 
    IsActive BIT 
); 

-- ===================================================== 
-- 7. Fact Table 
-- ===================================================== 
CREATE TABLE University_DW.dbo.FactEnrollment ( 
    EnrollmentKey INT IDENTITY (1,1) PRIMARY KEY, 
    StudentKey INT, 
    CourseKey INT, 
    DateKey INT,                  -- enrollment date 
    Credits INT,                   -- measure 
    Status VARCHAR(20),            -- degenerate dimension 
    Semester VARCHAR(20),          -- degenerate dimension 
    AcademicYear VARCHAR(9),       -- degenerate dimension 
    Grade CHAR(2),                 -- degenerate dimension 
    -- Foreign keys 
    FOREIGN KEY (StudentKey) REFERENCES University_DW.dbo.DimStudent (StudentKey), 
    FOREIGN KEY (CourseKey) REFERENCES University_DW.dbo.DimCourse (CourseKey), 
    FOREIGN KEY (DateKey) REFERENCES University_DW.dbo.DimDate (DateKey) 
); 
GO 

-- ===================================================== 
-- 8. Load Dimensions from Staging 
-- ===================================================== 
-- DimStudent 
INSERT INTO University_DW.dbo.DimStudent ( 
    StudentID, StudentNumber, FirstName, LastName, Email, 
    Phone, City, EnrollmentDate, IsActive 
) 
SELECT DISTINCT 
    s.StudentID, 
    s.StudentNumber, 
    s.FirstName, 
    s.LastName, 
    s.Email, 
    s.Phone, 
    s.City, 
    s.EnrollmentDate, 
    s.IsActive 
FROM Lone_University_Staging.dbo.Stg_Students s; 

-- DimCourse 
INSERT INTO University_DW.dbo.DimCourse ( 
    CourseID, CourseCode, CourseName, Credits, MaxStudents, 
    DepartmentCode, DepartmentName, Faculty, IsActive 
) 
SELECT DISTINCT 
    c.CourseID, 
    c.CourseCode, 
    c.CourseName, 
    c.Credits, 
    c.MaxStudents, 
    d.DepartmentCode, 
    d.DepartmentName, 
    d.Faculty, 
    c.IsActive 
FROM Lone_University_Staging.dbo.Stg_Courses c 
JOIN Lone_University_Staging.dbo.Stg_Departments d ON c.DepartmentID = d.DepartmentID; 

-- ===================================================== 
-- 9. Load Fact Table from Staging 
-- ===================================================== 
INSERT INTO University_DW.dbo.FactEnrollment ( 
    StudentKey, CourseKey, DateKey, Credits, 
    Status, Semester, AcademicYear, Grade 
) 
SELECT 
    ds.StudentKey, 
    dc.CourseKey, 
    CONVERT(INT, FORMAT(e.EnrollmentDate, 'yyyyMMdd')) AS DateKey, 
    dc.Credits, 
    e.Status, 
    e.Semester, 
    e.AcademicYear, 
    e.Grade 
FROM Lone_University_Staging.dbo.Stg_Enrollments e 
JOIN University_DW.dbo.DimStudent ds ON e.StudentID = ds.StudentID 
JOIN University_DW.dbo.DimCourse dc ON e.CourseID = dc.CourseID; 

-- ===================================================== 
-- 10. Verify the loaded fact table 
-- ===================================================== 
SELECT * FROM University_DW.dbo.FactEnrollment;