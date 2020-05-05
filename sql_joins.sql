-- SQL JOINS
-- A join combines 2  or more tables to produce a single tabular structure.
-- the rows from 2 or more tables are combined together to return intermidiate result set
-- in SQL the joins are created using the JOIN clause
-- there are mainly 3 types of joins, INNER JOIN, OUTER JOIN and CROSS JOIN
-- INNER JOIN: Created with INNER JOIN clause keyword. it returns all data rows when there is at least one match in both tables
-- OUTER JOIN:  Created with OUTER JOIN clause keyword. it can return matched as well as unmatched data rows. The OUTER JOIN have 3 types:
-- Left outer join, right outer joing and full other join

CREATE DATABASE joins;

USE joins;

CREATE TABLE table1 (column1 INT);
CREATE TABLE table2 (column2 INT);

INSERT INTO table1 VALUES (11), (12), (13), (14), (15);
INSERT INTO table2 VALUES (12), (15), (50);

-- INNER JOIN
-- an INNER JOIN is the most common type of join
-- INNER JOIN returns the row in result set where the column value in a row of table1 is equal to the column value in a row of table 2
-- in INNER JOIN the ON clause defines the columns and condition to be evaluated

SELECT * FROM table1 INNER JOIN table2 ON table1.column1 = table2.column2; 

USE company;

SELECT name, jobtitle, title FROM employees INNER JOIN projects ON employees.employeeid = projects.projectid;

USE onlineshop;

SELECT customers.userid AS userid, name, phone, items, total FROM customers INNER JOIN orders ON customers.userid = orders.userid;

SELECT c.userid, c.name, c.phone, o.items, o.total FROM customers AS c INNER JOIN orders AS o ON c.userid = o.userid;

-- LEFT OUTER JOIN
-- the OUTER JOIN is created by using OUTER JOIN keyword
-- the OUTER JOIN returns matched data rows as well as unmatched data rows
-- in LEFT OUTER JOIN all the data rows from left table are returned
-- the table mentioned to the left of the OUTER JOIN keyword is the left table and the table mentioned to the right of the OUTER JOIN keyword is right table

USE joins;

SELECT * FROM table1 LEFT OUTER JOIN table2 ON table1.column1 = table2.column2;

USE company;

SELECT name, jobtitle, title FROM employees LEFT OUTER JOIN projects ON employees.employeeid = projects.projectid;

USE onlineshop;

SELECT c.userid, c.name, c.phone, o.items, o.total FROM customers AS c LEFT OUTER JOIN orders AS o ON c.userid = o.userid;


-- RIGHT OUTER JOIN
-- the OUTER JOIN is created by using OUTER JOIN keyword
-- the OUTER JOIN returns matched data rows as well as unmatched data rows
-- in RIGHT OUTER JOIN all the data rows from right table are returned
-- the table mentioned to the left of the OUTER JOIN keyword is the left table and the table mentioned to the right of the OUTER JOIN keyword is right table

USE joins;

SELECT * FROM table1 RIGHT OUTER JOIN table2 ON table1.column1 = table2.column2;

USE company;

SELECT name, jobtitle, title FROM employees RIGHT OUTER JOIN projects ON employees.employeeid = projects.projectid;

USE onlineshop;

SELECT c.userid, c.name, c.phone, o.items, o.total FROM customers AS c RIGHT OUTER JOIN orders AS o ON c.userid = o.userid;


-- FULL OUTER JOIN
-- the OUTER JOIN is created by using OUTER JOIN keyword
-- the OUTER JOIN returns matched data rows as well as unmatched data rows
-- in FULL OUTER JOIN all the data rows from left and right table are returned
-- MYSQL doesn't support FULL OUTER JOIN, we will emulate the FULL OUTER JOIN using UNION operator

USE joins;

--SELECT * FROM table1 FULL OUTER JOIN table2 ON table1.column1 = table2.column2; this is the sintax of full outer join but is not supported by mysql

--emulating the full outer join using left and right inner joins plus union operator
SELECT * FROM table1 LEFT OUTER JOIN table2 ON table1.column1 = table2.column2 
UNION
SELECT * FROM table1 RIGHT OUTER JOIN table2 ON table1.column1 = table2.column2;


-- CROSS JOIN
-- the CROSS JOIN is created by using OUTER JOIN keyword
-- the CROSS JOIN does not contain ON clause
-- the CROSS JOIN returns matched data rows as well as unmatched data rows from the table
-- in CROSS JOIN all rows from all tables are returned, joined to every row of the other table regardless of whether they match

USE joins;

SELECT * FROM table1 CROSS JOIN table2; -- cross join is similar to a cartesian product

USE company;

SELECT * FROM employees CROSS JOIN projects;

SELECT employees.name, employees.jobtitle, projects.title FROM employees CROSS JOIN projects;


-- UNION operator
-- every SELECT statement must have similar number of columns
-- the columns in SELECT statement must be in the same order and have similar data types
-- the UNION operator selects only distinct values. The UNION ALL operator is used to select duplicate values

USE joins;

SELECT * FROM table1 UNION SELECT * FROM table2;

USE school;

SELECT students.firstname FROM students UNION SELECT teachers.name FROM teachers;


-- SQL views
-- ViEW is a database object that can be created like a table
-- a ViEW is similar to a virtual table. Unlike tables don't store data.
-- ViEWS are complex SQL statements used as a virtual tables for ease of reference and reuse
-- the ViEWS are useful for storing complex SQL statement as a virtual tables and request the ViEW as a single table instead of complex query
-- we can restrict users from accessing underlying tables and instead give access to views with limited columns
-- since, every time user request view, database engine recreate result set, which always returns up to date data rows from views 
/**
  Sintax
  CREATE VIEW viewname AS SELECT * FROM tablename WHERE condition
  To Delete
  DROP VIEW viewname
**/

USE company;

CREATE VIEW active_projects AS 
SELECT employees.name, employees.jobtitle, projects.title 
FROM employees 
INNER JOIN projects ON employees.employeeid = projects.employeeid;

SELECT * FROM active_projects;

USE onlineshop;

CREATE VIEW purchase_history AS 
SELECT c.userid, c.name, c.phone, o.items, o.total 
FROM customers AS c 
LEFT OUTER JOIN orders AS o ON c.userid = o.userid;

SELECT * FROM purchase_history;

CREATE OR REPLACE  VIEW purchase_history AS 
SELECT c.userid, c.name, c.phone, o.items, o.total 
FROM customers AS c 
RIGHT OUTER JOIN orders AS o ON c.userid = o.userid;

DROP VIEW purchase_history;


-- DERIVED TABLES OR INLINE VIEWS
-- a DERIVED TABLE is a sub query in parentheses from which we can select the data columns in the main query
-- the sub query in parentheses forms a tabular structure which is a source of data for outer main query
-- every DERIVED TABLE must have a name or alias using AS keyword
-- unlike views in DERIVED TABLES the intermidiate tables are created directly inline with the SQL statement

USE company;

SELECT name, title FROM (SELECT employees.name, employees.jobtitle, projects.title 
FROM employees 
INNER JOIN projects ON employees.employeeid = projects.employeeid) AS active_projects;

USE onlineshop;

SELECT name, items, total 
FROM (SELECT c.userid, c.name, c.phone, o.items, o.total 
FROM customers AS c 
LEFT OUTER JOIN orders AS o ON c.userid = o.userid) AS purchased_history;