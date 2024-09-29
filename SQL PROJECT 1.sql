--DATABASE SHOPXYZ_B

Create database Shopxyz_db;
use Shopxyz_db;

--SALES_DATA TABLE
Create table Sales_data(sales_id INT PRIMARY KEY,rep_id INT, region VARCHAR(50),Sales DECIMAL(10,2));
Insert into  Sales_data(sales_id,rep_id, region,Sales) VALUES (1, 101, 'East', 1000.00),
(2, 102, 'East', 1500.50),(3, 103, 'West', 2000.00),(4, 104, 'West', 2500.75),(5, NULL, 'West', 3000.00);

--REPRESENTATIVES TABLE

CREATE TABLE REPRESENTATIVES(rep_id INT PRIMARY KEY,sales_rep VARCHAR(100), Region VARCHAR(50));
INSERT INTO REPRESENTATIVES(rep_id,sales_rep,Region) VALUES(101, 'John Doe', 'East'),(102, 'Jane Smith', 'East'),
(105, 'Jim Beam', 'North'),(106, 'Jill Jackson', 'North'),(107, 'Jack Johnson', 'South');

SELECT * FROM Sales_data;
SELECT * FROM REPRESENTATIVES;

--TASK 1
Write a query to fetch sales data along with the names of the representatives where there is a match in both tables.

SELECT s.sales, r.sales_rep FROM sales_data s
inner join representatives r
on s.rep_id = r.rep_id


--LEFT JOIN
Write a query to fetch all sales data (including unmatched rows) 
along with the names of the representatives in the West region.

SELECT s.sales, r.sales_rep FROM sales_data s
left join representatives r
on s.rep_id = r.rep_id
WHERE s.region = 'west';

--RIGHT JOIN
Write a query to fetch all representatives and their sales data in the North region, even if they do not have any sales.
SELECT s.sales, r.sales_rep FROM sales_data s
right join representatives r
on s.rep_id = r.rep_id
WHERE r.Region = 'North';

--FULL JOIN
SELECT s.sales, r.sales_rep FROM sales_data s
full outer join representatives r
on s.rep_id = r.rep_id

--TOTAL SALES
SELECT SUM(Sales) AS total_sales FROM Sales_data;

--COUNT
SELECT count(*) AS total_sales_records FROM Sales_data;

--AVERAGE SALES
SELECT AVG(sales) AS average_sales FROM Sales_data;

--MAXIMUM SALES VALUES
SELECT MAX(sales) AS Max_sales FROM Sales_data;

--STRING FUNCTIONS
--CONCATENATE SALES_REP AND REGION 
SELECT CONCAT(sales_rep,' ', region) AS full_name FROM REPRESENTATIVES;

--FIND THE LENGTH OF THE SALES_REP NAME
SELECT sales_rep, LEN(sales_rep) AS name_length FROM REPRESENTATIVES;

--LOWERCASE
SELECT LOWER(sales_rep) AS LOWERCASE FROM REPRESENTATIVES;

--TRIM
SELECT TRIM(Region) AS TRIMMED_REGION FROM REPRESENTATIVES;

CREATE TABLE sales ( sale_id INT PRIMARY KEY, rep_id INT, sale_date DATE, amount DECIMAL(10, 2) );
INSERT INTO sales (sale_id, rep_id, sale_date, amount) 
VALUES (1, 101, '2024-09-15', 1000.00), 
(2, 102, '2024-09-16', 1500.50), 
(3, 103, '2024-09-17', 2000.00);
SELECT * FROM sales;

--GET CURRENT DATE
SELECT GETDATE();

--ADD 7 DAYS TO THE SALES DATE
SELECT sales.*, DATEADD(DAY, 7, sale_date) AS new_date FROM sales;
ALTER TABLE Sales DROP COLUMN new_date;

--DATE FORMAT
SELECT CONVERT(VARCHAR, sale_date, 23) AS formatted_date FROM sales;

--TRIM FUNCTIONS
SELECT LTRIM(RTRIM(sales_rep)) AS trimmed_sales_rep FROM REPRESENTATIVES;

--REPLACE FUNCTIONS
SELECT REPRESENTATIVES.*, REPLACE (sales_rep,'Doe', 'Johnson') AS replaced_sales_rep FROM REPRESENTATIVES;

--DATA SORTING AND FILTERING
SELECT * FROM sales_data ORDER BY sales DESC;

SELECT * FROM Sales_data WHERE sales > 1500;