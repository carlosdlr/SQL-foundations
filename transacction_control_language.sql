-- Transaction control language (TCL)
-- DDL statement: Difficult to verify or rollback the changes
-- in a set of DDL statemens that compose a process what happens if one of those fails?
-- Transaction: is a group of sql statements that changes values from one or different tables
-- ability to rollback this means if one of the sql that compose a transaction fails we can revert all the previous changes

-- BEGIN, COMMIT, ROLLBACK, SAVEPOINT AND SET AUTOCOMMIT
-- BEGIN: Starts a trnasaction
-- COMMIT: Completes the transaction. after commit we cant't revert the changes
-- ROLLBACK: Must execute before COMMIT. Reverts back the changes after rollback is not possible commit
-- SAVEPOINT: rollback the changes to a specific save point
-- SET AUTOCOMMIT: enables/disables default autocommit mode for the current session


-- COMMIT STATEMENT
-- the COMMIT STATEMENT completes the transaction and save the changes permanently
-- the transaction can be INSERT, UPDATE or DELETE
-- after COMMIT is not possible to revert the changes
-- COMMIT STATEMENT can be use only after transactions statements INSERT, UPDATE or DELETE

USE school;

SELECT * FROM students;

START TRANSACTION;

UPDATE students SET age = 6 WHERE studentid = 1; -- this change is not permanently saved until commit statement is executed

COMMIT;


-- ROLLBACK STATEMENT
-- the ROLLBACK STATEMENT reverts the changes to their previous state
-- the ROLLBACK STATEMENT must be executed before COMMIT statement
-- after ROLLBACK STATEMENT is not possible COMMIT
-- ROLLBACK STATEMENT can be use only after transactions statements INSERT, UPDATE or DELETE

BEGIN;

UPDATE students SET age = 5 WHERE studentid = 1;

ROLLBACK;  -- reverts the previous change age from 5 to the previous value


CREATE DATABASE bank;
USE bank;

CREATE TABLE clients (
cid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
clientname VARCHAR(30) NOT NULL,
balance FLOAT );

CREATE TABLE tdetails (
tnumber INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
tmessage TEXT,
tdate DATETIME
);


BEGIN;
INSERT INTO clients (clientname, balance) VALUES ('John', 1000), ('Mike', 100);

-- send 100 from John account to mike account
UPDATE clients SET balance = (balance - 100) WHERE cid = 1;
--UPDATE clients SET balance = (balance + 100) WHERE cid = 2;

-- creates the record in the transaction details table
INSERT INTO tdetails (tmessage, tdate) VALUES('John sent $100 to mike', NOW());
ROLLBACK;