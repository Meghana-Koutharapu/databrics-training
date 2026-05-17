
Level -1
QUESTION 1 – Salary Risk Flagging Based on Tax Shock

Table

CREATE TABLE salary_audit (

emp_id INT,

emp_name VARCHAR(50),

salary DECIMAL(10,2),

tax_percent DECIMAL(5,2),

last_revision DATE

);

Data

INSERT INTO salary_audit VALUES

(1,'karthik',75000.75,10.5,'2022-01-15'),

(2,'veena',65000.40,18.0,'2023-06-01'),

(3,'ravi',85000.90,25.0,'2020-11-20');

Question
For each employee:
· Normalize name to lowercase
· Calculate net salary after tax and round it
· Extract revision year
· Find months since revision
CASE:
o Flag Tax Shock if tax > 20 AND months > 24
o Flag Review Needed if tax between 15–20
o Else Stable


QUESTION 2 – Bonus Abuse Detection

Table

CREATE TABLE bonus_monitor (

emp_code INT,

emp_name VARCHAR(50),

base_salary DECIMAL(10,2),

bonus DECIMAL(10,2),

bonus_date DATE

);

Data

INSERT INTO bonus_monitor VALUES

(101,'Anil',70000.10,30000.00,'2025-01-10'),

(102,'Suresh',60000.55,3000.30,'2024-03-15'),

(103,'Ravi',85000.90,15000.75,'2023-12-01');

Question
For each record:
· Convert name to proper case
· Calculate bonus percentage of salary (rounded)
· Extract day name of bonus
· Find absolute salary–bonus difference
CASE:
o Suspicious if bonus > 30% AND weekend
o Normal if bonus <= 20%
o Audit


QUESTION 3 – Experience Parity Validation

Table

CREATE TABLE employee_experience (

emp_id INT,

emp_name VARCHAR(50),

joining_date DATE,

declared_experience INT,

salary DECIMAL(10,2)

);

Data

INSERT INTO employee_experience VALUES

(1,'Veena','2018-07-01',4,65000.40),

(2,'Ravi','2014-01-10',12,85000.90),

(3,'Anil','2020-09-01',3,70000.10);

Question
For each employee:
· Uppercase name
· Calculate actual experience from date
· Find difference between declared and actual experience
· Floor salary
CASE:
o Overstated if declared > actual
o Understated if declared < actual
o Matched


QUESTION 4 – Salary Digit Pattern Analysis

Table

CREATE TABLE salary_digits (

emp_id INT,

emp_name VARCHAR(50),

salary DECIMAL(10,2),

credit_date DATE

);

Data

INSERT INTO salary_digits VALUES

(1,'Karthik',75000.75,'2025-01-01'),

(2,'Veena',65000.40,'2025-01-02'),

(3,'Suresh',60000.55,'2025-01-03');

Question
For each employee:
· Extract last two characters of name
· Get day of month from credit date
· Truncate salary to integer
· Use MOD on salary
CASE:
o Pattern Match if salary MOD 10 equals day
o No Match otherwise


QUESTION 5 – Odd–Even Salary Compliance

Table

CREATE TABLE payroll_control (

emp_id INT,

emp_name VARCHAR(50),

salary DECIMAL(10,2),

payment_date DATE

);

Data

INSERT INTO payroll_control VALUES

(1,'Ravi',85000.90,'2025-01-15'),

(2,'Anil',70000.10,'2025-01-16'),

(3,'Veena',65000.40,'2025-01-17');

Question
For each employee:
· Lowercase name
· Extract weekday
· Round salary
· Apply MOD on salary
CASE:
o Violation if even salary paid on odd weekday
o Compliant otherwise


QUESTION 6 – Salary Inflation Drift

Table

CREATE TABLE inflation_watch (

emp_id INT,

emp_name VARCHAR(50),

salary DECIMAL(10,2),

last_hike DATE

);

Data

INSERT INTO inflation_watch VALUES

(1,'Karthik',75000.75,'2019-01-01'),

(2,'Veena',65000.40,'2022-01-01'),

(3,'Ravi',85000.90,'2017-01-01');

Question
For each employee:
· Proper case name
· Calculate years since hike
· Apply POWER on years
· Round salary impact
CASE:
o High Inflation Risk if years > 5
o Moderate
o Low


QUESTION 7 – Salary Sign Integrity Check

Table

CREATE TABLE salary_integrity (

emp_id INT,

emp_name VARCHAR(50),

salary DECIMAL(10,2),

record_date DATE

);

Data

INSERT INTO salary_integrity VALUES

(1,'Anil',-70000.10,'2025-01-10'),

(2,'Veena',65000.40,'2025-01-10'),

(3,'Ravi',0.00,'2025-01-10');

Question
For each employee:
· Uppercase name
· Extract year
· Apply SIGN on salary
· ABS salary
CASE:
o Negative Error
o Zero Salary
o Valid


QUESTION 8 – Name Length vs Salary Correlation

Table

CREATE TABLE name_salary (

emp_id INT,

emp_name VARCHAR(50),

salary DECIMAL(10,2),

join_date DATE

);

Data

INSERT INTO name_salary VALUES

(1,'Karthik',75000.75,'2019-03-15'),

(2,'Veena',65000.40,'2021-06-20'),

(3,'Ravi',85000.90,'2016-01-10');

Question
For each employee:
· Calculate name length
· Calculate years of service
· Round salary
· Compare name length vs years
CASE:
o Name Bias if length > years
o Neutral


QUESTION 9 – Salary Spike Detection by Month

Table

CREATE TABLE salary_monthly (

emp_id INT,

emp_name VARCHAR(50),

salary DECIMAL(10,2),

paid_date DATE

);

Data

INSERT INTO salary_monthly VALUES

(1,'Karthik',75000.75,'2025-01-31'),

(2,'Veena',65000.40,'2025-02-28'),

(3,'Ravi',85000.90,'2025-03-31');

Question
For each record:
· Extract month name
· CEIL salary
· Check last day of month
CASE:
o End Month Spike
o Regular


QUESTION 10 – Salary Digit Sum Audit

Table

CREATE TABLE digit_audit (

emp_id INT,

emp_name VARCHAR(50),

salary DECIMAL(10,2),

audit_date DATE

);

Data

INSERT INTO digit_audit VALUES

(1,'Anil',70000.10,'2025-01-01'),

(2,'Veena',65000.40,'2025-01-02');

Question
For each employee:
· Extract first character of name
· Truncate salary
· Sum digits logically
· Extract day
CASE:
o Digit Alert
o Normal


QUESTION 11 – Weekend Salary Credit Fraud Detection

Table

CREATE TABLE salary_credit_audit (

emp_id INT,

emp_name VARCHAR(50),

salary DECIMAL(10,2),

credit_date DATE,

bank_code VARCHAR(10)

);

Data

INSERT INTO salary_credit_audit VALUES

(1,'Karthik',75000.75,'2025-01-04','HDFC01'),

(2,'Veena',65000.40,'2025-01-06','ICIC02'),

(3,'Ravi',85000.90,'2025-01-05','SBIN03'),

(4,'Anil',70000.10,'2025-01-07','AXIS04'),

(5,'Suresh',60000.55,'2025-01-11','HDFC01');

Question
For each record:
· Extract bank prefix from bank_code
· Identify weekday name of credit_date
· Round salary
· Apply MOD on salary
CASE:
o Weekend Fraud if credited on Saturday/Sunday AND salary MOD 5 = 0
o Bank Review if bank is HDFC
o Else Normal


QUESTION 12 – Salary Credit Time Drift Analysis

Table

CREATE TABLE salary_time_drift (

emp_id INT,

emp_name VARCHAR(50),

salary DECIMAL(10,2),

credit_ts DATETIME

);

Data

INSERT INTO salary_time_drift VALUES

(1,'Karthik',75000.75,'2025-01-10 23:45:00'),

(2,'Veena',65000.40,'2025-01-10 09:15:00'),

(3,'Ravi',85000.90,'2025-01-11 00:10:00'),

(4,'Anil',70000.10,'2025-01-09 18:30:00'),

(5,'Suresh',60000.55,'2025-01-10 02:50:00');

Question
For each employee:
· Extract hour from credit timestamp
· Convert emp_name to lowercase
· Floor salary
· Calculate difference between salary and hour
CASE:
o Midnight Drift if hour between 0–3
o After Hours
o Business Hours


QUESTION 13 – Salary Decimal Precision Audit

Table

CREATE TABLE salary_precision (

emp_id INT,

emp_name VARCHAR(50),

salary DECIMAL(10,4),

record_date DATE

);

Data

INSERT INTO salary_precision VALUES

(1,'Karthik',75000.7567,'2025-01-01'),

(2,'Veena',65000.4044,'2025-01-02'),

(3,'Ravi',85000.9099,'2025-01-03'),

(4,'Anil',70000.1001,'2025-01-04'),

(5,'Suresh',60000.5555,'2025-01-05');

Question
For each record:
· Truncate salary to 2 decimals
· Calculate difference between rounded and truncated value
· Extract day name
· Get length of emp_name
CASE:
o Precision Loss if difference > 0.01
o Safe


QUESTION 14 – Salary Growth Power Index

Table

CREATE TABLE salary_growth (

emp_id INT,

emp_name VARCHAR(50),

base_salary DECIMAL(10,2),

growth_rate DECIMAL(5,2),

last_hike DATE

);

Data

INSERT INTO salary_growth VALUES

(1,'Karthik',75000.75,1.08,'2019-01-01'),

(2,'Veena',65000.40,1.05,'2021-01-01'),

(3,'Ravi',85000.90,1.12,'2017-01-01'),

(4,'Anil',70000.10,1.03,'2022-01-01'),

(5,'Suresh',60000.55,1.06,'2020-01-01');

Question
For each employee:
· Calculate years since last hike
· Apply POWER using growth_rate and years
· Round projected salary
· Uppercase emp_name
CASE:
o Explosive Growth if projected > 150000
o Controlled
o Stagnant


QUESTION 15 – Salary Symmetry Check

Table

CREATE TABLE salary_symmetry (

emp_id INT,

emp_name VARCHAR(50),

salary DECIMAL(10,2),

processed_date DATE

);

Data

INSERT INTO salary_symmetry VALUES

(1,'Karthik',75557.75,'2025-01-15'),

(2,'Veena',64446.40,'2025-01-16'),

(3,'Ravi',85858.90,'2025-01-17'),

(4,'Anil',70007.10,'2025-01-18'),

(5,'Suresh',60000.55,'2025-01-19');

Question
For each record:
· Remove decimals from salary
· Reverse salary digits
· Extract weekday
· Proper case emp_name
CASE:
o Symmetric Pay if reversed equals original
o Asymmetric


QUESTION 16 – Leap Year Salary Adjustment Audit

Table

CREATE TABLE leap_salary (

emp_id INT,

emp_name VARCHAR(50),

salary DECIMAL(10,2),

credit_date DATE

);

Data

INSERT INTO leap_salary VALUES

(1,'Karthik',75000.75,'2024-02-29'),

(2,'Veena',65000.40,'2025-02-28'),

(3,'Ravi',85000.90,'2020-02-29'),

(4,'Anil',70000.10,'2023-02-28'),

(5,'Suresh',60000.55,'2024-02-28');

Question
For each employee:
· Extract year
· Check leap year logic
· CEIL salary
· Calculate day of year
CASE:
o Leap Credit
o Non-Leap Credit


QUESTION 17 – Fiscal Year Boundary Salary Check

Table

CREATE TABLE fiscal_salary (

emp_id INT,

emp_name VARCHAR(50),

salary DECIMAL(10,2),

credit_date DATE

);

Data

INSERT INTO fiscal_salary VALUES

(1,'Karthik',75000.75,'2025-03-31'),

(2,'Veena',65000.40,'2025-04-01'),

(3,'Ravi',85000.90,'2024-03-30'),

(4,'Anil',70000.10,'2024-04-02'),

(5,'Suresh',60000.55,'2025-03-29');

Question
For each record:
· Determine fiscal year
· Extract month
· Format salary
· Lowercase emp_name
CASE:
o Year End Credit
o Year Start Credit
o Mid Year


QUESTION 18 – Salary Random Sampling for Audit

Table

CREATE TABLE salary_sampling (

emp_id INT,

emp_name VARCHAR(50),

salary DECIMAL(10,2),

record_date DATE

);

Data

INSERT INTO salary_sampling VALUES

(1,'Karthik',75000.75,'2025-01-01'),

(2,'Veena',65000.40,'2025-01-02'),

(3,'Ravi',85000.90,'2025-01-03'),

(4,'Anil',70000.10,'2025-01-04'),

(5,'Suresh',60000.55,'2025-01-05'),

(6,'Amit',72000.60,'2025-01-06'),

(7,'Neha',68000.80,'2025-01-07');

Question
For each record:
· Generate random value
· Round salary
· Extract day name
· Extract first character of emp_name
CASE:
o Sampled if RAND() > 0.7
o Skipped


QUESTION 19 – Salary ASCII Integrity Check

Table

CREATE TABLE salary_ascii (

emp_id INT,

emp_name VARCHAR(50),

salary DECIMAL(10,2),

join_date DATE

);

Data

INSERT INTO salary_ascii VALUES

(1,'Karthik',75000.75,'2019-03-15'),

(2,'Veena',65000.40,'2021-06-20'),

(3,'Ravi',85000.90,'2016-01-10'),

(4,'Anil',70000.10,'2020-09-01'),

(5,'Suresh',60000.55,'2022-11-25');

Question
For each employee:
· Extract ASCII value of first character
· Calculate years since joining
· Floor salary
· Compare ASCII vs years
CASE:
o Name Dominates
o Experience Dominates


QUESTION 20 – Salary vs Calendar Symmetry Logic

Table

CREATE TABLE salary_calendar (

emp_id INT,

emp_name VARCHAR(50),

salary DECIMAL(10,2),

credit_date DATE

);

Data

INSERT INTO salary_calendar VALUES

(1,'Karthik',75000.75,'2025-01-15'),

(2,'Veena',65000.40,'2025-02-14'),

(3,'Ravi',85000.90,'2025-03-31'),

(4,'Anil',70000.10,'2025-04-04'),

(5,'Suresh',60000.55,'2025-05-05');

Question
For each record:
· Extract day and month
· Extract last two digits of salary
· Uppercase emp_name
· Absolute difference between day and month
CASE:
o Calendar Match if day = month OR salary digits match
o Calendar Drift
