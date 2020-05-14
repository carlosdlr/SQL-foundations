-- Databse relationships
-- Databse relationship mean how the data in one table is related to the data in another table
-- In RDBMS (Relational database management system), the term raltional refers to tables with relations
-- Relationships between 2 tables are created using keys. A key in one table can refers to a key in another table
-- 2 tables in a database may also be unrelated
-- there are mainly 3 types of database relationships:
-- one to one (1:1)
-- one to many (1:M)
-- many to many (M:M)

-- ONE TO ONE (1:1) relationship
CREATE TABLE examids(
examid VARCHAR(10) NOT NULL,
studentid INT NOT NULL
);

INSERT INTO examids VALUES ('id01', 1), ('id02', 2), ('id03', 3);  -- one exam per each student
																						 -- to enforce this relation we can use a foreign key and a compose primary key
																						 
ALTER TABLE examids 
ADD CONSTRAINT fk_students FOREIGN KEY (studentid) REFERENCES students (studentid); -- to ensure that the student exists

ALTER TABLE examids ADD CONSTRAINT PRIMARY KEY (examid, studentid); -- to ensure that one student doesn't have the same exam twice


-- ONE TO MANY (1:M) relationship
-- one data in one table relates to multiple data in another table
-- the one to many relationship is the most common relationship in a RDBMS

USE company; 

-- the example of one to many relationship is shown between client and projects tables one client can have multiple projects

USE onlineshop;

-- the example of one to many relationship is shown between customers and orders tables one customer can have multiple orders


-- MANY to MANY (M:M) relationship
-- mutiple data in one table relates to the multiple data in another table

-- middle table to create a M:M relation between customers and items due to one customer can buy the same item many times and the same item
-- can be buy it by multiple customers
CREATE TABLE order_history (
userid INT NOT NULL,
itemid INT NOT NULL,
order_date DATE
);

INSERT INTO order_history VALUES (5,1,'2016-02-14'), (1,1,'2016-02-14'), (5,3,'2016-02-14');