-- Creating and display databases
-- the databases are created by using CREATE DATABASE statement
-- a valid database name may contain only letters, numbers and underscore symbol
-- the database name must contain at least one alphabet letter
-- the database names are always stored in lowercase letters
-- its good practice to name the database with some meaningful characters, like company name, website name, business name etc.
-- the existing databases are displayed by using the SHOW DATABASE statement
-- SQL statements to create and display databases:
-- CREATE DATABASE databasename;
-- SHOW DATABASES;

SHOW DATABASES;

CREATE DATABASE mydatabase;

CREATE DATABASE 123; --will throw an error due to the database name needs at least one alphabetic character in the name

-- Select and use existing database
-- the user must select the database before creating new tables or return the data rows from existing tables
-- selecting the database is really important becuase multiple databases may contain, similar tables names
-- the database is selected by using USE statement
-- USE databasename

USE company;

-- Remove or delete a database
-- the DROP DATABASE statement is used to remove or delete the database including all the tables and data rows in it.
-- be careful before deleting the database because the system does not ask for confirmation
-- example: DROP databasename;

DROP mydatabase;

-- Create database table
-- the CREATE TABLE statement is used to create a database table
-- a valid database table name may contain only letters, numbers and underscore symbol
-- the database table names are not case-sensitive this means that the table name 'students' is similar to 'StUDenTs'
-- a single database must contain a unique table name, while in multiple databases, the same table name can exist in another database
/**
example:
CREATE TABLE tablename (
	columnname1 datatype,
	columnname2 datatype 
);
**/

USE school;

CREATE TABLE students3 (
	studentid SMALLINT(5),
	firstname VARCHAR(20)
);

DESCRIBE students3; -- shows the table structure
EXPLAIN  students3; -- other way to shows the table structure


-- Modify or update the database table
-- the ALTER TABLE statement is used to rename, add or drop columns in the existing database table
-- to rename the table
-- ALTER TABLE oldtablename RENAME newtablename
--to add a new column in the existing table
-- ALTER TABLE tablename ADD columnname datatype
-- to modify the column data type in existing table
-- ALTER TABLE tablename MODIFY COLUMN columnname datatype 

USE school;

ALTER TABLE students3 RENAME students4;

ALTER TABLE students4 ADD lastname VARCHAR(10);

DESCRIBE students4;

ALTER TABLE students4 DROP COLUMN lastname;

DESCRIBE students4;

-- Remove or delete table
-- we can create as well as remove the database table from our existing database
-- the DROP TABLE statement is used to remove or delete the database table including all data rows
-- be careful before deleting the database table completely from your database because the system doesn't ask for confirmation
-- example: DROP TABLE tablename;

DROP TABLE students4;

SHOW TABLES;


-- SQL constraints
-- the SQL constraints defines specific rules to the column data in a database table
-- while inserting updating or deleting the data rows, if the constraints rules are not followed, the system will displays error
-- the SQL constraints are defined while creating a new table. We can also alter the table and add new SQL constraintss
-- the standard SQL supports 6 SQL constraints. NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK and DEFAULT.
/**
example:
CREATE TABLE tablename (
	column1 datatype constraints,
	column2 datatype constraints,
	column3 datatype constraints
);
**/

-- NOT NULL constraint
-- by default the database column can store NULL values means no value in the data row.
-- by defining NOT NULL constraint to the table column, the default behavior of database column changes and it does not accept NULL values
-- in database table, we can have some columns where storing NULL values doesn't make sense
-- the NOT NULL constraint can be defined to string as well as numerci data types

ALTER TABLE students MODIFY COLUMN firstname VARCHAR(40) NULL, MODIFY COLUMN lastname VARCHAR(40) NULL;

DESCRIBE students;

ALTER TABLE students MODIFY COLUMN firstname VARCHAR(40) NOT NULL, MODIFY COLUMN lastname VARCHAR(40) NOT NULL;

-- UNIQUE constraint
-- the UNIQUE constraint is useful to restrict storing duplicate data row value in a given column
-- multiples columns in a single table can have the UNIQUE constraint
-- the PRIMARY KEY automatically sets UNIQUE constraint to the primary key column
/**
examples:
ALTER TABLE tablename ADD UNIQUE (column1);
ALTER TABLE tablename DROP INDEX column1;
**/ 

SELECT * FROM subjects; -- first verify that doesn't exists duplicate titles before add the unique constraint

ALTER TABLE subjects ADD UNIQUE (title);

DESCRIBE subjects;

ALTER TABLE subjects DROP INDEX title; -- to remove the unique constraint from the title column


-- Primary key constraint
-- the Primary key constraint is useful to restrict storing of duplicate data row values in a given column
-- the Primary key constraint is similar to unique constraint but unlike UNIQUE constraint there can be only one primary key for table
-- the Primary key automatically sets UNIQUE constraint for that table column
-- the Primary key column cannot contain null values
-- the Primary key can be defined while creating a new database table or can be added by using ALTER TABLE statement
/**
example:
ALTER TABLE tablename ADD PRIMARY KEY (column1);
ALTER TABLE tablename DROP PRIMARY KEY column1;
**/


-- FOREIGN key constraint
-- a FOREIGN key in a table always points to a PRIMARY KEY in another table
-- the FOREIGN key constraint terminates the action that can destroy the links between relational tables
-- the FOREIGN key constraint also restrict adding invalid data to the foreign column because the foreign key columns must be similar to the the linked primary key values
-- the FOREIGN key can be defined while creating a new database table or can be added by using ALTER TABLE statement
/**
examples:
ALTER TABLE tablename1 ADD CONSTRAINT fk_name FOREIGN KEY (column1) REFERENCES tablename2(column1);
ALTER TABLE tablename1 DROP FOREING KEY fk_name;
**/ 

USE school;

ALTER TABLE teachers ADD COLUMN subjectid INT(11) NOT NULL DEFAULT 1;

DESCRIBE teachers;

ALTER TABLE teachers ADD CONSTRAINT fk_subjectid FOREIGN KEY (subjectid) REFERENCES subjects (subjectid);

DESCRIBE teachers;

UPDATE teachers SET subjectid = 99 WHERE teacherid = 1; -- will throw an error due the 99 subject id doesn't exists in the table subjects

UPDATE teachers SET subjectid = 3 WHERE teacherid = 1;  -- will work due to subject id 3 exists in the table subjects

ALTER TABLE teachers DROP FOREIGN KEY fk_subjectid; -- first delete the foreign key
ALTER TABLE teachers DROP COLUMN subjectid; -- after the column


-- CHECK constraint
-- the CHECK constraint is used to control the range value that can be store in a table column
-- a table column with CHECK constraint defined will save only specific values in the column
-- the CHECK constraint can be applied to a single or multiple columns
-- the CHECK constraint can be defined while creating a new table or using ALTER TABLE	statement for an existing one.
/**
example:
CREATE TABLE tablename(
	column1 atatype,
	column2 datatype,
	CHECK(column1 > 0)
);

ALTER TABLE tablename ADD CONSTRAINT chk_column1 CHECK (column1 > 0);
**/



-- DEFAULT constraint
-- the DEFAULT constraint is used to set a default value for a data column
-- if the value for the column in data row is not defined, the default value will be added to the data row column.
-- the DEFAULT constraint can be defined while creating a new table or using ALTER TABLE statement for existing table.
/**
example:
CREATE TABLE tablename (
	column1 datatype,
	column2 datatype DEFAULT 'novalue'
);

ALTER TABLE tablename ALTER column1 SET DEFAULT 'novalue';
**/

ALTER TABLE students ALTER age SET DEFAULT 5;
INSERT INTO students (firstname, lastname, class) VALUES ('john', 'wick', 'First'); -- will insert a new record with age 5 due to we add the default constraint




-- AUTO INCREMENT or SEQUENCE
-- the AUTO_INCREMENT attribute generates and save unique number every time a new data row is inserted into a table
-- for PRIMARY KEY column we always require a unique number to be stored. Instead of creating a unique number manually, AUTO_INCREMENT or SEQUENCE attribute is useful
-- the AUTO INCREMENT or SEQUENCE are only used with numeric data columns 
-- in MYSQL default AUTO_INCREMENT generates new value by adding 1, for each new record
/**
examples:
MYSQL
CREATE TABLE tablename (column1 datatype NOT NULL PRIMARY KEY AUTO_INCREMENT, column2 datatype);

SQL Server
CREATE TABLE tablename (column1 datatype IDENTITY(1,1) PRIMARY KEY, column2 datatype);

MS ACCESS
CREATE TABLE tablename (column1 datatype PRIMARY KEY AUTO_INCREMENT, column2 datatype);

Oracle
CREATE SEQUENCE column1
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 50

**/ 
