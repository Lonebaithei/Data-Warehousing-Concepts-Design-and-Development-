-- ===================================================== -- 3. Extract data from OLTP into Staging -- ===================================================== 
INSERT INTO Lone_University_Staging .dbo.Stg_Students 
SELECT * FROM Lone_University_DB .dbo.Students ; 
 
INSERT INTO Lone_University_Staging .dbo.Stg_Courses 
SELECT * FROM Lone_University_DB .dbo.Courses ; 
 
INSERT INTO Lone_University_Staging .dbo.Stg_Departments 
SELECT * FROM Lone_University_DB .dbo.Departments ; 
 
INSERT INTO Lone_University_Staging .dbo.Stg_Enrollments 
SELECT * FROM Lone_University_DB .dbo.Enrollments ; 