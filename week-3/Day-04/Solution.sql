ROW_NUMBER()
1. Assign a unique row number to all employees based on salary (highest first)
SELECT *,
       ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;

2. Assign row numbers to employees within each department based on salary descending
SELECT *,
       ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS row_num
FROM employees;

3. Assign row numbers based on employee joining date (latest first)
SELECT *,
       ROW_NUMBER() OVER (ORDER BY join_date DESC) AS row_num
FROM employees;

4. Assign row numbers within each department based on earliest joining date
SELECT *,
       ROW_NUMBER() OVER (PARTITION BY department ORDER BY join_date ASC) AS row_num
FROM employees;

5. Assign row numbers to orders based on order date
SELECT *,
       ROW_NUMBER() OVER (ORDER BY order_date ASC) AS row_num
FROM orders;

6. Assign row numbers to orders within each city based on order amount (highest first)
SELECT *,
       ROW_NUMBER() OVER (PARTITION BY city ORDER BY order_amount DESC) AS row_num
FROM orders;

7. Assign row numbers to employees based on salary (lowest first)
SELECT *,
       ROW_NUMBER() OVER (ORDER BY salary ASC) AS row_num
FROM employees;

8. Assign row numbers within department for employees based on name alphabetically
SELECT *,
       ROW_NUMBER() OVER (PARTITION BY department ORDER BY emp_name ASC) AS row_num
FROM employees;



RANK()
9. Rank all employees based on salary (highest first)
SELECT *,
       RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

10. Rank employees within each department based on salary
SELECT *,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
FROM employees;

11. Rank employees based on joining date (latest gets rank 1)
SELECT *,
       RANK() OVER (ORDER BY join_date DESC) AS join_rank
FROM employees;

12. Rank orders based on order amount (highest first)
SELECT *,
       RANK() OVER (ORDER BY order_amount DESC) AS amount_rank
FROM orders;

13. Rank orders within each city based on order amount
SELECT *,
       RANK() OVER (PARTITION BY city ORDER BY order_amount DESC) AS amount_rank
FROM orders;

14. Rank employees within department based on salary (lowest first)
SELECT *,
       RANK() OVER (PARTITION BY department ORDER BY salary ASC) AS salary_rank
FROM employees;

15. Rank employees based on name alphabetically
SELECT *,
       RANK() OVER (ORDER BY emp_name ASC) AS name_rank
FROM employees;

16. Rank orders within each city based on order date
SELECT *,
       RANK() OVER (PARTITION BY city ORDER BY order_date ASC) AS date_rank
FROM orders;



DENSE_RANK()
17. Assign dense rank to employees based on salary (highest first)
SELECT *,
       DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank_salary
FROM employees;

18. Assign dense rank within each department based on salary
SELECT *,
       DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rank_salary
FROM employees;

19. Assign dense rank to employees based on joining date
SELECT *,
       DENSE_RANK() OVER (ORDER BY join_date DESC) AS dense_join_rank
FROM employees;

20. Assign dense rank to orders based on order amount
SELECT *,
       DENSE_RANK() OVER (ORDER BY order_amount DESC) AS dense_amount_rank
FROM orders;

21. Assign dense rank within each city based on order amount
SELECT *,
       DENSE_RANK() OVER (PARTITION BY city ORDER BY order_amount DESC) AS dense_amount_rank
FROM orders;

22. Assign dense rank to employees based on salary (lowest first)
SELECT *,
       DENSE_RANK() OVER (ORDER BY salary ASC) AS dense_salary_rank
FROM employees;

23. Assign dense rank within department based on joining date
SELECT *,
       DENSE_RANK() OVER (PARTITION BY department ORDER BY join_date ASC) AS dense_join_rank
FROM employees;

24. Assign dense rank to orders based on order date
SELECT *,
       DENSE_RANK() OVER (ORDER BY order_date ASC) AS dense_date_rank
FROM orders;
