
-- Q1: Extract numeric characters at the beginning of mixed_value
SELECT mixed_value,
REGEXP_SUBSTR(mixed_value,'^[0-9]+') AS beginning_numbers
FROM regex_practice;


-- Q2: Extract numeric characters at the end of mixed_value
SELECT mixed_value,
REGEXP_SUBSTR(mixed_value,'[0-9]+$') AS ending_numbers
FROM regex_practice;


-- Q3: Extract only the first single character
SELECT mixed_value,
REGEXP_SUBSTR(mixed_value,'^.') AS first_character
FROM regex_practice;


-- Q4: Extract only the last single character
SELECT mixed_value,
REGEXP_SUBSTR(mixed_value,'.$') AS last_character
FROM regex_practice;


-- Q5: Extract exactly two consecutive numeric characters anywhere
SELECT mixed_value,
REGEXP_SUBSTR(mixed_value,'[0-9]{2}') AS two_digits
FROM regex_practice;


-- Q6: Extract exactly one numeric character anywhere
SELECT mixed_value,
REGEXP_SUBSTR(mixed_value,'[0-9]') AS one_digit
FROM regex_practice;


-- Q7: Extract country code from phone number
SELECT phone,
REGEXP_SUBSTR(phone,'[0-9]+') AS country_code
FROM regex_practice;


-- Q8: Extract numeric portion present between alphabetic characters
SELECT mixed_value,
REGEXP_SUBSTR(mixed_value,'[0-9]+') AS middle_numbers
FROM regex_practice;


-- Q9: Extract text before @ symbol
SELECT email,
REGEXP_SUBSTR(email,'^[^@]+') AS username
FROM regex_practice;


-- Q10: Extract text after @ symbol including domain
SELECT email,
REGEXP_SUBSTR(email,'@(.+)$') AS after_at
FROM regex_practice;


-- Q11: Extract only domain name without @
SELECT email,
REGEXP_SUBSTR(email,'[^@]+$') AS domain_name
FROM regex_practice;


-- Q12: Extract text after the last dot
SELECT email,
REGEXP_SUBSTR(email,'[^.]+$') AS extension
FROM regex_practice;


-- Q13: Extract continuous alphabetic characters
SELECT mixed_value,
REGEXP_SUBSTR(mixed_value,'[A-Za-z]+') AS alphabets
FROM regex_practice;


-- Q14: Extract continuous numeric characters
SELECT mixed_value,
REGEXP_SUBSTR(mixed_value,'[0-9]+') AS numbers
FROM regex_practice;


-- Q15: Extract first three characters from full_text
SELECT full_text,
REGEXP_SUBSTR(full_text,'^...') AS first_three
FROM regex_practice;


-- Q16: Extract last two characters from full_text
SELECT full_text,
REGEXP_SUBSTR(full_text,'..$') AS last_two
FROM regex_practice;


-- Q17: Extract employee number between prefix and first underscore
SELECT full_text,
REGEXP_SUBSTR(full_text,'[0-9]+') AS employee_number
FROM regex_practice;


-- Q18: Extract country code at the end of full_text
SELECT full_text,
REGEXP_SUBSTR(full_text,'[A-Z0-9]+$') AS ending_code
FROM regex_practice;


-- Q19: Extract alphabetic text between two underscores
SELECT full_text,
REGEXP_SUBSTR(full_text,'_[A-Z]+_') AS middle_text
FROM regex_practice;


-- Q20: Extract digits immediately after plus sign in phone
SELECT phone,
REGEXP_SUBSTR(phone,'(?<=\\+)[0-9]+') AS plus_country_code
FROM regex_practice;
