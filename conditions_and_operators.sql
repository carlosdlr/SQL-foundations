SELECT * FROM students WHERE studentid = 6;

SELECT * FROM students WHERE firstname = 'John';

SELECT * FROM employees WHERE jobtitle = 'Application Developer';


--- SQL false conditions
SELECT * FROM students WHERE NOT age = 6;

SELECT * FROM students WHERE age <> 6;

-- AND conditinal
SELECT * FROM students WHERE (class = 'First' AND age = 5);

SELECT * FROM students WHERE (class = 'First' AND NOT age = 5);

USE onlineshop;

SELECT * FROM items WHERE (categoryid = 1 AND price = 250);

