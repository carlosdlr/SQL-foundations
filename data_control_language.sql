-- Data Control Language (DCL)
-- User needs permission to perform database operations
-- Privileges: Add user, Create databases, create tables, perform quieries
-- the GRANT statement & REVOKE statement are used to perform users permissions administration
-- GRANT: give the permission
-- REVOKE: withdraw privileges


-- GRANT statement
-- gives permission/privileges
-- set privileges to limited databases or all databases
-- give selected number of privileges or all privileges
-- GRANT privilegename ON databasename TO username;

CREATE USER maker IDENTIFIED BY 'maker1234'; -- creates an user without any privilege

CREATE USER authorizer IDENTIFIED BY 'auth1234';

USE mysql; -- internal database that stores system information like users and privileges

DESCRIBE user; -- this table store all the database system users information and privileges

SELECT user.User, user.Select_priv, user.Insert_priv, 
user.Update_priv, user.Delete_priv, user.Create_priv FROM user; -- this query allow us check the basic privileges of the users in the system

GRANT SELECT, CREATE ON school.* TO maker; -- gives to the user select to all tables and create them in the school databse
GRANT ALL ON *.* TO authorizer; --gives all the privileges to the authorizer user and all databases and all tables


-- REVOKE STATEMENT
-- withdraws permissions/privileges
-- remove privileges to limited databases or all databases
-- remove seleted number of privileges or all privileges
-- REVOKE privilegename ON databasename FROM username

REVOKE SELECT, CREATE ON school.* FROM maker; -- remove create and select privileges from maker user

REVOKE ALL ON *.* FROM authorizer; -- remove all privileges from maker user