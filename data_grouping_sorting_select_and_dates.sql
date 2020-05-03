-- GROUP BY clause
-- the GROUP BY clause groups the data together
-- the FROM and WHERE clause creates intermidiate tabular result set and GROUP BY clause systematically
-- groups the data
-- the GROUP BY clause can group the result set by on or more columns

USE school;

SELECT class, COUNT(*) FROM students GROUP BY class;

SELECT class, COUNT(*) FROM students WHERE class = 'First' GROUP BY class;

SELECT age, COUNT(*) FROM students GROUP BY age;

USE company;

SELECT employees.jobtitle, COUNT(*) FROM employees WHERE employees.jobtitle = 'Web Developer' GROUP BY employees.jobtitle;

SELECT employees.jobtitle, COUNT(*) FROM employees GROUP BY employees.jobtitle;

USE onlineshop;

SELECT items.categoryid, COUNT(*) AS totalitems FROM items GROUP BY items.categoryid;


-- HAVING clause
-- the HAVING clause was added to SQL as WHERE could not be used with aggregated data rows
-- the HAVING clause filters the group rows produced by the GROUP BY clause
-- WHERE clause filters the intermidiate data result rows, while HAVING clause operates on group rows
-- the HAVING clause uses conditions and operators to build complex SQL statements
-- since the HAVING clause acts as a filter on group rows, the only possible column 
-- in group rows are columns specified in the GROUP BY clause

USE school;

SELECT class, COUNT(*) FROM students GROUP BY class HAVING COUNT(*) < 20;

USE company;

SELECT jobtitle, salary, COUNT(*) FROM employees GROUP BY jobtitle, salary;

SELECT jobtitle, salary, COUNT(*) FROM employees GROUP BY jobtitle, salary HAVING salary > 3500;

-- ORDER BY clause
-- the ORDER BY clause is used to order or sort the data rows in a result set
-- the ORDER BY clause can be used to sort the data rows by one or more columns
-- by default the ORDER BY clause sorts the records in ascending order
-- ASC keyword for ascending and while DESC keyword for descending order

USE school;

SELECT * FROM students ORDER BY firstname, lastname;
SELECT * FROM students ORDER BY age DESC;

USE company;

SELECT * FROM employees ORDER BY salary ASC;


-- LIMIT or TOP clause
-- in tables with millions of data rows, it takes time to return all the records which causes database performace issues.
-- to fix this problem, use LIMIT or TOP clause to return only specified number of rows.
-- the LIMIT or TOP clause SQL statement varies for different database systems
-- SELECT TOP 5 FROM students; (MSSQL Server or MS Access)
-- SELECT * FROM students WHERE ROWNUM <= 5; (Oracle)
-- SELECT * FROM students LIMIT 5; (MYSQL)

USE school;

SELECT * FROM students LIMIT 5;

USE company;

SELECT * FROM employees LIMIT 10, 5; -- for pagination purposes


-- SQL wildcards
-- a wildcard character is used as a substitute for any other character string
-- the wildcards are used to search for data in a given column
-- the wildcard characters are used with LIKE operator
-- the percent (%) means zero or more characters and the underscore (_) means exactly one character after the match

USE school;

SELECT * FROM students WHERE firstname LIKE 'Jo%';

SELECT * FROM students WHERE firstname LIKE 'Jo_'; -- here will fetch Joe due to after Jo the name has just one character 

SELECT * FROM students WHERE firstname LIKE '%y';

SELECT * FROM students WHERE firstname LIKE '%o%';


-- SQL Aliases
-- Alias means a temporary name given to a table or a column 
-- Aliases makes table or column names more readable
-- Aliases are useful using multiple columns or tables in a single query. Or table names or column names are big or not readable
-- the AS keyword is used to define the alias in SQL statement

SELECT s.firstname, s.lastname FROM students AS s;

SELECT COUNT(*) AS number_of_students FROM students;

SELECT CONCAT(s.firstname, ' ',s.lastname) AS 'Full name' FROM students AS s;

-- SQL Dates
-- Choosing appropiate format to store the dates is the most important in SQL
-- SQL can store  date and time in the database table
-- SQL have built in date functions for workiing with dates
-- NOW(), CURDATE(), & CURTIME(), which returns current date and time, current date and current time respectively

SELECT NOW();

SELECT CURDATE();

SELECT CURTIME();

USE onlineshop;

SELECT * FROM orders WHERE orderdate = '2020-04-28 14:13:39'; 