------------------ SUBSTRING ------------------
SELECT SUBSTRING ('this is a test data' FROM 1 FOR 4); -- SUBSTRING starts in 1 and end in 4
SELECT SUBSTRING ('this is a test data' FROM 1); -- SUBSTRING starts in 1 until the end

------------------ REPLACE ------------------
SELECT department,
REPLACE(department, 'Clothing', 'Attire')  -- Replace the "department" column where
FROM departments;                          -- where it finds 'Clothing' with the string 'Attire'

SELECT department,
REPLACE(department, 'Clothing', 'Attire') || ' area'  -- To concatenate string or columns
FROM departments;

------------------ POSITION ------------------
SELECT POSITION('@' IN email)     -- Tell me the POSITION where '@' is in email the column.
FROM employee
-- example with POSITION function and SUBSTRING function
SELECT email, SUBSTRING(email FROM (POSITION('@' IN email) + 1))
FROM employees;

------------------ COALESCE ------------------
SELECT COALESCE(email, 'NONE') AS email -- replace with the string 'NONE' where NULL is found
FROM employees;

------------------ UPPER ------------------
SELECT UPPER(first_name)            -- change the string to uppercase
FROM employees;

------------------ LOWER ------------------
SELECT LOWER(first_name)            -- change the string to lowercase
FROM employees;

------------------ LENGTH ------------------
SELECT LENGTH(first_name)            -- to get the lenth of the string
FROM employees;

------------------ TRIM ------------------
SELECT TRIM('    this is a string   ')   -- takes the spaces off the string
FROM employees;

------------------ BOOLEAN EXPRESSION ------------------
-- concatenates the full name and a boolean column 
SELECT first_name || ' ' || last_name as complete_name, (salary > 140000)
FROM employees;
