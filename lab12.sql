USE Demo

INSERT INTO DEPT ( DepartmentName, DepartmentCode, Loaction) VALUES
( 'Admin', 'Adm', 'A-Block'),
( 'Computer', 'CE', 'C-Block'),
( 'Civil', 'CI', 'G-Block'),
( 'Electrical', 'EE', 'E-Block'),
( 'Mechanical', 'ME', 'B-Block');


SELECT * FROM DEPT



INSERT INTO PERSON (PersonName, DepartmentID, Salary, JoiningDate, City) VALUES
('Rahul Tripathi', 2, 56000, '2000-01-01', 'Rajkot'),
('Hardik Pandya', 3, 18000, '2001-09-25', 'Ahmedabad'),
('Bhavin Kanani', 4, 25000, '2000-05-14', 'Baroda'),
('Bhoomi Vaishnav', 1, 39000, '2005-02-08', 'Rajkot'),
('Rohit Topiya', 2, 17000, '2001-07-23', 'Jamnagar'),
('Priya Menpara', NULL, 9000, '2000-10-18', 'Ahmedabad'),
('Neha Sharma', 2, 34000, '2002-12-25', 'Rajkot'),
('Nayan Goswami', 3, 25000, '2001-07-01', 'Rajkot'),
('Mehul Bhundiya', 4, 13500, '2005-01-09', 'Baroda'),
('Mohit Maru', 5, 14000, '2000-05-25', 'Jamnagar');


SELECT * FROM PERSON

-- Part – A:
-- 1. Combine information from Person and Department table using cross join or Cartesian product.
    SELECT *
    FROM PERSON 
    CROSS JOIN DEPT
--2. Find all persons with their department name
    SELECT 
    DEPT.DepartmentName,PERSON.PersonName
    FROM PERSON
    JOIN DEPT
    ON PERSON.DepartmentID = DEPT.DepartmentID;


-- 3. Find all persons with their department name & code.
    SELECT 
    DEPT.DepartmentName,PERSON.PersonName , DEPT.DepartmentCode
    FROM PERSON
    JOIN DEPT
    ON PERSON.DepartmentID = DEPT.DepartmentID;


-- 4. Find all persons with their department code and location.
    SELECT 
    DEPT.DepartmentCode ,PERSON.PersonName, DEPT.Loaction
    FROM PERSON
    JOIN DEPT
    ON PERSON.DepartmentID = DEPT.DepartmentID;

-- 5. Find the detail of the person who belongs to Mechanical department.
    SELECT
    DEPT.DepartmentCode ,PERSON.PersonName, DEPT.Loaction
    FROM PERSON
    JOIN DEPT
    ON PERSON.DepartmentID = DEPT.DepartmentID
    WHERE DepartmentName = 'Mechanical';

-- 6. Final person’s name, department code and salary who lives in Ahmedabad city.
    SELECT
    DEPT.DepartmentCode ,PERSON.PersonName, DEPT.Loaction
    FROM PERSON
    JOIN DEPT
    ON PERSON.DepartmentID = DEPT.DepartmentID
    WHERE City = 'Ahmedabad';
-- 7. Find the person's name whose department is in C-Block.
    SELECT
    DEPT.DepartmentCode ,PERSON.PersonName, DEPT.Loaction
    FROM PERSON
    JOIN DEPT
    ON PERSON.DepartmentID = DEPT.DepartmentID
    WHERE Loaction = 'C-Block';
-- 8. Retrieve person name, salary & department name who belongs to Jamnagar city.
    SELECT
    PERSON.PersonName, PERSON.salary , DEPT.DepartmentName
    FROM PERSON
    JOIN DEPT
    ON PERSON.DepartmentID = DEPT.DepartmentID
    WHERE City = 'Jamnagar';
-- 9. Retrieve person’s detail who joined the Civil department after 1-Aug-2001.
    SELECT *
    FROM PERSON
    JOIN DEPT
    ON PERSON.DepartmentID = DEPT.DepartmentID
    WHERE DepartmentName = 'Civil' AND PERSON.JoiningDate > '2001-08-01'
-- 10. Display all the person's name with the department whose joining date difference with the current date is more than 365 days
    SELECT 
    PERSON.PersonName, 
    DEPT.DepartmentName
    FROM 
    PERSON
    JOIN 
    DEPT ON PERSON.DepartmentID = DEPT.DepartmentID
    WHERE 
    DATEDIFF(DAY, PERSON.JoiningDate, GETDATE()) > 365;
-- 11. Find department wise person counts.
    SELECT 
    DEPT.DepartmentName,
    COUNT(PERSON.PersonID) AS PersonCount
    FROM 
    DEPT
    LEFT JOIN 
    PERSON ON DEPT.DepartmentID = PERSON.DepartmentID
    GROUP BY 
    DEPT.DepartmentName;
-- 12. Give department wise maximum & minimum salary with department name.
    SELECT 
    DEPT.DepartmentName,
    MAX(PERSON.Salary) AS MaxSalary,
    MIN(PERSON.Salary) AS MinSalary
    FROM 
    DEPT
    JOIN 
    PERSON ON DEPT.DepartmentID = PERSON.DepartmentID
    GROUP BY 
    DEPT.DepartmentName;
-- 13. Find city wise total, average, maximum and minimum salary.
    SELECT 
    PERSON.City,
    SUM(PERSON.Salary) AS TotalSalary,
    AVG(PERSON.Salary) AS AvgSalary,
    MAX(PERSON.Salary) AS MaxSalary,
    MIN(PERSON.Salary) AS MinSalary
    FROM 
    PERSON
    GROUP BY 
    PERSON.City;
-- 14. Find the average salary of a person who belongs to Ahmedabad city.
    SELECT 
    AVG(PERSON.Salary) AS AvgSalary_Ahmedabad
    FROM 
    PERSON
    WHERE 
    PERSON.City = 'Ahmedabad';
-- 15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In single column)
    SELECT 
    CONCAT(PERSON.PersonName, ' lives in ', PERSON.City, ' and works in ', DEPT.DepartmentName, ' Department.') 
    FROM 
    PERSON
    JOIN 
    DEPT ON PERSON.DepartmentID = DEPT.DepartmentID;

-- Part – B:
-- 1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In single column)
    SELECT 
    CONCAT(PERSON.PersonName, ' earns ', PERSON.Salary, ' from ', DEPT.DepartmentName, ' department monthly.') 
    FROM 
    PERSON
    JOIN 
    DEPT ON PERSON.DepartmentID = DEPT.DepartmentID;

-- 2. Find city & department wise total, average & maximum salaries.
    SELECT 
    PERSON.City,
    DEPT.DepartmentName,
    SUM(PERSON.Salary) AS TotalSalary,
    AVG(PERSON.Salary) AS AvgSalary,
    MAX(PERSON.Salary) AS MaxSalary
    FROM 
    PERSON
    JOIN 
    DEPT ON PERSON.DepartmentID = DEPT.DepartmentID
    GROUP BY 
    PERSON.City, DEPT.DepartmentName;

-- 3. Find all persons who do not belong to any department.
    SELECT *
    FROM 
    PERSON
    WHERE 
    DepartmentID IS NULL;
-- 4. Find all departments whose total salary is exceeding 100000.
    SELECT 
    DEPT.DepartmentName,
    SUM(PERSON.Salary) AS TotalSalary
    FROM 
    DEPT
    JOIN 
    PERSON ON DEPT.DepartmentID = PERSON.DepartmentID
    GROUP BY 
    DEPT.DepartmentName
    HAVING 
    SUM(PERSON.Salary) > 100000;

    

