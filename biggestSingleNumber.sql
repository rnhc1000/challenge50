A single number is a number that appeared only once in the MyNumbers table.
Find the largest single number. If there is no single number, report null.
The result format is in the following example.

Example 1:

Input: 
MyNumbers table:
+-----+
| num |
+-----+
| 8   |
| 8   |
| 3   |
| 3   |
| 1   |
| 4   |
| 5   |
| 6   |
+-----+
Output: 
+-----+
| num |
+-----+
| 6   |
+-----+
Explanation: The single numbers are 1, 4, 5, and 6.
Since 6 is the largest single number, we return it.

SELECT 
    max(num) AS num 
FROM
    (SELECT num 
        FROM MyNumbers
        GROUP BY num 
        HAVING count(num)=1) AS num