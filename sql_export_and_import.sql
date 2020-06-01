-- SQL Export and Import

-- Export means to backup or save a file which contain our exisitng database, tables or information

-- Import
-- An import means to save or restore the backup from a file containing our existing database, tables or the data information
-- The database export and import can be done using visual tools in respected database management systems or using SQL statements
-- The SQL export and import are very useful for database migration from one server to anohter server
-- The SQL export and import are also useful for data analysis and keeping the application data backup in case of data loss

-- Export
-- The SQL export systematically takes backup of our application database structure and data
-- SQL export can write or save the data to various formats
-- SQL export provides the felxibility of writing data files that require little or no modification to read data files from the other software

-- to export data command
-- mysqldump -u root -p school students > "backup/students.txt" supports different formats like csv and sql

-- to export just the table structure
-- mysqldump -d -u root -p school students > "backup/students_structure.sql"

-- to export all databases
-- mysqldump -d -u root -p --all-databases > "backup/all_databases.sql"

-- steps to import

USE school;

DROP TABLE students;

-- mysql -u root -p school < "backup/students.sql"