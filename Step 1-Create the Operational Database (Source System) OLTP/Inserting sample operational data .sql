 -- Insert sample operational data 
INSERT INTO Departments VALUES   
( 'MATH' , 'Mathematics' , 'Science Faculty' ),  
( 'PHYS' , 'Physics' , 'Science Faculty' ),  
( 'HIST' , 'History' , 'Humanities Faculty' ),  
( 'COMP' , 'Computer Science' , 'Engineering Faculty' );  
 
INSERT INTO Courses (CourseCode , CourseName , Credits , DepartmentID , MaxStudents ) 
VALUES  
( 'MATH101' , 'Calculus I' , 4, 1, 30),  
( 'MATH201' , 'Linear Algebra' , 3, 1, 25),  
( 'PHYS101' , 'Physics I' , 4, 2, 28),  
( 'HIST101' , 'World History' , 3, 3, 35),  
( 'COMP101' , 'Programming Basics' , 4, 4, 30);  
 
INSERT INTO Students (StudentNumber , FirstName , LastName , Email , Phone, City , 
EnrollmentDate ) VALUES  
( 'S001' , 'John' , 'Doe' , 'john.doe@email.com' , '555-0101' , 'New York' , '2023-09-01' ), 
( 'S002' , 'Jane' , 'Smith' , 'jane.smith@email.com' , '555-0102' , 'Boston' , '2023-09-01' ), 
( 'S003' , 'Bob' , 'Johnson' , 'bob.j@email.com' , '555-0103' , 'Chicago' , '2024-01-15' ), 
( 'S004' , 'Alice' , 'Williams' , 'alice.w@email.com' , '555-0104' , 'New York' , '2023-09-01' ), 
( 'S005' , 'Charlie' , 'Brown' , 'charlie.b@email.com' , '555-0105' , 'Boston' , '2024-01-15' ), 
( 'S006' , 'Diana' , 'Prince' , 'diana.p@email.com' , '555-0106' , 'Chicago' , '2023-09-01' );  
 
INSERT INTO Enrollments (StudentID , CourseID , EnrollmentDate , Status , Grade , 
Semester , AcademicYear ) VALUES  
(1, 1, '2023-09-01' , 'Completed' , 'A' ,  'Fall' , '2023/24' ),  
(1, 3, '2024-01-15' , 'Enrolled' ,  NULL, 'Spring' , '2023/24' ),  
(2, 1, '2023-09-01' , 'Completed' , 'A-' , 'Fall' , '2023/24' ),  
(2, 4, '2024-01-15' , 'Enrolled' ,  NULL, 'Spring' , '2023/24' ),  
(3, 2, '2024-01-15' , 'Enrolled' ,  NULL, 'Spring' , '2023/24' ),  
(4, 5, '2023-09-01' , 'Completed' , 'B+' , 'Fall' , '2023/24' ),  
(5, 3, '2024-01-15' , 'Enrolled' ,  NULL, 'Spring' , '2023/24' ),  
(6, 1, '2023-09-01' , 'Completed' , 'B' ,  'Fall' , '2023/24' ); 