-- SQL functions adn type

-- there are many pre-defined functions in SQL to perform various actions on data rows
-- some functions work only on numeric values while some functions works on a numeric as well as string
-- there are mainly 2 types of fucntions in SQL. aggregate functions and scalar functions
-- aggregate functions only works on a group of rows to return single aggregate result value
-- examples: COUNT(), MIN(), MAX(), SUM, AVG()
-- scalar functions works on single input value to return single result value
-- examples: LEN(), ROUND, SUBSTRING(), CASE(), NOW()

-- SQL COUNT FUNCTION
-- the count function is used to count the data rows returned in the result
-- the count function counts distinct or all values in data rows returned in a result set
-- the count function does not count NULL values

USE school;

SELECT COUNT(*) FROM students; 

SELECT COUNT(*) AS 'Total Rows' FROM students;

SELECT COUNT(DISTINCT class) FROM students; --will count just the how many different groups are in the students table

USE company;

SELECT COUNT(p.title)
FROM employees AS e 
LEFT OUTER JOIN projects AS p ON e.employeeid = p.employeeid; -- will count the titles that are different from null


-- SQL FIRST FUNCTION
-- the FIRST function returns the first value of the given column
-- the FIRST function is only supported in microsoft access or MS access
-- examples: SELECT FIRST(columnname) FROM tablename; (in MS Access)
-- SELECT columnname FROM tablename LIMIT 1; (MYSQL equivalent)

USE school;

SELECT firstname FROM students LIMIT 1;

SELECT lastname FROM students LIMIT 1;


-- SQL LAST FUNCTION
-- the LAST function returns the last value of the given column
-- the LAST function is only supported in microsoft access or MS access
-- examples: SELECT LAST(columnname) FROM tablename; (in MS Access)
-- SELECT columnname FROM tablename ORDER BY columnname DESC LIMIT 1; (MYSQL equivalent)

USE school;

SELECT firstname FROM students ORDER BY firstname DESC LIMIT 1;

SELECT lastname  FROM students ORDER BY lastname DESC LIMIT 1;


-- SQL SUM FUNCTION
-- the SUM function returns the total sum of a given numeric column
-- the SUM function will only work on numeric columns. For columns containing string values it will always return 0

USE school;

SELECT SUM(age) AS total FROM students;

SELECT SUM(firstname) AS total FROM students; -- will return 0 due to the colomn type is not numeric


USE onlineshop;

SELECT SUM(total) AS total FROM orders;


-- SQL MIN FUNCTION
-- the MIN function returns the samllest value of the given column
-- the MIN function works on muereic columns as well as string columns


USE school;

SELECT MIN(age) FROM students;

SELECT MIN(firstname) FROM students;

SELECT MIN(lastname) FROM students;

USE company;

SELECT MIN(salary) AS minimum_salary FROM employees;


-- SQL MAX FUNCTION
-- the MAX function returns the largest value of the given column
-- the MAX function works on muereic columns as well as string columns

USE school;

SELECT MAX(age) FROM students;

SELECT MAX(firstname) FROM students;

SELECT MAX(lastname) FROM students;

USE company;

SELECT MAX(salary) AS minimum_salary FROM employees;


-- SQL AVG FUNCTION
-- the AVG function returns the average value of the given column
-- the AVG function will only work on numeric columns. For columns containing string values it will always return 0

USE school;

SELECT AVG(age) FROM students;

SELECT AVG(firstname) FROM students;  -- will return 0 due to the colomn type is not numeric

USE onlineshop;

SELECT AVG(total) AS avrage_earning FROM orders;


-- SQL UCASE FUNCTION
-- the UCASE function converts string data row values to UPPERCASE
-- the UCASE funcion only work on string columns

USE school;

SELECT UCASE(firstname) FROM students; 


-- SQL LCASE FUNCTION
-- the LCASE function converts string data row values to LOWERCASE
-- the LCASE funcion only work on string columns

USE school;

SELECT LCASE(firstname) FROM students;


-- SQL MID FUNCTION
-- the MID function extracts characters from the given string data
-- the MID function only works on string columns
/**
 examples:
 SELECT MID(cloumnname,start,length) FROM tablename
 start: starting position
 length: is optional and returns the number of characters to specified. if is not defined returns all the charactrers until the end of the string
**/

USE school;

SELECT firstname, MID(firstname,1,3) FROM students;
SELECT firstname, MID(firstname,2) FROM students; -- will returns all the charactrers until the end of the string



-- SQL LEN FUNCTION
-- the LEN function retunrs the length of the given string value
-- the LEN function only works on string columns
/**
 examples:
 SELECT LEN(columnname) FROM tablename; (MS ACCESS)
 SELECT LENGTH(columnname) FROM tablename; (MYSQL)
**/
USE school;

SELECT firstname, LENGTH(firstname) AS 'String Length' FROM students;



-- SQL ROUND FUNCTION
-- the ROUND function is used to round a floating point number to the given decimal numbers 
-- the ROUND function only works on numeric columns
/**
 examples:
 SELECT ROUND(columnname, decimals) FROM tablename;
 decimals: number of decimals to be returned
**/

SELECT 10.456789, ROUND(10.456789, 2)


-- SQL FORMAT FUNCTION
-- the FORMAT function is used to round a floating point number to the given decimal numbers 
-- the FORMAT function only works on numeric columns
/**
 examples:
 SELECT FORMAT(columnname, decimals) FROM tablename;
 decimals: number of decimals to be returned
**/

SELECT 10.456789, FORMAT(10.456789, 2)