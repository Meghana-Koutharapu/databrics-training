-- 1. Use ROW_NUMBER() to assign a row number to employees ordered by salary descending.

SELECT employee_name,
       salary,
       ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employees;



-- 2. Use RANK() to rank employees by salary.

SELECT employee_name,
       salary,
       RANK() OVER(ORDER BY salary DESC) AS rank_num
FROM employees;



-- 3. Use DENSE_RANK() to rank employees by salary.

SELECT employee_name,
       salary,
       DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank_num
FROM employees;



-- 4. Find the top 3 highest-paid employees using a window function.

SELECT *
FROM (
    SELECT employee_name,
           salary,
           ROW_NUMBER() OVER(ORDER BY salary DESC) AS rn
    FROM employees
) t
WHERE rn <= 3;



-- 5. Rank employees within each department using PARTITION BY.

SELECT employee_name,
       department,
       salary,
       RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employees;



-- 6. Display the highest salary in each department using a window function.

SELECT employee_name,
       department,
       salary,
       MAX(salary) OVER(PARTITION BY department) AS highest_salary
FROM employees;



-- 7. Calculate the running total of order amounts ordered by order_date.

SELECT order_id,
       order_date,
       total_amount,
       SUM(total_amount)
       OVER(ORDER BY order_date) AS running_total
FROM orders;



-- 8. Calculate the cumulative sales amount for each employee.

SELECT employee_id,
       order_date,
       total_amount,
       SUM(total_amount)
       OVER(PARTITION BY employee_id ORDER BY order_date) AS cumulative_sales
FROM orders;



-- 9. Use LAG() to show the previous order amount for each customer.

SELECT customer_id,
       order_date,
       total_amount,
       LAG(total_amount)
       OVER(PARTITION BY customer_id ORDER BY order_date) AS previous_order
FROM orders;



-- 10. Use LEAD() to show the next order amount for each customer.

SELECT customer_id,
       order_date,
       total_amount,
       LEAD(total_amount)
       OVER(PARTITION BY customer_id ORDER BY order_date) AS next_order
FROM orders;



-- 11. Find the difference between the current order amount and previous order amount.

SELECT customer_id,
       order_date,
       total_amount,
       total_amount -
       LAG(total_amount)
       OVER(PARTITION BY customer_id ORDER BY order_date) AS difference
FROM orders;



-- 12. Calculate a moving average of the last 3 orders.

SELECT order_id,
       order_date,
       total_amount,
       AVG(total_amount)
       OVER(
           ORDER BY order_date
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS moving_avg
FROM orders;



-- 13. Use NTILE(4) to divide employees into salary quartiles.

SELECT employee_name,
       salary,
       NTILE(4) OVER(ORDER BY salary DESC) AS quartile
FROM employees;



-- 14. Find the first order placed by each customer using ROW_NUMBER().

SELECT *
FROM (
    SELECT customer_id,
           order_id,
           order_date,
           ROW_NUMBER()
           OVER(PARTITION BY customer_id ORDER BY order_date) AS rn
    FROM orders
) t
WHERE rn = 1;



-- 15. Find the latest order placed by each customer.

SELECT *
FROM (
    SELECT customer_id,
           order_id,
           order_date,
           ROW_NUMBER()
           OVER(PARTITION BY customer_id ORDER BY order_date DESC) AS rn
    FROM orders
) t
WHERE rn = 1;



-- 16. Display employee salaries along with department average salary.

SELECT employee_name,
       department,
       salary,
       AVG(salary)
       OVER(PARTITION BY department) AS dept_avg_salary
FROM employees;



-- 17. Find employees earning above their department average salary.

SELECT *
FROM (
    SELECT employee_name,
           department,
           salary,
           AVG(salary)
           OVER(PARTITION BY department) AS dept_avg
    FROM employees
) t
WHERE salary > dept_avg;



-- 18. Use SUM() OVER(PARTITION BY department) to calculate department payroll.

SELECT employee_name,
       department,
       salary,
       SUM(salary)
       OVER(PARTITION BY department) AS department_payroll
FROM employees;



-- 19. Find the percentage contribution of each employee salary within their department.

SELECT employee_name,
       department,
       salary,
       ROUND(
           salary * 100.0 /
           SUM(salary) OVER(PARTITION BY department),
           2
       ) AS salary_percentage
FROM employees;



-- 20. Use COUNT() OVER() to show total number of employees alongside each row.

SELECT employee_name,
       department,
       COUNT(*) OVER() AS total_employees
FROM employees;



-- 21. Create a CTE to calculate total sales per employee.

WITH employee_sales AS (
    SELECT employee_id,
           SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
)
SELECT * FROM employee_sales;



-- 22. Use a CTE to find employees whose sales exceed the company average.

WITH employee_sales AS (
    SELECT employee_id,
           SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
),
avg_sales AS (
    SELECT AVG(total_sales) AS avg_total
    FROM employee_sales
)
SELECT es.*
FROM employee_sales es, avg_sales a
WHERE es.total_sales > a.avg_total;



-- 23. Create multiple CTEs to calculate customer total spending and rankings.

WITH customer_spending AS (
    SELECT customer_id,
           SUM(total_amount) AS total_spending
    FROM orders
    GROUP BY customer_id
),
customer_rank AS (
    SELECT customer_id,
           total_spending,
           RANK() OVER(ORDER BY total_spending DESC) AS rank_num
    FROM customer_spending
)
SELECT * FROM customer_rank;



-- 24. Write a recursive CTE to generate numbers from 1 to 10.

WITH RECURSIVE numbers AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1
    FROM numbers
    WHERE num < 10
)
SELECT * FROM numbers;



-- 25. Use a recursive CTE to display employee hierarchy data.

WITH RECURSIVE emp_tree AS (
    SELECT employee_id,
           employee_name,
           manager_id
    FROM employee_hierarchy
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.employee_id,
           e.employee_name,
           e.manager_id
    FROM employee_hierarchy e
    JOIN emp_tree et
    ON e.manager_id = et.employee_id
)
SELECT * FROM emp_tree;



-- 26. Create a CTE that filters orders above the average order amount.

WITH avg_order AS (
    SELECT AVG(total_amount) AS avg_amt
    FROM orders
)
SELECT *
FROM orders, avg_order
WHERE total_amount > avg_amt;



-- 27. Use a CTE and window function together to rank customers by total spending.

WITH customer_total AS (
    SELECT customer_id,
           SUM(total_amount) AS total_spending
    FROM orders
    GROUP BY customer_id
)
SELECT customer_id,
       total_spending,
       RANK() OVER(ORDER BY total_spending DESC) AS rank_num
FROM customer_total;



-- 28. Find the second-highest salary in each department.

SELECT *
FROM (
    SELECT employee_name,
           department,
           salary,
           DENSE_RANK()
           OVER(PARTITION BY department ORDER BY salary DESC) AS rnk
    FROM employees
) t
WHERE rnk = 2;



-- 29. Display the difference between each employee salary and the department maximum salary.

SELECT employee_name,
       department,
       salary,
       MAX(salary)
       OVER(PARTITION BY department) - salary AS difference
FROM employees;



-- 30. Combine CTEs and window functions to find the top-performing employee in each department based on total sales.

WITH employee_sales AS (
    SELECT e.employee_id,
           e.employee_name,
           e.department,
           SUM(o.total_amount) AS total_sales
    FROM employees e
    JOIN orders o
    ON e.employee_id = o.employee_id
    GROUP BY e.employee_id,
             e.employee_name,
             e.department
),
ranked_employees AS (
    SELECT *,
           RANK()
           OVER(PARTITION BY department ORDER BY total_sales DESC) AS rnk
    FROM employee_sales
)
SELECT *
FROM ranked_employees
WHERE rnk = 1;



-- Bonus Challenge:
-- Create a report showing monthly sales trends using:
-- CTEs, Running totals, LAG(), Percentage growth calculations.

WITH monthly_sales AS (
    SELECT DATE_TRUNC('month', order_date) AS month,
           SUM(total_amount) AS monthly_total
    FROM orders
    GROUP BY DATE_TRUNC('month', order_date)
),
sales_analysis AS (
    SELECT month,
           monthly_total,

           SUM(monthly_total)
           OVER(ORDER BY month) AS running_total,

           LAG(monthly_total)
           OVER(ORDER BY month) AS previous_month_sales
    FROM monthly_sales
)
SELECT month,
       monthly_total,
       running_total,
       previous_month_sales,

       ROUND(
           ((monthly_total - previous_month_sales)
           * 100.0 / previous_month_sales),
           2
       ) AS percentage_growth

FROM sales_analysis;
