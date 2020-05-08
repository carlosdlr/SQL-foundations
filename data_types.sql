-- Data types in SQL
-- Create profesional, normalized, relational and easy to manage database cloumns and table structures
-- Every column in a table is defined with a type, depending up on the data value it's going to store
-- a data type defines what kind of value a column can store
-- there are mainly 3 data types: Numeric, character & temporal
-- Numeric data types can store integers fixed point numbers and floating point numbers
-- Character data types can store alphabets, symbols and also numbers
-- Temporal data types stores date time and date & time together
-- Data types name and sizes can differs in different database managemetn systems

-- Integer data type
-- integer numbers are non fractional numbers like 1, 2, 3, 4 and so on
-- integers can store positive, negative and zero number values.
-- in SQL standard interger types are, INTEGER OR INT and SMALLINT. in MYSQL as an extension to the standard
-- integers types, it supports the integer types like TINYINT, MEDIUMINT, and BIGINT

-- Fixed-Point numbers (exact value)
-- Fixed point numbers  or exact values are numbers formed by an int part and a fraction part like 0.01, 10.25 etc..
-- the Fixed point numbers are the values like currency small calculations and measurement data with decimal values


-- DECIMAL and NUMERIC Data Types (exact values)
-- the DECIMAL and NUMERIC Data Types have the same format for sorting the data value
-- DECIMAL(5,2) or NUMERIC(5,2)
-- precision 5 the total number of digits
-- scale optional 2 is the number of digits that will contain the fractional part if is not defined the default value is 0
-- Example: to store the decimal values like 99.99 in a table column, we will define DECIMAL(4,2)

-- Floating-Point Numbers (Approximate values)
-- the floating point numbers or approximate values are either very very big or very very small values mostly used in scientific or measurement calculation
-- the computer hardware architecture causes rounding errors that's why floating numbers are also known as approximate values
/**
Example: 9,900,000,000,000,000,000,000,000
to store the value  as decimal, DECIMAL(25,0)
scientific notation: 9.9 x 10ex(24) (9.9 is mantissa and 24 is the exponent)
more accurate: 9.91 x 10ex(24)
**/

-- The FLOAT, REAL and DOUBLE PRECISION are used to store floating point number values
-- FLOAT(M,D) or REAL(M,D), or DOUBLE(M,D) M is total number digits, of which D digits may be after the decimal point
-- FLOAT(7,4) can store the value up to 999.9999 value, 123.000089 will be store as 123.0001
-- for maximum portability the floating-point number data types should be defined as FLOAT or DOUBLE PRECISION with no definition of precision

-- CHAR OR CHARACTER data type
-- the CHAR OR CHARACTER data type stores fixed width character columns
-- it is required to enter column width example CHAR(5), CHAR(50)
-- if and inserted character legnth is less than the defined cloumn width, the value is positioned to the left and padded with spaces on the right until
-- the character legnth is reacheds
/**
example: In firstname CHAR(20), the String 'John' will be appended with 16 spaces
**/
-- the storage space bytes are exactly similar to the character legnth defined in the data type example CHAR(20) will store 20 bytes

-- VARCHAR or VARYING CHARACTER
-- the VARCHAR or VARYING CHARACTER store dynamic width character columns
-- in VARCHAR the defined width is, the maximum width of the value allowed in the data column example VARCHAR(30), VARCHAR(250) the maximum
-- allowed in the data column will be 30 and 250 respectively
-- the inserted data character legnth will be exactly similar to the inserted string
-- exmaple: in VARCHAR(250), data column will store only 4 character for the value 'John'
-- in varchar data type the data storage space bytes are the data string legnth plus one byte
-- example: for inserting 'John', the data length will be 4 + 1 to a total of 5 bytes of storage


-- NCHAR and NVARCHAR
-- the NCHAR and NVARCHAR means NATIONAL CHARACTER and NATIONAL VARIABLE CHARACTER
-- the NCHAR and NVARCHAR store fixed width character columns but it use larger character set
-- the NCHAR and NVARCHAR use unicode character sets are required to store foreing languages
-- in CHAR and VARCHAR, 1 byte storage is required to store each character while in NCHAR and NVARCHAR 2 bytes are required


-- CLOB and BLOB
-- the CLOB and BLOB means character large object and binary large object respectively
-- the CLOB and BLOB data type is used to store very large data that cannot be store in CHAR or VARCHAR
-- the CLOB and BLOB are used to store source text of the post in plain text, HTML or XML format
-- the CLOB is used to store character data while the BLOB is used to store binary data like images, audio and video
-- In MYSQL TEXT is similiar to CLOB

-- DATE, TIME and TIMESTAMP (Temporal values)
-- the temporal data types consist of date, time and timestamp(have date and time)
-- the date value stores standard 365 day gregorian calendar
-- each database system has its own rules for sorting and displaying date values. the date formats differs from one database system to another
-- the most popular date format is 'YYYY-MM-DD' where 4Y means year, 2M menas month, and 2D for the day
-- MYSQL retrives and displays TIME values in 'HH:MM:SS' format. The time value formats may differs from one database system to another
-- The timestamp data type can store date as well as time components