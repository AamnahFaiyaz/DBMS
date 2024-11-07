REM   Script: Student-Course Tables Practical
REM   Practical Question 1

CREATE TABLE Course ( 
    DeptNo NUMBER(2) PRIMARY KEY, 
    Dname VARCHAR2(20), 
    Location VARCHAR2(10) 
);

CREATE TABLE Student ( 
    StudentId NUMBER(4) PRIMARY KEY, 
    Student_name VARCHAR2(40) NOT NULL, 
    Address1 VARCHAR2(300), 
    Gender VARCHAR2(15), 
    Course VARCHAR2(8), 
    Deptno NUMBER(2), 
    CONSTRAINT fk_dept FOREIGN KEY (Deptno) REFERENCES Course(DeptNo) 
);

INSERT INTO Course VALUES (10, 'Computer Science', 'New York');

INSERT INTO Course VALUES (20, 'Mechanical', 'India');

INSERT INTO Course VALUES (30, 'Electrical', 'Chicago');

INSERT INTO Course VALUES (40, 'Civil Engineering', 'Miami');

INSERT INTO Course VALUES (50, 'MCA', 'Houston');

INSERT INTO Student  
VALUES (7369, 'John Doe', '123 Elm St', 'Male', 'BCA', 10);

INSERT INTO Student  
VALUES (7777, 'Jane Smith', '456 Oak St', 'Female', 'MCA', 50);

INSERT INTO Student  
VALUES (0927, 'Samantha Brown', '789 Pine St', 'Female', 'BCA', 10);

INSERT INTO Student  
VALUES (2365, 'Michael Green', '321 Maple St', 'Male', 'MCA', 50);

INSERT INTO Student  
VALUES (2233, 'Steve Harris', '654 Cedar St', 'Male', 'BCA', 20);

SELECT * FROM Student;

SELECT Dname, Location FROM Course;

SELECT StudentId, Course FROM Student;

SELECT Dname, Location FROM Course;

SELECT * FROM Student WHERE Course = 'MCA';

SELECT Student_name  
FROM Student  
WHERE StudentId IN (7369, 7777, 2233);

SELECT Student_name  
FROM Student  
WHERE Deptno NOT IN (10, 40);

SELECT Student_name  
FROM Student  
WHERE Deptno NOT IN (10, 40);

SELECT Student_name  
FROM Student  
WHERE Student_name LIKE 'S%' AND Student_name NOT LIKE 's%';

SELECT Student_name  
FROM Student  
WHERE Student_name LIKE '_k%';

SELECT *  
FROM Student  
WHERE Deptno IS NULL;

SELECT *  
FROM Student  
ORDER BY Course ASC;

SELECT COUNT(*)  
FROM Student  
WHERE Course = 'BCA';

SELECT COUNT(*)  
FROM Student;

SELECT *  
FROM Student  
WHERE Deptno IN (1, 2);

SELECT *  
FROM Student  
ORDER BY Course;

SELECT *  
FROM Student  
ORDER BY Student_name ASC;

