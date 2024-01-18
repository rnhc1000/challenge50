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
    MAX(NUM) AS NUM
FROM
    (
        SELECT
            NUM
        FROM
            MYNUMBERS
        GROUP BY
            NUM
        HAVING
            COUNT(NUM)=1
    ) AS NUM