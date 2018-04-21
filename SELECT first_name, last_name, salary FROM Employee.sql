SELECT first_name, last_name, salary FROM Employees
 WHERE salary NOT BETWEEN 10000 AND 15000;


SELECT first_name, last_name, department_id FROM Employees
WHERE department_id IN (30, 100) ORDER BY  department_id  ASC;


SELECT first_name, last_name, salary, department_id FROM Employees
WHERE salary NOT BETWEEN 10000 AND 15000 AND department_id IN (30, 100);


SELECT first_name, last_name, hire_date FROM Employees 
WHERE YEAR(hire_date)  LIKE '1987%';


SELECT first_name FROM Employees
WHERE first_name LIKE '%b%' AND first_name LIKE '%c%';


SELECT last_name, job_id, salary FROM Employees
WHERE job_id IN ('IT_PROG', 'SH_CLERK') AND salary NOT IN (4500,10000,15000);


SELECT last_name FROM Employees WHERE first_name LIKE '______';


SELECT last_name FROM Employees WHERE last_name LIKE '__e%';


SELECT DISTINCT JOB_TITLE FROM Jobs
LEFT OUTER JOIN Employees ON Jobs.JOB_ID = Employees.JOB_ID
WHERE Employees.JOB_ID IS NULL;


SELECT first_name, last_name, salary, (salary*.15) AS PF from Employees;


SELECT * FROM Employees WHERE last_name IN('BLAKE', 'SCOTT', 'KING', 'FORD')
