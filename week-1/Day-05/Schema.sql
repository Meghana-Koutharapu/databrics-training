
QUESTION 1: Employee Compensation Classification

Table Structure

CREATE TABLE employee_payments (

emp_id INT PRIMARY KEY,

emp_name VARCHAR(50),

department VARCHAR(30),

base_salary DECIMAL(10,2),

bonus DECIMAL(10,2),

joining_date DATE

);

Insert Data

INSERT INTO employee_payments VALUES

(1,'karthik','Data',75000.75,5000.50,'2019-03-15'),

(2,'veena','HR',65000.40,4000.25,'2021-06-20'),

(3,'ravi','Data',85000.90,6000.75,'2016-01-10'),

(4,'anil','Finance',70000.10,NULL,'2020-09-01'),

(5,'suresh','HR',60000.55,3000.30,'2022-11-25');

Question

For each employee:

· Convert emp_name to proper case ---upper /lower ---Initcap (CamelCase)

· Calculate total income = base_salary + bonus (NULL safe) +

· Round total income to nearest integer

· Extract joining year

· Use CASE to classify:

o Senior if experience > 7 years

o Mid if between 4 and 7

o Junior otherwise



QUESTION 2: Order Delivery Delay Analysis

Table Structure

CREATE TABLE orders_delivery (

order_id INT,

customer_name VARCHAR(50),

order_date DATE,

delivery_date DATE,

order_amount DECIMAL(10,2)

);

Insert Data

INSERT INTO orders_delivery VALUES

(101,'rajesh','2025-01-01','2025-01-05',12500.75),

(102,'meena','2025-01-10','2025-01-10',8400.40),

(103,'arun','2025-01-15','2025-01-20',15600.90),

(104,'pooja','2025-01-18',NULL,9200.10);

Question

For each order:

· Uppercase customer name

· Calculate delivery days using date difference

· Replace NULL delivery date with today

· Truncate order amount to 1 decimal

· Use CASE:

o Same-day

o Delayed (>3 days)

o Pending

  
QUESTION 3: Customer Spending Pattern

Table Structure

CREATE TABLE customer_spending (

cust_id INT,

cust_name VARCHAR(50),

city VARCHAR(30),

purchase_amount DECIMAL(10,2),

purchase_date DATE

);

Insert Data

INSERT INTO customer_spending VALUES

(1,'amit','mumbai',12000.75,'2024-12-01'),

(2,'neha','delhi',8500.40,'2024-12-15'),

(3,'rohit','mumbai',15500.90,'2024-11-20'),

(4,'kavya','chennai',6000.10,'2024-10-05');

Question

Display:

· Customer name with first letter capitalized

· Month name of purchase

· Rounded purchase amount

· Absolute value of purchase (defensive logic)

· CASE:

o High spender > 15000

o Medium 8000–15000

o Low otherwise


QUESTION 4: Subscription Validity Check

Table Structure

CREATE TABLE subscriptions (

user_id INT,

user_email VARCHAR(100),

start_date DATE,

end_date DATE,

subscription_fee DECIMAL(10,2)

);

Insert Data

INSERT INTO subscriptions VALUES

(1,'karthik@gmail.com','2024-01-01','2025-01-01',12000.50),

(2,'veena@yahoo.com','2024-06-15','2024-12-15',8500.75),

(3,'ravi@hotmail.com','2023-03-01','2024-03-01',15000.90);

Question

For each user:

· Extract email domain

· Calculate subscription duration in months

· Format fee with commas

· Find remaining days from today

· CASE:

o Active

o Expiring Soon (≤30 days)

o Expired


QUESTION 5: Loan EMI Risk Categorization

Table Structure

CREATE TABLE loan_details (

loan_id INT,

customer_name VARCHAR(50),

loan_amount DECIMAL(12,2),

interest_rate DECIMAL(5,2),

loan_start DATE

);

Insert Data

INSERT INTO loan_details VALUES

(201,'suresh',500000.75,8.5,'2022-01-10'),

(202,'mahesh',750000.40,9.2,'2021-05-20'),

(203,'anita',300000.90,7.8,'2023-07-01');

Question

Compute:

· Monthly interest using power function

· Years since loan start

· Round EMI

· Uppercase customer name

· CASE:

o High Risk if interest > 9

o Medium Risk

o Low Risk


QUESTION 6: Employee Attendance Evaluation

Table Structure

CREATE TABLE attendance (

emp_id INT,

emp_name VARCHAR(50),

total_days INT,

present_days INT,

record_date DATE

);

Insert Data

INSERT INTO attendance VALUES

(1,'karthik',30,28,'2025-01-31'),

(2,'veena',30,22,'2025-01-31'),

(3,'ravi',30,18,'2025-01-31');

Question

Calculate:

· Attendance percentage (rounded)

· Month name

· Difference between total and present days

· Lowercase employee name

· CASE:

o Excellent ≥90%

o Average 75–89%

o Poor otherwise


QUESTION 7: Product Discount Validation

Table Structure

CREATE TABLE product_sales (

product_id INT,

product_name VARCHAR(50),

mrp DECIMAL(10,2),

selling_price DECIMAL(10,2),

sale_date DATE

);

Insert Data

INSERT INTO product_sales VALUES

(1,'Laptop',75000.75,68000.50,'2025-01-10'),

(2,'Mobile',35000.40,33000.25,'2025-01-12'),

(3,'Tablet',25000.90,26000.75,'2025-01-15');

Question

Derive:

· Discount amount (absolute)

· Discount percentage

· Day name of sale

· Proper case product name

· CASE:

o Valid Discount

o Overpriced

o No Discount


QUESTION 8: Insurance Policy Aging

Table Structure

CREATE TABLE insurance_policies (

policy_id INT,

holder_name VARCHAR(50),

premium_amount DECIMAL(10,2),

policy_start DATE,

policy_end DATE

);

Insert Data

INSERT INTO insurance_policies VALUES

(301,'arjun',12000.50,'2023-01-01','2026-01-01'),

(302,'megha',8500.75,'2022-06-15','2025-06-15'),

(303,'vinod',15000.90,'2021-03-01','2024-03-01');

Question

Show:

· Policy duration in years

· Remaining days

· Rounded premium

· Uppercase holder name

· CASE:

o Long Term

o Mid Term

o Expired


QUESTION 9: Salary Increment Simulation

Table Structure

CREATE TABLE salary_revision (

emp_id INT,

emp_name VARCHAR(50),

current_salary DECIMAL(10,2),

rating INT,

last_hike DATE

);

Insert Data

INSERT INTO salary_revision VALUES

(1,'karthik',75000.75,5,'2023-01-01'),

(2,'veena',65000.40,4,'2024-01-01'),

(3,'ravi',85000.90,3,'2022-01-01');

Question

Calculate:

· Years since last hike

· Increment using rating logic

· New salary (rounded)

· Lowercase name

· CASE:

o High Increment

o Moderate

o No Increment


QUESTION 10: Customer Account Status Evaluation

Table Structure

CREATE TABLE bank_accounts (

account_id INT,

customer_name VARCHAR(50),

balance DECIMAL(12,2),

last_transaction DATE,

branch VARCHAR(30)

);

Insert Data

INSERT INTO bank_accounts VALUES

(501,'ramesh',125000.75,'2024-12-20','hyderabad'),

(502,'sita',8500.40,'2023-06-15','delhi'),

(503,'manoj',-2500.90,'2025-01-05','mumbai');

Question

Determine:

· Absolute balance

· Days since last transaction

· Proper case branch name

· Sign of balance

· CASE:

o Active

o Dormant

o Overdrawn
