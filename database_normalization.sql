-- Database normalization
-- Database normalization is the most important factor in database design or data modeling
-- Eliminates data redundacies and store the data logically to make the data management easier
-- database relationships and keys are useful to achive this
-- database normalization was developed by E.F Codd
-- the series of rules in normalization are called normal forms. there are mainly 3 types of forms
-- First normal form (1NF)
-- Second normal form (2NF)
-- Third normal form (3NF)


-- First normal form (1NF)
-- each column must contain only one value and no table should store repeating groups of realted data

-- Second normal form (2NF)
-- first the database must be in the first normal form, it should not store duplicate rows in the same table. Duplicate values in the row
-- should be stored in their own separate tables and linked to the table using foreign keys. Create one to many relationships tables.


-- Third normal form (3NF)
-- the database is already in third normal form, if it is in second normal form and every non-key columns is mutually independent.
-- identify interdependent columns and store them in their own separate tables.  
 