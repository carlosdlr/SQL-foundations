SELECT * FROM students WHERE studentid = 6;

SELECT * FROM students WHERE firstname = 'John';

SELECT * FROM employees WHERE jobtitle = 'Application Developer';


--- SQL false conditions
SELECT * FROM students WHERE NOT age = 6;

SELECT * FROM students WHERE age <> 6;

-- AND conditinal validates that all the conditions are true and NOT negation operator
SELECT * FROM students WHERE (class = 'First' AND age = 5);

SELECT * FROM students WHERE (class = 'First' AND NOT age = 5);

USE onlineshop;

SELECT * FROM items WHERE (categoryid = 1 AND price = 250);

-- OR operator allow to add multiple conditions
-- displays data if any of the multiple conditions is TRUE
-- can be written as a word OR or || (2 piplines)

USE school;

SELECT * FROM students WHERE (age = 5 OR age = 7);
SELECT * FROM students WHERE age = 5 || age = 7; 

USE company;

SELECT * FROM employees WHERE jobtitle = 'Web Developer' || jobtitle = 'Application Developer';

USE onlineshop;

SELECT * FROM items WHERE (categoryid = 1 OR price = 250);


-- IN operator evaluates multiple values on a single column
-- displays data if any of the given values passed in the list matched
-- wrttien as IN followed by multiple values separeted by comma inside brackets

USE school;

SELECT * FROM students WHERE age IN(5,6);

USE company;

SELECT * FROM employees WHERE salary IN (3200, 3500);

USE onlineshop;

SELECT * FROM items WHERE price IN (19, 25, 30, 99);

-- EXISTS condition is very similiar to "IN" conddition
-- the "IN" have constant values to evaluate while EXITS we use a subquery
-- if the subquery returns TRUE the main query is evaluated and vice versa 

USE company;

SELECT * FROM employees;
SELECT * FROM projects;

SELECT * FROM employees WHERE EXISTS (SELECT * FROM projects WHERE projects.employeeid = employees.employeeid);

SELECT * FROM employees WHERE 
EXISTS (SELECT * FROM projects WHERE projects.employeeid = employees.employeeid AND projects.projectid = 3);

USE onlineshop;

SELECT * FROM customers;
SELECT * FROM orders;

SELECT * FROM customers WHERE EXISTS (SELECT * FROM orders WHERE orders.userid = customers.userid);

SELECT * FROM customers WHERE 
EXISTS (SELECT * FROM orders WHERE orders.userid = customers.userid AND orders.orderid = 7);


-- NOT IN / NOT EXISTS 
-- the NOT keyword can be combined with "IN" and "EXISTS" condition to revert the condition
-- by using preceding "NOT" in "IN" or "EXISTS" condition,
-- the condition is reverted and the SQL statement will validate and include data rows for the FALSE condition

USE company;

SELECT * FROM employees WHERE employees.salary NOT IN (3200, 3400, 3500, 3700);

SELECT * FROM employees WHERE 
NOT EXISTS (SELECT * FROM projects WHERE projects.employeeid = employees.employeeid);

USE onlineshop;

SELECT * FROM customers WHERE NOT EXISTS (SELECT * FROM orders WHERE orders.userid = customers.userid);

-- comparison operators 
-- the comparison operators compares 2 values and determines whether the 2 values are equal or a value is greater or less than the other
-- the comparison operators can be applied to numbers strings and dates
/*
		=				Equal to
		<> Or !=		Not equal to
		<				Less than
		>				Greater than
		<=				Less than or equal to
		>=				Greater than or equals to
*/

USE school;

SELECT * FROM students WHERE age < 6;

USE company;

SELECT * FROM employees WHERE salary > 3500;

USE onlineshop;

SELECT * FROM items WHERE price <= 30;


-- LIKE operator
-- the LIKE operator is used with WHERE to search for a specific pattern in a string
-- the string pattern contains wildcard characters which represents missing characters
-- the LIKE operator is written as a word "LIKE" followed by a pattern to match with column value
-- the "%" is a wildcard character
-- LIKE is case sensitive

USE school;

SELECT * FROM students WHERE students.firstname LIKE 'Jo%'	-- if the "%" character is used at the end means that
																				-- the filter will be for the strings in the firstname column 
																				-- starting with 'Jo' in this case

USE company;

SELECT * FROM employees WHERE employees.name LIKE '%s'	-- if the "%" character is used at the beginning means that
																			-- the filter will be for the strings in the name column 
																			-- finishing with 's' in this case
 
USE onlineshop;
 
SELECT * FROM customers WHERE customers.name LIKE '%u%';	-- if the string to search is between "% %" means that
																			-- the filter will be for the strings in the name column 
																			-- containing the value 'u' in this case
																			
SELECT * FROM customers WHERE customers.name NOT LIKE '%u%';	-- if the string to search is between "% %" preceded for the NOT operator means that
																					-- the filter will be for the strings in the name column 
																					-- not containing the value 'u' in this case
																					
																					
-- BETWEEN operator
-- the BETWEEN operator is used to compare the value in a column
-- the BETWEEN operator tests a range of values with a column value
-- the BETWEEN operator is written as a word "BETWEEN" followed by a range of values

USE school;

SELECT * FROM students WHERE students.age BETWEEN 6 AND 10; -- get the students with a age between 6 and 10 inclusive that means the students with age 6 and 10 
																				-- will be included in the result also if are data with that values
																				
USE company;

SELECT * FROM employees WHERE employees.salary BETWEEN 3000 AND 3500;

USE onlineshop;

SELECT * FROM items WHERE items.price BETWEEN 100 AND 1000;