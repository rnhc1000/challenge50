Write an SQL query that reports the average experience years of all the employees 
for each project, rounded to 2 digits.
Return the result table in any order.
The query result format is in the following example.
Example 1:

Input: 
Project table:
+-------------+-------------+
| project_id  | employee_id |
+-------------+-------------+
| 1           | 1           |
| 1           | 2           |
| 1           | 3           |
| 2           | 1           |
| 2           | 4           |
+-------------+-------------+
Employee table:
+-------------+--------+------------------+
| employee_id | name   | experience_years |
+-------------+--------+------------------+
| 1           | Khaled | 3                |
| 2           | Ali    | 2                |
| 3           | John   | 1                |
| 4           | Doe    | 2                |
+-------------+--------+------------------+
Output: 
+-------------+---------------+
| project_id  | average_years |
+-------------+---------------+
| 1           | 2.00          |
| 2           | 2.50          |
+-------------+---------------+
Explanation: 
The average experience years for the first project is (3 + 2 + 1) / 3 = 2.00 and 
for the second project is (3 + 2) / 2 = 2.50


SELECT
    P.PROJECT_ID,
    ROUND(AVG(E.EXPERIENCE_YEARS), 2) AS AVERAGE_YEARS
FROM
    PROJECT  P
    LEFT JOIN EMPLOYEE E
    ON P.EMPLOYEE_ID = E.EMPLOYEE_ID

SELECT
    P.PROJECT_ID,
    ROUND(AVG(E.EXPERIENCE_YEARS), 2) AS AVERAGE_YEARS
FROM
    PROJECT  P
    LEFT JOIN EMPLOYEE E
    ON P.EMPLOYEE_ID = E.EMPLOYEE_ID
GROUP BY
    P.PROJECT_ID