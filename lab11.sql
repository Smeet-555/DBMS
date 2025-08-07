USE Demo;

CREATE TABLE STU_INFO(
	
	RNO int PRIMARY KEY,
	Name varchar(50),
	BRANCH VARCHAR(50)
);



INSERT INTO STU_INFO VALUES
(101,'raju','CE'),
(102,'Amit','CE'),
(103,'Sanjay','ME'),
(104,'Neha','EC'),
(105,'Meera','EE'),
(106,'Mahesh','ME');


CREATE TABLE RESULT(
	
	RNO INT FOREIGN KEY REFERENCES STU_INFO(RNO),
	SPI DECIMAL(3,1)
);

INSERT INTO RESULT VALUES
(101,8.8),
(102,9.2),
(103,7.6),
(104,8.2),
(105,7.0),
(106,8.9);

CREATE TABLE EMPLOYEE_MASTER(
	
	EmployeeNo VARCHAR(50),
	Name VARCHAR(50),
	ManagerNo VARCHAR(50)
);

INSERT INTO EMPLOYEE_MASTER VALUES
('E01','Tarun',NULL),
('E02','Rohan','E02'),
('E03','Priya','E01'),
('E04','Milan','E03'),
('E05','Jay','E01'),
('E06','Anjana','E04');

--Part � A:

--1. Combine information from student and result table using cross join or Cartesian product.
	SELECT *
	FROM STU_INFO CROSS JOIN RESULT

--2. Perform inner join on Student and Result tables.
	SELECT *
	FROM STU_INFO S
	JOIN RESULT R
	ON S.RNO=R.RNO

--3. Perform the left outer join on Student and Result tables.
	SELECT *
	FROM STU_INFO S
	LEFT JOIN RESULT R
	ON S.RNO=R.RNO

--4. Perform the right outer join on Student and Result tables.
	SELECT *
	FROM STU_INFO S
	RIGHT JOIN RESULT R
	ON S.RNO=R.RNO

--5. Perform the full outer join on Student and Result tables.

	SELECT *
	FROM STU_INFO S
	FULL OUTER JOIN RESULT R
	ON S.RNO=R.RNO

--6. Display Rno, Name, Branch and SPI of all students.
	SELECT S.RNO,S.Name,S.BRANCH,R.SPI
	FROM STU_INFO S
	 JOIN RESULT R
	 ON S.RNO=R.RNO

--7. Display Rno, Name, Branch and SPI of CE branch�s student only.
	SELECT S.RNO,S.Name,S.BRANCH,R.SPI
	FROM STU_INFO S
	 JOIN RESULT R
	 ON S.RNO=R.RNO
	 WHERE S.BRANCH='CE'

--8. Display Rno, Name, Branch and SPI of other than EC branch�s student only.
	SELECT S.RNO,S.Name,S.BRANCH,R.SPI
	FROM STU_INFO S
	 JOIN RESULT R
	 ON S.RNO=R.RNO
	 WHERE NOT S.BRANCH='EC'

--9. Display average result of each branch.
	SELECT AVG(SPI) AS SPI
	FROM STU_INFO S
	 JOIN RESULT R
	 ON S.RNO=R.RNO
	 GROUP BY S.BRANCH

--10. Display average result of CE and ME branch.
	SELECT AVG(SPI) AS SPI,S.BRANCH
	FROM STU_INFO S
	 JOIN RESULT R
	 ON S.RNO=R.RNO
	 WHERE S.BRANCH='CE' OR  S.BRANCH = 'ME'
	 GROUP BY S.BRANCH

--11. Display Maximum and Minimum SPI of each branch.
	SELECT MIN(SPI) AS MINSPI,MAX(SPI) AS MAXSPI
	FROM STU_INFO S
	 JOIN RESULT R
	 ON S.RNO=R.RNO
	 GROUP BY S.BRANCH

--12. Display branch wise student�s count in descending order.
	SELECT COUNT(S.NAME),S.BRANCH
	FROM STU_INFO S
	 JOIN RESULT R
	 ON S.RNO=R.RNO
	 GROUP BY S.BRANCH
	 ORDER BY COUNT(S.Name) DESC

--Part � B:
--1. Display average result of each branch and sort them in ascending order by SPI.
	SELECT AVG(SPI) AS SPI,S.BRANCH
	FROM STU_INFO S
	 JOIN RESULT R
	 ON S.RNO=R.RNO
	 GROUP BY S.BRANCH
	 ORDER BY AVG(SPI) ASC
--2. Display highest SPI from each branch and sort them in descending order.
	SELECT MAX(SPI) AS SPI,S.BRANCH
	FROM STU_INFO S
	 JOIN RESULT R
	 ON S.RNO=R.RNO
	 GROUP BY S.BRANCH
	 ORDER BY MAX(SPI) DESC

--Part � C:
--1. Retrieve the names of employee along with their manager�s name from the Employee table.
SELECT E.NAME AS EMP,M.NAME AS MANAGER
FROM EMPLOYEE_MASTER E
JOIN EMPLOYEE_MASTER M

ON E.ManagerNo=M.EmployeeNo
