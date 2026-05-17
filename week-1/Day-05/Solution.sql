QUESTION 1: Employee Compensation Classification
  SELECT 
    emp_id,

    -- Name formats
    UPPER(emp_name) AS upper_name,
    LOWER(emp_name) AS lower_name,
    INITCAP(emp_name) AS proper_case_name,

    department,

    -- Total income with NULL-safe bonus
    (base_salary + COALESCE(bonus,0)) AS total_income,

    -- Rounded total income
    ROUND(base_salary + COALESCE(bonus,0)) AS rounded_income,

    -- Joining year
    EXTRACT(YEAR FROM joining_date) AS joining_year,

    -- Experience classification
    CASE
        WHEN EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM joining_date) > 7 
            THEN 'Senior'

        WHEN EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM joining_date) 
             BETWEEN 4 AND 7 
            THEN 'Mid'

        ELSE 'Junior'
    END AS employee_level

FROM employee_payments;


QUESTION 2: Order Delivery Delay Analysis

SELECT 
    order_id,
    UPPER(customer_name) AS customer_name,
    
    COALESCE(delivery_date, CURDATE()) AS delivery_date,
    
    DATEDIFF(COALESCE(delivery_date, CURDATE()), order_date) AS delivery_days,
    
    TRUNCATE(order_amount, 1) AS order_amount,
    
    CASE
        WHEN delivery_date IS NULL THEN 'Pending'
        WHEN DATEDIFF(delivery_date, order_date) = 0 THEN 'Same-day'
        WHEN DATEDIFF(delivery_date, order_date) > 3 THEN 'Delayed'
        ELSE 'On Time'
    END AS delivery_status

FROM orders_delivery;


