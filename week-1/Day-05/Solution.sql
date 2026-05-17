QUESTION 1: Employee Compensation Classification
  
1. Convert emp_name to Upper Case
SELECT UPPER(emp_name) AS upper_name
FROM employee_payments;

2. Convert emp_name to Lower Case
SELECT LOWER(emp_name) AS lower_name
FROM employee_payments;

3. Convert emp_name to Proper Case (Initcap / CamelCase)
SELECT INITCAP(emp_name) AS proper_case_name
FROM employee_payments;

4. Calculate Total Income (base_salary + bonus) with NULL Safe
SELECT 
    emp_name,
    base_salary + COALESCE(bonus,0) AS total_income
FROM employee_payments;

5. Round Total Income to Nearest Integer
SELECT 
    emp_name,
    ROUND(base_salary + COALESCE(bonus,0)) AS rounded_income
FROM employee_payments;

6. Extract Joining Year
SELECT 
    emp_name,
    EXTRACT(YEAR FROM joining_date) AS joining_year
FROM employee_payments;

7. Classify Employees using CASE
SELECT 
    emp_name,

    CASE
        WHEN EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM joining_date) > 7
            THEN 'Senior'

        WHEN EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM joining_date) 
             BETWEEN 4 AND 7
            THEN 'Mid'

        ELSE 'Junior'
    END AS employee_level

FROM employee_payments;
