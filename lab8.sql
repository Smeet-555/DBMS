CREATE TABLE SALES_DATA(
    REGION VARCHAR(25),
    PRODUCT VARCHAR(10),
    SALES_AMT INT,
    YEARS INT
);
--13. Find the Region Where 'Mobile' Had the Lowest Total Sales Across All Years.

INSERT INTO SALES_DATA(REGION , PRODUCT , SALES_AMT , YEARS) VALUES
    ('North America' , 'Watch' ,1500 , 2023),
    ('Europe' ,'Mobile',1200 , 2023 ),
    ('Asia' , 'Watch' , 1800 , 2023),
    ('North America' , 'TV' , 900 , 2024),
    ('Europe' ,  'Watch', 2000, 2024),
    ('Asia' , 'Mobile', 1000, 2024),
    ('North America' ,  'Mobile', 1600, 2023),
    ('Europe', 'TV', 1500, 2023),
    ('Asia', 'TV', 1100, 2024),
    ('North America', 'Watch', 1700, 2024);

SELECT * FROM SALES_DATA;

------------------------------------------PART-A------------------------------------------


--1. Display Total Sales Amount by Region.

SELECT SUM(SALES_AMT) AS TOTAL_AMT
FROM SALES_DATA
GROUP BY REGION;

--2. Display Average Sales Amount by Product

SELECT PRODUCT, AVG(SALES_AMT) AS TOTAL_AMT
FROM SALES_DATA
GROUP BY PRODUCT;

--3. Display Maximum Sales Amount by Year

SELECT YEARS, MAX(SALES_AMT) AS TOTAL_AMT
FROM SALES_DATA
GROUP BY YEARS;

--4. Display Minimum Sales Amount by Region and Year

SELECT REGION, YEARS, MIN(SALES_AMT) AS MIN_SALES_AMT
FROM SALES_DATA
GROUP BY REGION,YEARS;

--5. Count of Products Sold by Region

SELECT REGION, COUNT(PRODUCT) AS TOTAL_PRODUCT
FROM SALES_DATA
GROUP BY REGION;

--6. Display Sales Amount by Year and Product

SELECT YEARS, PRODUCT, SALES_AMT
FROM SALES_DATA
GROUP BY YEARS, PRODUCT, SALES_AMT;

--7. Display Regions with Total Sales Greater Than 5000

SELECT REGION, SUM(SALES_AMT) AS TOTAL
FROM SALES_DATA
GROUP BY REGION
HAVING SUM(SALES_AMT) > 5000;

--8. Display Products with Average Sales Less Than 10000

SELECT PRODUCT, AVG(SALES_AMT) AS TOTAL
FROM SALES_DATA
GROUP BY PRODUCT
HAVING AVG(SALES_AMT) > 10000;

--9. Display Years with Maximum Sales Exceeding 500

SELECT YEARS
FROM SALES_DATA
GROUP BY YEARS
HAVING MAX(SALES_AMT) > 500; 

--10. Display Regions with at Least 3 Distinct Products Sold.

SELECT REGION
FROM SALES_DATA
GROUP BY REGION
HAVING COUNT(DISTINCT PRODUCT) >= 3;

--11. Display Years with Minimum Sales Less Than 1000

SELECT YEARS
FROM SALES_DATA
GROUP BY YEARS
HAVING MIN(SALES_AMT) < 1000;

--12. Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount

SELECT REGION, SUM(SALES_AMT) AS TOTAL
FROM SALES_DATA
WHERE YEARS = 2023
GROUP BY REGION;

--13. Find the Region Where 'Mobile' Had the Lowest Total Sales Across All Years.

SELECT REGION
FROM SALES_DATA
WHERE PRODUCT = 'MOBILE'
GROUP BY REGION
HAVING MIN(SALES_AMT) = 
       (SELECT TOP 1 MIN(SALES_AMT)
        FROM SALES_DATA 
        WHERE PRODUCT = 'MOBILE'
        GROUP BY REGION);

--14. Find the Product with the Highest Sales Across All Regions in 2023.

SELECT PRODUCT
FROM SALES_DATA
WHERE YEARS = 2023
GROUP BY PRODUCT
HAVING MAX(SALES_AMT) = 
        (SELECT TOP 1 MAX(SALES_AMT)
        FROM SALES_DATA
        WHERE YEARS = 2023
        GROUP BY PRODUCT
        ORDER BY MAX(SALES_AMT) DESC);

--15. Find Regions Where 'TV' Sales in 2023 Were Greater Than 1000.

SELECT REGION
FROM SALES_DATA
WHERE PRODUCT = 'TV' AND YEARS = 2023
GROUP BY REGION
HAVING MIN(SALES_AMT) > 1000


------------------------------------------PART-B------------------------------------------

--1. Display Count of Orders by Year and Region, Sorted by Year and Region

SELECT YEARS, REGION, COUNT(*) AS ORDER_COUNT
FROM SALES_DATA
GROUP BY YEARS, REGION
ORDER BY YEARS, REGION;

--2. Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region

SELECT REGION, MAX(SALES_AMT) AS MAX_AMT
FROM SALES_DATA
GROUP BY REGION
HAVING MAX(SALES_AMT) > 1000
ORDER BY REGION;

--3. Display Years with Total Sales Amount Less Than 10000, Sorted by Year Descending

SELECT YEARS, SUM(SALES_AMT) AS TOTAL 
FROM SALES_DATA 
GROUP BY YEARS
HAVING SUM(SALES_AMT) < 10000
ORDER BY YEARS DESC;

--4. Display Top 3 Regions by Total Sales Amount in Year 2024

SELECT TOP 3 REGION, SUM(SALES_AMT) AS TOTAL_S_AMT
FROM SALES_DATA
WHERE YEARS = 2024
GROUP BY REGION;

--5. Find the Year with the Lowest Total Sales Across All Regions.

SELECT YEARS, MIN(SALES_AMT) AS LOWEST_TOTAL
FROM SALES_DATA
GROUP BY YEARS;


------------------------------------------PART-C------------------------------------------

--1. Display Products with Average Sales Amount Between 1000 and 2000, Ordered by Product Name

SELECT PRODUCT, AVG(SALES_AMT) AS AVG_AMT
FROM SALES_DATA 
GROUP BY PRODUCT
HAVING AVG(SALES_AMT) BETWEEN 1000 AND 2000
ORDER BY PRODUCT;

--2. Display Years with More Than 1 Orders from Each Region

SELECT YEARS, REGION, COUNT(REGION) AS ORDER_COUNT
FROM SALES_DATA
GROUP BY YEARS, REGION
HAVING COUNT(REGION) > 1;

--3. Display Regions with Average Sales Amount Above 1500 in Year 2023 sort by amount in descending.

SELECT REGION, AVG(SALES_AMT) AS AVG_AMT
FROM SALES_DATA
WHERE YEARS = 2023
GROUP BY REGION
HAVING AVG(SALES_AMT) > 1500
ORDER BY AVG_AMT DESC;

--4. Find out region wise duplicate product.

SELECT REGION, PRODUCT, COUNT(PRODUCT) AS COUNT_PRO 
FROM SALES_DATA 
GROUP BY REGION, PRODUCT
HAVING COUNT(PRODUCT) > 1;

--5. Find out year wise duplicate product

SELECT YEARS, PRODUCT, COUNT(PRODUCT) AS COUNT_PRO 
FROM SALES_DATA 
GROUP BY YEARS, PRODUCT
HAVING COUNT(PRODUCT) > 1;