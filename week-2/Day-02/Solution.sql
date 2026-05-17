
1. Employees and Their Managers (Including Employees Without Managers)
  
SELECT e.emp_name AS employee_name,
       m.emp_name AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;


2. All Employees and Their Departments (Including Employees Without Department)
  
SELECT e.emp_name,
       d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;


3. Employees Who Report to a Manager
  
SELECT e.emp_name AS employee_name,
       m.emp_name AS manager_name
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id;


4. Total Salary Paid to Each Employee and Department
(salary table not provided, assumed salary column exists)

SELECT d.dept_name,
       e.emp_name,
       SUM(s.salary) AS total_salary
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
LEFT JOIN salaries s
ON e.emp_id = s.emp_id
GROUP BY d.dept_name, e.emp_name;


5. Employees Without Any Department
  
SELECT e.emp_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;


6. Employees and Their Projects (Including Employees Without Projects)
  
SELECT e.emp_name,
       p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id;


7. Employees Who Completed At Least One Project
  
SELECT e.emp_name,
       p.project_name
FROM employees e
INNER JOIN projects p
ON e.emp_id = p.emp_id;


8. Employees and Projects (No Project Omitted)
  
SELECT e.emp_name,
       p.project_name
FROM employees e
RIGHT JOIN projects p
ON e.emp_id = p.emp_id;


9. Employees and Salaries (NULL if No Salary)
  
SELECT e.emp_name,
       s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_id = s.emp_id;


10. Employees and Department Names
  
SELECT e.emp_name,
       d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;


11. All Departments and Employees
  
SELECT d.dept_name,
       e.emp_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;


12. Employees With Contact Information
  
SELECT e.emp_name,
       c.phone_number,
       c.email
FROM employees e
LEFT JOIN contacts c
ON e.emp_id = c.emp_id;


13. Employees and Departments Including Unmatched Records
  
SELECT e.emp_name,
       d.dept_name
FROM employees e
FULL OUTER JOIN departments d
ON e.dept_id = d.dept_id;


14. Employees Without Any Project
  
SELECT e.emp_name,
       p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id
WHERE p.project_id IS NULL;


15. Employees and Their Projects
  
SELECT e.emp_name,
       p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id;


16. All Projects and Assigned Employees
  
SELECT p.project_name,
       e.emp_name
FROM projects p
LEFT JOIN employees e
ON p.emp_id = e.emp_id;


17. Employees Having Both Manager and Project
  
SELECT e.emp_name,
       m.emp_name AS manager_name,
       p.project_name
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id
INNER JOIN projects p
ON e.emp_id = p.emp_id;


18. Employees With Departments Only
  
SELECT e.emp_name,
       d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;


19. Employees Belonging to Multiple Departments
(Assuming junction table employee_departments exists)

SELECT e.emp_name,
       d.dept_name
FROM employee_departments ed
INNER JOIN employees e
ON ed.emp_id = e.emp_id
INNER JOIN departments d
ON ed.dept_id = d.dept_id;


20. Departments Including Those Without Employees
  
SELECT d.dept_name,
       e.emp_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;


21. Employees With Projects but No Department
  
SELECT e.emp_name,
       p.project_name
FROM employees e
INNER JOIN projects p
ON e.emp_id = p.emp_id
WHERE e.dept_id IS NULL;


22. Total Employees in Each Department
  
SELECT d.dept_name,
       COUNT(e.emp_id) AS total_employees
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;


23. Employees Reporting to Managers Only
  
SELECT e.emp_name,
       m.emp_name AS manager_name
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id;


24. All Employees and Their Managers
  
SELECT e.emp_name,
       m.emp_name AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;


25. Departments and Employee Count
  
SELECT d.dept_name,
       COUNT(e.emp_id) AS employee_count
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;


26. Employees and Departments Including Empty Departments
  
SELECT e.emp_name,
       d.dept_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;


27. Employees Without Salary Records
  
SELECT e.emp_name
FROM employees e
LEFT JOIN salaries s
ON e.emp_id = s.emp_id
WHERE s.emp_id IS NULL;


28. Employees and Project Assignments
  
SELECT e.emp_name,
       p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id;


29. Employees With Department and Project Assignments
  
SELECT e.emp_name,
       d.dept_name,
       p.project_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
LEFT JOIN projects p
ON e.emp_id = p.emp_id;


30. Employees With/Without Departments
  
SELECT e.emp_name,
       d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;
