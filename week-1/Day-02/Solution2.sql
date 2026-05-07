 Select employees whose names start with 'J'
       -> SELECT * FROM Employee
          WHERE name LIKE 'J%';

Select employees whose names end with 'e'
      -> SELECT * FROM Employee
         WHERE name LIKE '%e';

Select employees whose names contain 'a'
      -> SELECT * FROM Employee
         WHERE name LIKE '%a%';

Select employees whose names are exactly 9 characters long.
      -> SELECT * FROM Employee
         WHERE name LIKE '_________';

Select employees whose names have 'o' as the second character.
      -> SELECT * FROM Employee
        WHERE name LIKE '_o%';
