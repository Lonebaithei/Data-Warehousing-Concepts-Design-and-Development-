-- ===================================================== -- 4. Transformation  --    (Join staging tables to compute total credits per enrollment) -- ===================================================== 
USE Lone_University_Staging ; 
GO 
 
SELECT  
    e.EnrollmentID , 
    e.StudentID , 
    e.CourseID , 
    e.EnrollmentDate , 
    e.Status , 
    e.Semester , 
    e.AcademicYear , 
    c.Credits , 
    d.DepartmentName , 
    d.Faculty 
FROM Stg_Enrollments e 
JOIN Stg_Courses c ON e.CourseID = c.CourseID 
JOIN Stg_Departments d ON c.DepartmentID = d.DepartmentID ; 