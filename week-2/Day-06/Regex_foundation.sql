
REGEX FOUNDATION (From Basics)

1. How to extract digits
Example input
123ABc
Regex
[0-9]
Explanation
 [0-9] matches any single digit from 0 to 9
 It does not match alphabets or special characters

2. How to extract alphabets
Example input
123ABc
Regex
[A-Za-z]
Explanation
 [A-Z] → only uppercase letters
 [a-z] → only lowercase letters
 [A-Za-z] → both uppercase and lowercase letters

3. ^ (start of string)
Explanation
 ^ checks whether the pattern exists at the beginning of the string
 If the string does not start with the pattern, the result is empty
Regex
^[0-9]
Examples
 123abc → 1
 abc123 → no output
This means the string must start with a digit.

4.$ (end of string)
Explanation
 $ checks whether the pattern exists at the end of the string
 If the string does not end with the pattern, the result is empty
Regex
[0-9]$
Examples
 123abc → no output
 abc123 → 3
This means the string must end with a digit.

5. Extracting exact number of characters using { }
 Extract exactly 2 digits
Regex
[0-9]{2}
Input
12345678abc
Output
12

Extract exactly 2 alphabets
Regex
[a-zA-Z]{2}
Input
abcdefghi123
Output
ab
Note
{n} means exactly n characters.

6. + (one or more characters)
Explanation
 + is a reserved character in regex
 It means one or more continuous matches

Digits example
Regex
[0-9]+
 123abc → 123
 abc123 → 123
 Alphabets example
Regex
[a-zA-Z]+
 abc123 → abc

Important point
 + does not extract a single character
 It extracts all continuous matching characters

7. Principle of continuity
Explanation
 Regex always matches continuous characters only
 It stops when the pattern breaks
 Example 1
Input
123abc567
Regex
[0-9]+
Output
123
It does not return 123567 because the digits are not continuous.

Example 2
Input
abc123cde
Regex
[a-zA-Z]+
Output
abc

7. (a) Extract everything (digits + alphabets)
Regex
[0-9a-zA-Z]+
Input
123abc567
Output
123abc567
(b) Extract digits from the middle
Regex
[0-9]+
Input
abc123gef
Output
123

8. Extracting data from the middle (Email example)
Input
karthik@gmail.com
 Extract domain part
Regex
@[a-zA-Z.]+
Output
@gmail.com
 Extract top-level domain
Regex
\.[a-zA-Z]+$
Output
.com

9. Reserved characters in regex
Some characters have special meaning and must be escaped using \.
Common reserved characters:
 +
 .
 ^
 $

Phone number example
Input
+91-9989454737
Regex
\+91-[0-9]{10}

10. Removing unwanted characters using REPLACE in MySQL
If @ appears in the output and you want to remove it:
REPLACE(
REGEXP_SUBSTR(email, '@[a-zA-Z.]+'),
'@',
''
)
Output
gmail.com

11. Email – Regex, DQ and Data Validation
When working with emails, we usually do two things:
 Data Quality (DQ) check
 Data Validation (whether the email format is correct)

Valid email examples
karthik@gmail.com
karthik44@gmail.com
karthik.kumar@gmail.com
karthik_kumar44@gmail.com
karthik-kumar44@gmail.com
fardeen@st2.ai
karthik@sb2.com
vinay@infosys.com

Invalid / unwanted part example
@gmail.com
Here, username is missing.
We want only:
gmail.com

Email structure (very important)
An email has three logical parts:
username @ domain . extension
Example:
karthik.kumar44@gmail.com
A) Before @ (username part)
Allowed characters:
  a–z
  A–Z
  0–9
  dot (.)
  underscore (_)
  hyphen (-)
So valid usernames are:
karthik
karthik44
karthik.kumar
karthik_kumar44
karthik-kumar44
Regex part:
[a-zA-Z0-9._-]+

B) After @ (domain name)
Allowed characters:
 a–z
 A–Z
 0–9
Examples:
gmail
infosys
sb2
st2
Regex part:
[a-zA-Z0-9]+
C) After . (domain extension)
Common extensions:
.com
.org
.ai
Length rule:
 Usually 2 or 3 characters
Examples:
com
org
ai
Regex part:
[a-zA-Z]{2,3}

Final combined email validation regex
Putting all parts together:
[a-zA-Z0-9._-]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,3}
