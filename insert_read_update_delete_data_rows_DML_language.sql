-- INSERT INTO statement
-- the INSERT INTO statement is used to insert or add new data rows in a table
-- INSERT INTO tablename VALUES (value1, value2, value3);
-- column names are not specified, values for each column must be specified sequentially by columns
-- INSERT INTO tablename (column1, column2, column3) VALUES (value1, value2, value3);
-- the columns names are given in first bracket and the values are given in second bracket. Can insert values to only selected column names
-- the string values must be wrapped in single quotes, wrapping numeric values in quotes is optinal or not required

USE school;

INSERT INTO teachers (NAME, phone) VALUES ('John Doe', 1234567890); -- if the id value of the table is auto increment you need to specify the columns OR USE NULLfor the id

INSERT INTO teachers VALUES (NULL, 'Peter Brown', 1089234656);

INSERT INTO students (firstname, lastname, class, age) VALUES ('John', 'Doe', 'First', 5);

SELECT * FROM teachers;

-- INSERT INTO SELECT statement
-- in SQL we can copy the data rows from one table to another table
-- copy from source table and paste to target table both actions are executed in a single SQL statement
-- the source table must have similar table definition means (number of columns and data types must be the same)
-- any existing data row or records in target table remain unaffected.

CREATE TABLE studentscopy (
studentid INT PRIMARY KEY AUTO_INCREMENT,
firstname VARCHAR(40) NOT NULL,
lastname VARCHAR(40) NOT NULL,
class VARCHAR(20),
age INT
);

INSERT INTO studentscopy SELECT * FROM students;

SELECT * FROM studentscopy;

DELETE FROM studentscopy;

INSERT INTO studentscopy (firstname, lastname) SELECT firstname, lastname FROM students;

SELECT * FROM studentscopy;

-- UPDATE statement
-- UPDATE statement is used to update the data rows in a table
-- the UPDATE statement can update one or multiple column values in a single SQL statement
-- WHERE clause is used to specify the data row to be updated
-- any existing data rows or records in target table remain unaffected

UPDATE students SET class = 'Second' WHERE studentid = 1; 

UPDATE students SET class = 'Second' WHERE firstname = 'John' AND lastname = 'Doe'; 

UPDATE studentscopy SET class = 'Second'; 

USE company;

UPDATE employees SET jobtitle = 'Application Developer', salary = 3800 WHERE employeeid = 6;


-- DELETE statement
-- the DELETE statement is used to delete the data rows in a table
-- the DELETE statement can delete one or multiple data rows in a table
-- WHERE clause is used to specify the data row to be deleted. if not condition is declared the DELETE statement will delete all the rows in the table

USE school;

DELETE FROM studentscopy WHERE studentid = 60; 

DELETE FROM studentscopy; -- delte all the rows in the studentscopy table

-- SQL injection
-- SQL injection is a method where a malicious user can inject some SQL commands to display sensitive information or destroy the databsse
-- SQL statements are used to manage the database from a web page or application. Users interact with the database usinf form fields. 
-- SQL statements are text keywords and can be changed dynamically.
-- by using SQL injection, a hacker may get access to other sensitive information like user's passwords.
-- Mainly 3 types SQL injections
-- 1) SQL injection using 1=1
-- 2) SQL injection using ""=""
-- 3) SQL injection using batch statements

-- SQL injection using 1=1
/**
  form field Userid: "15 or 1=1"
  
  PHP code: 
  $id = $_POST["id"]
  $query = "SELECT * FROM users WHERE userid =" .$id;
  
  final statement:
  SELECT * FROM users WHERE userid = 15 or 1=1; the condition 1=1 will be always true allowing to the attacker get the user's information
**/

-- SQL injection using ""=""
/**
  form fields: 
  Username: " or ""="
  Passwird: " or ""="
  
  PHP code: 
  $user = $_POST["user"];
  $pass = $_POST["pass"];
  $query = "SELECT * FROM users WHERE username = '".$user."' AND pass ='".$pass."';
  
  final statement:
  SELECT * FROM users WHERE username ="" or "=" AND pass ="" or "="; will be always true allowing to the attacker get the user's information
**/

-- SQL injection using batched statements
/**
  form fields: 
  Userid: 15; DROP TABLE students;
  
  PHP code: 
  $id = $_POST["id"]
  $query = "SELECT * FROM users WHERE userid =" .$id;
  
  final statement:
  SELECT * FROM users WHERE userid = 15; DROP TABLE students; most of the database servers support multiple SQL executions using semicolon 
**/