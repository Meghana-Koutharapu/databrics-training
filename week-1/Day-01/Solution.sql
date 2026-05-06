1. Select all columns from Employee 
  → SELECT * FROM Employee;

2. Select name and salary from Employee 
  → SELECT name, salary FROM Employee;

3. Select employees older than 30 
  → SELECT * FROM Employee WHERE age > 30;

4. Select all department names  
  → SELECT name FROM Department;

5. Select employees working in IT department 
  → SELECT e.* FROM Employee e JOIN Department d ON e.department_id=d.department_id WHERE d.name='IT';

