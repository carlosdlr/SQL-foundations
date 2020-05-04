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