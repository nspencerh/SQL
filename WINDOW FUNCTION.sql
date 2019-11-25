------------------------------ WINDOW FUNCTIONS ---------------------------------------------

-- PARTITION BY
SELECT first_name, hire_date, salary, department,
COUNT(*) OVER(PARTITION BY department) AS contador_apartamentos
FROM employees;
-- Hace lo mismo que esta query pero es menos "costosa"
(SELECT first_name, hire_date, salary, department,
(SELECT count(*) FROM employees e1 WHERE e1.department = e2.department)
FROM employees e2
ORDER BY department ASC)

-- ORDER BY
SELECT first_name, hire_date, salary, department,
SUM(salary) OVER(ORDER BY hire_date  ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS Acumulativo
FROM employees;
-- Si no se especifica nada, se asume "RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW"

-- RANK
SELECT first_name, email, department, salary,
RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank
FROM employees;
-- Para rankear a los empleados de acuerdo a su salario.

-- NTILE()
SELECT first_name, email, department, salary,
NTILE(5) OVER(PARTITION BY department ORDER BY salary DESC) AS salary_bracket
FROM employees;
-- En vez de "rankearlos" los agrupa en "n" groups

-- FIRST_VALUE()
SELECT first_name, email, department, salary,
FIRST_VALUE(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS first_value
FROM employees;
-- Takes de first value

-- NTH_VALUE()
SELECT first_name, email, department, salary,
NTH_VALUE(salary, 5) OVER(PARTITION BY department ORDER BY salary DESC) AS fifth_value
FROM employees;
-- toma el 5to valor

-- LEAD AND LAG
SELECT first_name, last_name, salary,
LEAD(salary) OVER() next_salary
FROM employees;

SELECT first_name, last_name, salary,
LAG(salary) OVER() previous_salary
FROM employees;

-- GROUP BY GROUPING SETS
SELECT continent, country, city, SUM(units_sold)
FROM sales
GROUP BY GROUPING SETS(continent, country, city);
-- para hacer una query agrupando por sets de grupos

-- GROUP BY ROLLUP
SELECT continent, country, city, SUM(units_sold)
FROM sales
GROUP BY ROLLUP(continent, country, city);
-- para hacer una query agrupando por sets de grupos
-- ROLLUP muesta si agrupamos por el nada,
-- por el primer elemento, por el primer y segundo elemento
-- por todos los elementos.

-- GROUP BY CUBE
SELECT continent, country, city, SUM(units_sold)
FROM sales
GROUP BY CUBE(continent, country, city);
-- para hacer una query agrupando por sets de grupos
-- CUBE muestra agruparlos por todas las combinatorias
-- posibles.
