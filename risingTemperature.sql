Write a solution to find all dates Id with higher temperatures compared to its previous 
dates (yesterday).
Return the result table in any order.
The result format is in the following example.
Example 1:

Input: 
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output: 
+----+
| id |
+----+
| 2  |
| 4  |
+----+
Explanation: 
In 2015-01-02, the temperature was higher than the previous day (10 -> 25).
In 2015-01-04, the temperature was higher than the previous day (20 -> 30).
Join the Weather table with itself, denoting the first occurrence as w1 and 
the second occurrence as w2.
Compare the dates of w1 and w2 using the DATEDIFF() function to check if 
they are consecutive days (with a difference of 1 day).
Add a condition in the WHERE clause to select the rows where the temperature of w1 
is greater than the temperature of w2.
Select the id of w1 as the result.

SELECT
    W1.ID
FROM
    WEATHER W1,
    WEATHER W2
WHERE
    DATEDIFF(W1.RECORDDATE, W2.RECORDDATE) = 1
    AND W1.TEMPERATURE > W2.TEMPERATURE;