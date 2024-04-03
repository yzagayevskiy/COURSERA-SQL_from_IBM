-- Additional Clauses, Built-In Functions, and Sub-Queries Exercises

-- SELECT … LIKE Statement
SELECT f_name, l_name FROM EMPLOYEES
WHERE address LIKE '%Elgin,IL%';

SELECT f_name, l_name from EMPLOYEES
WHERE b_date LIKE '197%';

-- SELECT … BETWEEN Statement
SELECT * FROM EMPLOYEES
WHERE (salary BETWEEN 60000 AND 70000);

-- SELECT … ORDER BY Statement
SELECT f_name, l_name, dep_id FROM EMPLOYEES
ORDER BY dep_id;

SELECT f_name, l_name, dep_id FROM EMPLOYEES
ORDER BY dep_id DESC, l_name DESC;

-- SELECT … GROUP BY Statement
SELECT dep_id, COUNT(*) FROM EMPLOYEES
GROUP BY dep_id;

SELECT dep_id, COUNT(*) AS 'NUM_EMPLOYEES', AVG(salary) as 'AVG_SALARY' FROM EMPLOYEES
GROUP BY dep_id HAVING COUNT(*) < 4
ORDER BY avg_salary;

-- Aggregation functions
SELECT SUM(COST) FROM PETRESCUE;

SELECT SUM(COST) AS SUM_OF_COST FROM PETRESCUE;

SELECT MAX(QUANTITY) FROM PETRESCUE;

SELECT MIN(QUANTITY) FROM PETRESCUE;

SELECT AVG(COST) FROM PETRESCUE;

SELECT ROUND(COST) FROM PETRESCUE;

SELECT ROUND(COST, 0) FROM PETRESCUE;

SELECT LENGTH(ANIMAL) FROM PETRESCUE;

SELECT UCASE(ANIMAL) FROM PETRESCUE;

SELECT LCASE(ANIMAL) FROM PETRESCUE;

SELECT DAY(RESCUEDATE) FROM PETRESCUE;

SELECT MONTH(RESCUEDATE) FROM PETRESCUE;

SELECT YEAR(RESCUEDATE) FROM PETRESCUE;

SELECT DATE_ADD(RESCUEDATE, INTERVAL 3 DAY) FROM PETRESCUE;

SELECT DATE_ADD(RESCUEDATE, INTERVAL 2 MONTH) FROM PETRESCUE;

SELECT DATE_SUB(RESCUEDATE, INTERVAL 3 DAY) FROM PETRESCUE;

SELECT DATEDIFF(CURRENT_DATE, RESCUEDATE) FROM PETRESCUE;

SELECT FROM_DAYS(DATEDIFF(CURRENT_DATE, RESCUEDATE)) FROM PETRESCUE;

-- Sub-queries
SELECT * FROM EMPLOYEES
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);
SELECT EMP_ID, SALARY, (SELECT MAX(SALARY) FROM EMPLOYEES) AS MAX_SALARY 
FROM EMPLOYEES;

SELECT F_NAME, L_NAME
FROM EMPLOYEES
WHERE B_DATE = (SELECT MIN(B_DATE) FROM EMPLOYEES);

SELECT AVG(SALARY) 
FROM (SELECT SALARY 
      FROM EMPLOYEES 
      ORDER BY SALARY DESC 
      LIMIT 5) AS SALARY_TABLE;

-- Working with multiple tables
SELECT * FROM EMPLOYEES WHERE JOB_ID IN (SELECT JOB_IDENT FROM JOBS);

SELECT JOB_TITLE, MIN_SALARY, MAX_SALARY, JOB_IDENT
FROM JOBS
WHERE JOB_IDENT IN (select JOB_ID from EMPLOYEES where SALARY > 70000 );

SELECT *
FROM EMPLOYEES, JOBS
WHERE EMPLOYEES.JOB_ID = JOBS.JOB_IDENT;

SELECT *
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT;

SELECT EMP_ID, F_NAME, L_NAME, JOB_TITLE
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT;

SELECT E.EMP_ID, E.F_NAME, E.L_NAME, J.JOB_TITLE
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT;