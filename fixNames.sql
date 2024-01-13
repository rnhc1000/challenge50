WRITE A SOLUTION TO FIX THE NAMES SO THAT ONLY THE FIRST CHARACTER IS
UPPERCASE AND THE REST ARE LOWERCASE.
RETURN THE RESULT TABLE ORDERED BY USER_ID.
THE RESULT FORMAT IS IN THE FOLLOWING EXAMPLE.
EXAMPLE 1:



Input: 
Users table:
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | aLice |
| 2       | bOB   |
+---------+-------+
Output: 
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | Alice |
| 2       | Bob   |
+---------+-------+
SELECT  user_id, 
        CONCAT(UPPER(LEFT(name,1)), LOWER(RIGHT(name,LENGTH(name)-1))) 
        AS NAME 
        FROM users 
        ORDER BY user_id ASC;