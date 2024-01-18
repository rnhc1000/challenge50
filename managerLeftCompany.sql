Find the IDs of the employees whose salary is strictly less than $30000 and 
whose manager left the company. When a manager leaves the company, their information 
is deleted from the Employees table, but the reports still have their manager_id set 
to the manager that left.

Return the result table ordered by employee_id.

The result format is in the following example.

Example 1:

Input:  
Employees table:
+-------------+-----------+------------+--------+
| employee_id | name      | manager_id | salary |
+-------------+-----------+------------+--------+
| 3           | Mila      | 9          | 60301  |
| 12          | Antonella | null       | 31000  |
| 13          | Emery     | null       | 67084  |
| 1           | Kalel     | 11         | 21241  |
| 9           | Mikaela   | null       | 50937  |
| 11          | Joziah    | 6          | 28485  |
+-------------+-----------+------------+--------+
Output: 
+-------------+
| employee_id |
+-------------+
| 11          |
+-------------+
Nice explanation by:
https://leetcode.com/lutfiddindev/

Explanation: 
The employees with a salary less than $30000 are 1 (Kalel) and 11 (Joziah).
Kalel's manager is employee 11, who is still in the company (Joziah).
Joziah's manager is employee 6, who left the company because there is no row 
for employee 6 as it was deleted.

Intuition
Our task is to find employees:

whose salary is strictly less than 30000 dollars
whose manager left the company

Approach
We can use simple less than < operator to find employees whose salary strictly less 
than 30000 dollars
Subquery (query within another query) to find employees whose whose manager left the 
company
NOT operator is used in combination with other operators to give the opposite result, 
also called the negative result
IN operator allows you to specify multiple values in a WHERE clause
ORDER BY keyword is used to sort the result-set in ascending or descending order.

SELECT employee_id 
FROM employees
WHERE salary < 30000 AND manager_id NOT IN (
    SELECT employee_id FROM employees
) ORDER BY employee_id;