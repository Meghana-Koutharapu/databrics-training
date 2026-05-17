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


QUESTION 3: Customer Spending Pattern

SELECT 
    CONCAT(
        UPPER(LEFT(cust_name,1)),
        LOWER(SUBSTRING(cust_name,2))
    ) AS customer_name,

    MONTHNAME(purchase_date) AS purchase_month,

    ROUND(purchase_amount) AS rounded_purchase_amount,

    ABS(purchase_amount) AS absolute_purchase_amount,

    CASE
        WHEN purchase_amount > 15000 THEN 'High Spender'
        WHEN purchase_amount BETWEEN 8000 AND 15000 THEN 'Medium Spender'
        ELSE 'Low Spender'
    END AS spending_category

FROM customer_spending;


-- QUESTION 4: Subscription Validity Check

SELECT 
    user_id,
    user_email,

    -- Extract email domain
    SUBSTRING_INDEX(user_email, '@', -1) AS email_domain,

    -- Calculate subscription duration in months
    TIMESTAMPDIFF(MONTH, start_date, end_date) AS subscription_duration_months,

    -- Format fee with commas
    FORMAT(subscription_fee, 2) AS formatted_fee,

    -- Find remaining days from today
    DATEDIFF(end_date, CURDATE()) AS remaining_days,

    -- Subscription status
    CASE
        WHEN end_date < CURDATE() THEN 'Expired'
        WHEN DATEDIFF(end_date, CURDATE()) <= 30 THEN 'Expiring Soon'
        ELSE 'Active'
    END AS subscription_status

FROM subscriptions;


QUESTION 5: Loan EMI Risk Categorization
SELECT 
    loan_id,
    
    UPPER(customer_name) AS customer_name,
    
    loan_amount,
    
    interest_rate,
    
    loan_start,
    
    TIMESTAMPDIFF(YEAR, loan_start, CURDATE()) AS years_since_loan_start,
    
    ROUND(
        (
            loan_amount * 
            (interest_rate / 12 / 100) * 
            POWER((1 + (interest_rate / 12 / 100)), 12 * 5)
        ) /
        (
            POWER((1 + (interest_rate / 12 / 100)), 12 * 5) - 1
        ),
        2
    ) AS emi,
    
    ROUND(
        loan_amount * POWER((1 + interest_rate / 100), 1/12.0) - loan_amount,
        2
    ) AS monthly_interest,
    
    CASE
        WHEN interest_rate > 9 THEN 'High Risk'
        WHEN interest_rate BETWEEN 8 AND 9 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_category

FROM loan_details;


QUESTION 6: Employee Attendance Evaluation
SELECT 
    emp_id,
    LOWER(emp_name) AS employee_name,
    total_days,
    present_days,
    
    -- Attendance Percentage
    ROUND((present_days * 100.0) / total_days, 2) AS attendance_percentage,
    
    -- Month Name
    MONTHNAME(record_date) AS month_name,
    
    -- Difference between total and present days
    (total_days - present_days) AS absent_days,
    
    -- Attendance Status
    CASE
        WHEN (present_days * 100.0) / total_days >= 90 THEN 'Excellent'
        WHEN (present_days * 100.0) / total_days BETWEEN 75 AND 89.99 THEN 'Average'
        ELSE 'Poor'
    END AS attendance_status

FROM attendance;


QUESTION 7: Product Discount Validation
SELECT 
    product_id,

    CONCAT(
        UPPER(LEFT(product_name,1)),
        LOWER(SUBSTRING(product_name,2))
    ) AS proper_product_name,

    mrp,

    selling_price,

    ROUND(mrp - selling_price, 2) AS discount_amount,

    ROUND(((mrp - selling_price) / mrp) * 100, 2) AS discount_percentage,

    DAYNAME(sale_date) AS sale_day,

    CASE
        WHEN selling_price < mrp THEN 'Valid Discount'
        WHEN selling_price > mrp THEN 'Overpriced'
        ELSE 'No Discount'
    END AS discount_status

FROM product_sales


