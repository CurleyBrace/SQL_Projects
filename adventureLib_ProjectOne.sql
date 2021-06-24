
/*Distinct Operator*/
SELECT DISTINCT AddressLine1, AddressLine2
FROM Person.Address

/*Top Operator*/
SELECT TOP 5 SickLeaveHours
FROM HumanResources.Employee

/*Min and Max Operators*/
SELECT MIN(Rate)
FROM HumanResources.EmployeePayHistory
SELECT MAX(Rate)
FROM HumanResources.EmployeePayHistory

/*Like Operator*/
SELECT JobTitle
FROM HumanResources.Employee
WHERE JobTitle LIKE '%Eng%'

/*WildCard Operator*/
SELECT JobTitle
FROM HumanResources.Employee
WHERE JobTitle LIKE '%off%'

/*Between Operator*/
SELECT SickLeaveHours
FROM HumanResources.Employee
WHERE SickLeaveHours BETWEEN 0 AND 25;



CREATE DATABASE db_school	--Creating Database

CREATE TABLE classes (		--Creating Classes Table
	class_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	class_name VARCHAR(50) NOT NULL
);

CREATE TABLE instructor (	--Creating Instructor Table
	instructor_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	instructor_name VARCHAR(50) NOT NULL
);

CREATE TABLE students (		--Creating Students Table
	student_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	student_name VARCHAR(50) NOT NULL,
	instructor_id INT NOT NULL FOREIGN KEY REFERENCES instructor(instructor_id), --Foreign Key for Instructors
	class_id INT NOT NULL FOREIGN KEY REFERENCES classes(class_id)				--Foreign Key for Classes
);

INSERT INTO classes(class_name)	--Inserting Values into Classes
VALUES
('Software Developer Boot Camp'),
('C# Boot Camp')
;

INSERT INTO students(student_name, class_id) --Inserting Values into Students
VALUES
('Michael Johnson', 1),
('Robert Brown', 2),
('Mike Thomas', 1),
('Amy Bach', 1),
('Lindsey Winters', 2),
('Michelle Leons', 2)
;

INSERT INTO instructor(instructor_name) --Inserting Values into Instructor
VALUES
('Dwayne Roberston'),
('Mikaela Williams')
;

UPDATE students					--Updating Students in Class 2 for Instructor 1
SET instructor_id = 1
WHERE class_id = 2

UPDATE students					--Updating Students in Class 1 for Instructor 2
SET instructor_id = 2
WHERE class_id = 1

SELECT instructor_name FROM instructor; --Displaying Instructor Names

SELECT student_name						--Displaying Student names in Alphabetical Order
FROM students
ORDER BY student_name ASC;

SELECT students.student_name, classes.class_name, instructor.instructor_name --Displaying Student, Class, and Instructor's Names
FROM students
INNER JOIN classes ON students.class_id = classes.class_id
INNER JOIN instructor ON students.instructor_id = instructor.instructor_id;
