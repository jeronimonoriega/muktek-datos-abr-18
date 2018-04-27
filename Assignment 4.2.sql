#1 Write a query to find the name (FIRST_NAME, LAST_NAME) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary of the lowest to highest. Employees
SELECT first_name, last_name, salary, job_id FROM Employees
WHERE salary > (SELECT MAX(SALARY) FROM Employees WHERE job_id = 'SH_CLERK')
ORDER BY salary;

#2 Write a query to find the name (FIRST_NAME, LAST_NAME) of the employees who are not supervisors. Employees
SELECT b.first_name,b.last_name  FROM Employees b 
WHERE NOT EXISTS (SELECT 'X' FROM Employees a WHERE a.manager_id = b.employee_id);

#3 Write a query to display the employee ID, first name, last name, and department names of all employees. Employees, Departments
SELECT employee_id, first_name, last_name, department_name
 FROM Employees e  Inner Join Departments  d ORDER BY department_name;

 #4 Write a query to fetch even numbered records from employees table. Employees
SELECT employee_id, first_name, last_name FROM Employees WHERE MOD(employee_id, 2) = 0;

#5 Write a query to find the 5th maximum salary in the employees table. Employees
SELECT DISTINCT salary 
FROM Employees e1 
WHERE 5 = (SELECT COUNT(DISTINCT salary) 
FROM Employees  e2 
WHERE e2.salary >= e1.salary);

#6 Write a query to find the 4th minimum salary in the employees table. Employees
SELECT DISTINCT salary 
FROM Employees e1 
WHERE 4 = (SELECT COUNT(DISTINCT salary) 
FROM Employees  e2 
WHERE e2.salary <= e1.salary);

#7 Write a query to select last 10 records from a table. Employees
SELECT * FROM (
SELECT * FROM Employees ORDER BY employee_id DESC LIMIT 10) sub 
ORDER BY employee_id ASC;

#8 Write a query to list the department ID and name of all the departments where no employee is working. Employees, Departments
SELECT * FROM Departments 
WHERE department_id 
NOT IN (select department_id FROM Employees);

#9 Write a query to get 3 maximum salaries. Employees
SELECT DISTINCT salary 
FROM Employees a 
WHERE 3 >= (SELECT COUNT(DISTINCT salary) 
FROM Employees b 
WHERE b.salary >= a.salary) 
ORDER BY a.salary DESC;

#10 Write a query to get 3 minimum salaries. Employees
SELECT DISTINCT salary 
FROM Employees a 
WHERE  3 >= (SELECT COUNT(DISTINCT salary) 
FROM Employees b 
WHERE b.salary <= a.salary) 
ORDER BY a.salary DESC;

#1 Write a query to get the department name and number of employees in the department.
SELECT department_name AS 'Department Name', 
COUNT(*) AS 'No of Employees' 
FROM Departments 
INNER JOIN Employees 
ON Employees.department_id = Departments.department_id 
GROUP BY Departments.department_id, department_name 
ORDER BY department_name;

#2 Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
SELECT employee_id, job_title, end_date-start_date Days FROM JobHistory 
NATURAL JOIN Jobs 
WHERE department_id=90;

#3 Write a query to display the department ID and name and first name of manager.
SELECT d.department_id, d.department_name, d.manager_id, e.first_name 
FROM Departments d 
INNER JOIN Employees e 
ON (d.manager_id = e.employee_id);

#4 Write a query to display the department name, manager name, and city.
SELECT d.department_name, e.first_name, l.city 
FROM Departments d 
JOIN Employees e 
ON (d.manager_id = e.employee_id) 
JOIN Locations l USING (location_id);

#5 Write a query to display the job title and average salary of employees.
SELECT job_title, AVG(salary) 
FROM Employees 
NATURAL JOIN Jobs 
GROUP BY job_title;

#6 Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job.
SELECT job_title, first_name, salary-min_salary 'Salary - Min_Salary' 
FROM Employees 
NATURAL JOIN Jobs;

#7 Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.
SELECT jh.* FROM JobHistory jh 
JOIN Employees e 
ON (jh.employee_id = e.employee_id) 
WHERE salary > 10000;

#Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
SELECT department_name, first_name, last_name, hire_date, salary, 
(DATEDIFF(now(), hire_date))/365 Experience 
FROM Departments d JOIN Employees e 
ON (d.manager_id = e.employee_id) 
WHERE (DATEDIFF(now(), hire_date))/365>15;
