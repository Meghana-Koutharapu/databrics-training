LEVEL-O1
QUESTION 1 – Salary Risk Flagging Based on Tax Shock
SELECT 
    emp_id,
    LOWER(emp_name) AS emp_name,
    ROUND(salary - (salary * tax_percent / 100), 0) AS net_salary,
    YEAR(last_revision) AS revision_year,
    TIMESTAMPDIFF(MONTH, last_revision, CURDATE()) AS months_since_revision,
    CASE
        WHEN tax_percent > 20 
             AND TIMESTAMPDIFF(MONTH, last_revision, CURDATE()) > 24 
        THEN 'Tax Shock'
        WHEN tax_percent BETWEEN 15 AND 20 
        THEN 'Review Needed'
        ELSE 'Stable'
    END AS status
FROM salary_audit;


QUESTION 2 – Bonus Abuse Detection
SELECT
    emp_code,
    CONCAT(UCASE(LEFT(emp_name,1)),LCASE(SUBSTRING(emp_name,2))) AS emp_name,
    ROUND((bonus/base_salary)*100,2) AS bonus_percentage,
    DAYNAME(bonus_date) AS bonus_day,
    ABS(base_salary - bonus) AS salary_bonus_difference,
    CASE
        WHEN (bonus/base_salary)*100 > 30
             AND DAYOFWEEK(bonus_date) IN (1,7)
        THEN 'Suspicious'
        WHEN (bonus/base_salary)*100 <= 20
        THEN 'Normal'
        ELSE 'Audit'
    END AS status
FROM bonus_monitor;


QUESTION 3 – Experience Parity Validation
SELECT
    emp_id,
    UPPER(emp_name) AS emp_name,
    TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) AS actual_experience,
    ABS(declared_experience - TIMESTAMPDIFF(YEAR, joining_date, CURDATE())) AS experience_difference,
    FLOOR(salary) AS floor_salary,
    CASE
        WHEN declared_experience > TIMESTAMPDIFF(YEAR, joining_date, CURDATE())
        THEN 'Overstated'
        WHEN declared_experience < TIMESTAMPDIFF(YEAR, joining_date, CURDATE())
        THEN 'Understated'
        ELSE 'Matched'
    END AS status
FROM employee_experience;


QUESTION 4 – Salary Digit Pattern Analysis
SELECT
    emp_id,
    RIGHT(emp_name,2) AS last_two_chars,
    DAY(credit_date) AS credit_day,
    TRUNCATE(salary,0) AS truncated_salary,
    MOD(TRUNCATE(salary,0),10) AS salary_mod,
    CASE
        WHEN MOD(TRUNCATE(salary,0),10) = DAY(credit_date)
        THEN 'Pattern Match'
        ELSE 'No Match'
    END AS status
FROM salary_digits;


QUESTION 5 – Odd–Even Salary Compliance
SELECT
    emp_id,
    LOWER(emp_name) AS emp_name,
    DAYNAME(payment_date) AS weekday_name,
    ROUND(salary,0) AS rounded_salary,
    MOD(ROUND(salary,0),2) AS salary_mod,
    CASE
        WHEN MOD(ROUND(salary,0),2)=0
             AND DAY(payment_date)%2<>0
        THEN 'Violation'
        ELSE 'Compliant'
    END AS status
FROM payroll_control;


QUESTION 6 – Salary Inflation Drift
SELECT
    emp_id,
    CONCAT(UCASE(LEFT(emp_name,1)),LCASE(SUBSTRING(emp_name,2))) AS emp_name,
    TIMESTAMPDIFF(YEAR,last_hike,CURDATE()) AS years_since_hike,
    POWER(TIMESTAMPDIFF(YEAR,last_hike,CURDATE()),2) AS power_years,
    ROUND(salary * POWER(1.05, TIMESTAMPDIFF(YEAR,last_hike,CURDATE())),2) AS salary_impact,
    CASE
        WHEN TIMESTAMPDIFF(YEAR,last_hike,CURDATE()) > 5
        THEN 'High Inflation Risk'
        WHEN TIMESTAMPDIFF(YEAR,last_hike,CURDATE()) BETWEEN 3 AND 5
        THEN 'Moderate'
        ELSE 'Low'
    END AS status
FROM inflation_watch;


QUESTION 7 – Salary Sign Integrity Check
SELECT
    emp_id,
    UPPER(emp_name) AS emp_name,
    YEAR(record_date) AS record_year,
    SIGN(salary) AS salary_sign,
    ABS(salary) AS abs_salary,
    CASE
        WHEN SIGN(salary) = -1
        THEN 'Negative Error'
        WHEN SIGN(salary) = 0
        THEN 'Zero Salary'
        ELSE 'Valid'
    END AS status
FROM salary_integrity;


QUESTION 8 – Name Length vs Salary Correlation
SELECT
    emp_id,
    LENGTH(emp_name) AS name_length,
    TIMESTAMPDIFF(YEAR,join_date,CURDATE()) AS years_of_service,
    ROUND(salary,0) AS rounded_salary,
    CASE
        WHEN LENGTH(emp_name) > TIMESTAMPDIFF(YEAR,join_date,CURDATE())
        THEN 'Name Bias'
        ELSE 'Neutral'
    END AS status
FROM name_salary;


QUESTION 9 – Salary Spike Detection by Month
SELECT
    emp_id,
    MONTHNAME(paid_date) AS month_name,
    CEIL(salary) AS ceil_salary,
    LAST_DAY(paid_date) AS last_day_of_month,
    CASE
        WHEN paid_date = LAST_DAY(paid_date)
        THEN 'End Month Spike'
        ELSE 'Regular'
    END AS status
FROM salary_monthly;


QUESTION 10 – Salary Digit Sum Audit
SELECT
    emp_id,
    LEFT(emp_name,1) AS first_character,
    TRUNCATE(salary,0) AS truncated_salary,
    (
        FLOOR(TRUNCATE(salary,0)/10000) +
        FLOOR((TRUNCATE(salary,0)%10000)/1000) +
        FLOOR((TRUNCATE(salary,0)%1000)/100) +
        FLOOR((TRUNCATE(salary,0)%100)/10) +
        (TRUNCATE(salary,0)%10)
    ) AS digit_sum,
    DAY(audit_date) AS audit_day,
    CASE
        WHEN (
            FLOOR(TRUNCATE(salary,0)/10000) +
            FLOOR((TRUNCATE(salary,0)%10000)/1000) +
            FLOOR((TRUNCATE(salary,0)%1000)/100) +
            FLOOR((TRUNCATE(salary,0)%100)/10) +
            (TRUNCATE(salary,0)%10)
        ) > 20
        THEN 'Digit Alert'
        ELSE 'Normal'
    END AS status
FROM digit_audit;


QUESTION 11 – Weekend Salary Credit Fraud Detection
SELECT
    emp_id,
    LEFT(bank_code,4) AS bank_prefix,
    DAYNAME(credit_date) AS weekday_name,
    ROUND(salary,0) AS rounded_salary,
    MOD(ROUND(salary,0),5) AS salary_mod,
    CASE
        WHEN DAYOFWEEK(credit_date) IN (1,7)
             AND MOD(ROUND(salary,0),5)=0
        THEN 'Weekend Fraud'
        WHEN LEFT(bank_code,4)='HDFC'
        THEN 'Bank Review'
        ELSE 'Normal'
    END AS status
FROM salary_credit_audit;


QUESTION 12 – Salary Credit Time Drift Analysis
SELECT
    emp_id,
    HOUR(credit_ts) AS credit_hour,
    LOWER(emp_name) AS emp_name,
    FLOOR(salary) AS floor_salary,
    ABS(FLOOR(salary) - HOUR(credit_ts)) AS salary_hour_difference,
    CASE
        WHEN HOUR(credit_ts) BETWEEN 0 AND 3
        THEN 'Midnight Drift'
        WHEN HOUR(credit_ts) > 18
        THEN 'After Hours'
        ELSE 'Business Hours'
    END AS status
FROM salary_time_drift;


QUESTION 13 – Salary Decimal Precision Audit
SELECT
    emp_id,
    TRUNCATE(salary,2) AS truncated_salary,
    ABS(ROUND(salary,2) - TRUNCATE(salary,2)) AS precision_difference,
    DAYNAME(record_date) AS day_name,
    LENGTH(emp_name) AS emp_name_length,
    CASE
        WHEN ABS(ROUND(salary,2) - TRUNCATE(salary,2)) > 0.01
        THEN 'Precision Loss'
        ELSE 'Safe'
    END AS status
FROM salary_precision;


QUESTION 14 – Salary Growth Power Index
SELECT
    emp_id,
    TIMESTAMPDIFF(YEAR,last_hike,CURDATE()) AS years_since_hike,
    POWER(growth_rate,TIMESTAMPDIFF(YEAR,last_hike,CURDATE())) AS growth_power,
    ROUND(base_salary * POWER(growth_rate,TIMESTAMPDIFF(YEAR,last_hike,CURDATE())),2) AS projected_salary,
    UPPER(emp_name) AS emp_name,
    CASE
        WHEN ROUND(base_salary * POWER(growth_rate,TIMESTAMPDIFF(YEAR,last_hike,CURDATE())),2) > 150000
        THEN 'Explosive Growth'
        WHEN ROUND(base_salary * POWER(growth_rate,TIMESTAMPDIFF(YEAR,last_hike,CURDATE())),2) BETWEEN 100000 AND 150000
        THEN 'Controlled'
        ELSE 'Stagnant'
    END AS status
FROM salary_growth;


QUESTION 15 – Salary Symmetry Check
SELECT
    emp_id,
    REPLACE(TRUNCATE(salary,0),'.','') AS salary_without_decimals,
    REVERSE(REPLACE(TRUNCATE(salary,0),'.','')) AS reversed_salary,
    DAYNAME(processed_date) AS weekday_name,
    CONCAT(UCASE(LEFT(emp_name,1)),LCASE(SUBSTRING(emp_name,2))) AS emp_name,
    CASE
        WHEN REPLACE(TRUNCATE(salary,0),'.','') =
             REVERSE(REPLACE(TRUNCATE(salary,0),'.',''))
        THEN 'Symmetric Pay'
        ELSE 'Asymmetric'
    END AS status
FROM salary_symmetry;


QUESTION 16 – Leap Year Salary Adjustment Audit
SELECT
    emp_id,
    YEAR(credit_date) AS credit_year,
    CASE
        WHEN (YEAR(credit_date)%4=0 AND YEAR(credit_date)%100<>0)
              OR YEAR(credit_date)%400=0
        THEN 'Leap Year'
        ELSE 'Non Leap Year'
    END AS leap_logic,
    CEIL(salary) AS ceil_salary,
    DAYOFYEAR(credit_date) AS day_of_year,
    CASE
        WHEN MONTH(credit_date)=2 AND DAY(credit_date)=29
        THEN 'Leap Credit'
        ELSE 'Non-Leap Credit'
    END AS status
FROM leap_salary;


QUESTION 17 – Fiscal Year Boundary Salary Check
SELECT
    emp_id,
    CASE
        WHEN MONTH(credit_date) >= 4
        THEN CONCAT(YEAR(credit_date),'-',YEAR(credit_date)+1)
        ELSE CONCAT(YEAR(credit_date)-1,'-',YEAR(credit_date))
    END AS fiscal_year,
    MONTHNAME(credit_date) AS month_name,
    FORMAT(salary,2) AS formatted_salary,
    LOWER(emp_name) AS emp_name,
    CASE
        WHEN MONTH(credit_date)=3
        THEN 'Year End Credit'
        WHEN MONTH(credit_date)=4
        THEN 'Year Start Credit'
        ELSE 'Mid Year'
    END AS status
FROM fiscal_salary;


QUESTION 18 – Salary Random Sampling for Audit
SELECT
    emp_id,
    RAND() AS random_value,
    ROUND(salary,0) AS rounded_salary,
    DAYNAME(record_date) AS day_name,
    LEFT(emp_name,1) AS first_character,
    CASE
        WHEN RAND() > 0.7
        THEN 'Sampled'
        ELSE 'Skipped'
    END AS status
FROM salary_sampling;


QUESTION 19 – Salary ASCII Integrity Check
SELECT
    emp_id,
    ASCII(LEFT(emp_name,1)) AS ascii_value,
    TIMESTAMPDIFF(YEAR,join_date,CURDATE()) AS years_since_joining,
    FLOOR(salary) AS floor_salary,
    CASE
        WHEN ASCII(LEFT(emp_name,1)) >
             TIMESTAMPDIFF(YEAR,join_date,CURDATE())
        THEN 'Name Dominates'
        ELSE 'Experience Dominates'
    END AS status
FROM salary_ascii;


QUESTION 20 – Salary vs Calendar Symmetry Logic
SELECT
    emp_id,
    DAY(credit_date) AS day_value,
    MONTH(credit_date) AS month_value,
    RIGHT(TRUNCATE(salary,0),2) AS last_two_salary_digits,
    UPPER(emp_name) AS emp_name,
    ABS(DAY(credit_date)-MONTH(credit_date)) AS day_month_difference,
    CASE
        WHEN DAY(credit_date)=MONTH(credit_date)
             OR RIGHT(TRUNCATE(salary,0),2)=LPAD(MONTH(credit_date),2,'0')
        THEN 'Calendar Match'
        ELSE 'Calendar Drift'
    END AS status
FROM salary_calendar;


LEVEL-02
QUESTION 1 – Employee Login Discipline & Performance Classification
SELECT
    emp_id,
    CONCAT(UCASE(LEFT(emp_name,1)),
           LCASE(SUBSTRING(emp_name,2))) AS emp_name,

    CASE
        WHEN DAYOFWEEK(login_time) IN (1,7)
        THEN 'Weekend'
        ELSE 'Weekday'
    END AS login_day_type,

    ROUND(
        TIMESTAMPDIFF(MINUTE, login_time, logout_time) / 60,
        2
    ) AS working_hours,

    CASE
        WHEN DAYOFWEEK(login_time) NOT IN (1,7)
             AND TIMESTAMPDIFF(MINUTE, login_time, logout_time)/60 >= 8
        THEN 'Good Performer'

        WHEN DAYOFWEEK(login_time) NOT IN (1,7)
             AND TIMESTAMPDIFF(MINUTE, login_time, logout_time)/60 < 6
        THEN 'Bad Performer'

        ELSE 'Weekend Login'
    END AS performance_status

FROM employee_login;



QUESTION 2 – Past 7 Days Attendance & Productivity Check
SELECT
    emp_id,
    UPPER(emp_name) AS emp_name,

    CASE
        WHEN login_date >= CURDATE() - INTERVAL 7 DAY
        THEN 'Within Last 7 Days'
        ELSE 'Older Record'
    END AS attendance_status,

    CASE
        WHEN DAYOFWEEK(login_date) IN (1,7)
        THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,

    TIMEDIFF(logout_time, login_time) AS working_hours,

    CASE
        WHEN login_date >= CURDATE() - INTERVAL 7 DAY
             AND TIMESTAMPDIFF(HOUR,
                    CONCAT(login_date,' ',login_time),
                    CONCAT(login_date,' ',logout_time)) >= 8
        THEN 'Active & Productive'

        WHEN login_date >= CURDATE() - INTERVAL 7 DAY
             AND TIMESTAMPDIFF(HOUR,
                    CONCAT(login_date,' ',login_time),
                    CONCAT(login_date,' ',logout_time)) < 8
        THEN 'Active but Low Hours'

        ELSE 'Absent from Last 7 Days'
    END AS productivity_status

FROM attendance_log;



QUESTION 3 – Weekend Work Abuse Detection
SELECT
    emp_id,
    DAYNAME(work_date) AS day_name,
    LOWER(emp_name) AS emp_name,

    ROUND(
        TIMESTAMPDIFF(MINUTE,
            CONCAT(work_date,' ',login_time),
            CONCAT(work_date,' ',logout_time)
        ) / 60,
        2
    ) AS working_hours,

    CEIL(
        TIMESTAMPDIFF(MINUTE,
            CONCAT(work_date,' ',login_time),
            CONCAT(work_date,' ',logout_time)
        ) / 60
    ) AS ceil_hours,

    CASE
        WHEN DAYOFWEEK(work_date) IN (1,7)
             AND TIMESTAMPDIFF(MINUTE,
                    CONCAT(work_date,' ',login_time),
                    CONCAT(work_date,' ',logout_time)
                 ) / 60 >= 8
        THEN 'Weekend Overtime'

        WHEN DAYOFWEEK(work_date) IN (1,7)
             AND TIMESTAMPDIFF(MINUTE,
                    CONCAT(work_date,' ',login_time),
                    CONCAT(work_date,' ',logout_time)
                 ) / 60 < 4
        THEN 'Suspicious Login'

        ELSE 'Normal Working Day'
    END AS work_status

FROM weekend_monitor;



QUESTION 4 – Login Time Deviation & Discipline Score
SELECT
    emp_id,

    HOUR(login_datetime) AS login_hour,

    TIMESTAMPDIFF(MINUTE,
        login_datetime,
        logout_datetime
    ) / 60 AS total_working_hours,

    TRUNCATE(
        TIMESTAMPDIFF(MINUTE,
            login_datetime,
            logout_datetime
        ) / 60,
        1
    ) AS truncated_hours,

    DAYNAME(login_datetime) AS weekday_name,

    CASE
        WHEN DAYOFWEEK(login_datetime) NOT IN (1,7)
             AND HOUR(login_datetime) < 9
             AND TIMESTAMPDIFF(MINUTE,
                    login_datetime,
                    logout_datetime
                 ) / 60 >= 8
        THEN 'Disciplined'

        WHEN DAYOFWEEK(login_datetime) NOT IN (1,7)
             AND HOUR(login_datetime) > 10
        THEN 'Late Comer'

        ELSE 'Poor Discipline'
    END AS discipline_status

FROM login_discipline;



QUESTION 5 – Absenteeism vs Performance Correlation
SELECT
    emp_id,
    emp_name,

    CASE
        WHEN work_date >= CURDATE() - INTERVAL 7 DAY
        THEN 'Recent Record'
        ELSE 'Old Record'
    END AS record_status,

    CASE
        WHEN DAYOFWEEK(work_date) IN (1,7)
        THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,

    ROUND(
        TIMESTAMPDIFF(MINUTE,
            CONCAT(work_date,' ',login_time),
            CONCAT(work_date,' ',logout_time)
        ) / 60,
        2
    ) AS total_hours,

    FLOOR(
        TIMESTAMPDIFF(MINUTE,
            CONCAT(work_date,' ',login_time),
            CONCAT(work_date,' ',logout_time)
        ) / 60
    ) AS floor_hours,

    CASE
        WHEN work_date >= CURDATE() - INTERVAL 7 DAY
             AND DAYOFWEEK(work_date) NOT IN (1,7)
             AND TIMESTAMPDIFF(MINUTE,
                    CONCAT(work_date,' ',login_time),
                    CONCAT(work_date,' ',logout_time)
                 ) / 60 >= 8
        THEN 'Consistent Performer'

        WHEN TIMESTAMPDIFF(MINUTE,
                CONCAT(work_date,' ',login_time),
                CONCAT(work_date,' ',logout_time)
             ) / 60 < 6
        THEN 'Irregular Performer'

        ELSE 'Absent / Old Record'
    END AS performance_status

FROM performance_tracker;
