For this problem, we will consider a manager an employee who has at least 1 other employee 
reporting to them.

Write a solution to report the ids and the names of all managers, the number of employees 
who report directly to them, and the average age of the reports rounded to the nearest integer.

Return the result table ordered by employee_id.

The result format is in the following example.
Example 1:

Input: 
Employees table:
+-------------+---------+------------+-----+
| employee_id | name    | reports_to | age |
+-------------+---------+------------+-----+
| 9           | Hercy   | null       | 43  |
| 6           | Alice   | 9          | 41  |
| 4           | Bob     | 9          | 36  |
| 2           | Winston | null       | 37  |
+-------------+---------+------------+-----+
Output: 
+-------------+-------+---------------+-------------+
| employee_id | name  | reports_count | average_age |
+-------------+-------+---------------+-------------+
| 9           | Hercy | 2             | 39          |
+-------------+-------+---------------+-------------+
Explanation: 
Hercy has 2 people report directly to him, Alice and Bob. 
Their average age is (41+36)/2 = 38.5, which is 39 after rounding it to the 
nearest integer.

SELECT e.employee_id, 
    e.name, 
    count(r.employee_id) reports_count, 
    ROUND(avg(r.age), 0) average_age
FROM Employees e 
INNER JOIN Employees r ON e.employee_id = r.reports_to
GROOUP BY e.employee_id, e.name
HAVING count(r.employee_id) >= 1
ORDER BY e.employee_id

SELECT 
        e1.employee_id, 
        e1.name, 
        count(e2.reports_to) AS reports_count, 
        round(avg(e2.age),2) AS average_age 
FROM Employees e1 
LEFT JOIN Employees e2 ON e1.employee_id=e2.reports_to 
WHERE e2.reports_to IS NOT NULL
GROUP BY e2.reports_to 
ORDER BY e1.employee_id

Intuition
Need to print the manager details which consist of Manager employee id, name, 
number of employees reporting to them and average age of people reporting to 
them in ascending order of the Manager IDs.
To do so, we need to use JOINS on the same table and verify the employee_id and 
reports_to ids match.

Approach
In this solution, we leverage SQL aggregate functions to derive meaningful insights 
from two tables, E1 and E2. These tables are linked through a left join based on the 
condition that E1.employee_id is equal to E2.reports_to. 
To ensure that managers are excluded, we verify that E2.reports_to is not null.

**COUNT: **The COUNT function is utilized to determine the number of rows in the result 
set that satisfies the specified condition, i.e., counting the number of employees 
reporting to the same manager.

AVG: This function computes the average of a set of values. In our context, it calculates 
the average age of employees managed by the same individual.

ROUND: While not strictly an aggregate function, ROUND is often used in conjunction with 
aggregate functions. In this scenario, it rounds numeric values to a specified number of 
decimal places, enhancing the presentation of the average age.

By grouping the result based on the reports_to column of the E2 table, we obtain counts 
and average ages for employees sharing the same manager. 
The combination of COUNT(e2.reports_to) and ROUND(AVG(e2.age)) from the E2 table encapsulates 
the key metrics needed for analysis, aligning with the specific conditions outlined in the 
problem statement.