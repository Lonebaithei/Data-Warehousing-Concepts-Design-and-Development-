ALTER TABLE Courses   
ADD CONSTRAINT FK_Courses_Department   
FOREIGN KEY (DepartmentID ) REFERENCES Departments (DepartmentID );  
