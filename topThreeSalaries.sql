A company executives are interested in seeing who earns the most money in each of the company  
departments. 
A high earner in a department is an employee who has a salary in the top three 
unique salaries for that department.

Write a solution to find the employees who are high earners in each of the departments.

Return the result table in any order.

The result format is in the following example.
Example 1:

Input: 
Employee table:
+----+-------+--------+--------------+
| id | name  | salary | departmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 85000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
| 5  | Janet | 69000  | 1            |
| 6  | Randy | 85000  | 1            |
| 7  | Will  | 70000  | 1            |
+----+-------+--------+--------------+
Department table:
+----+-------+
| id | name  |
+----+-------+
| 1  | IT    |
| 2  | Sales |
+----+-------+
Output: 
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Joe      | 85000  |
| IT         | Randy    | 85000  |
| IT         | Will     | 70000  |
| Sales      | Henry    | 80000  |
| Sales      | Sam      | 60000  |
+------------+----------+--------+
Explanation: 
In the IT department:
- Max earns the highest unique salary
- Both Randy and Joe earn the second-highest unique salary
- Will earns the third-highest unique salary

In the Sales department:
- Henry earns the highest salary
- Sam earns the second-highest salary
- There is no third-highest salary as there are only two employees

SELECT d.name, e.name, e.salary 
FROM employee e 
UNION department d 

Intuition
The problem involves utilizing the DENSE_RANK() window function to assign a rank to each employee's salary within their respective department, ordered in descending order.

Approach
Joining Employee and Department Tables:

Use the JOIN operation to combine the Employee and Department tables based on the departmentId field.
Ranking Salaries within Each Department:

Apply the DENSE_RANK() window function to assign a rank to each employee's salary within their department. The ranking is done in descending order of salaries.
Filtering Top Three Salaries:

Wrap the previous steps in a subquery (rnk_tbl) to obtain the ranked results.
Select the records where the rank is less than or equal to 3, indicating the top three salaries in each department.
Final Result:

Retrieve the desired columns (Department, Employee, Salary) for the final output.
Complexity
Time complexity:

O(Nlog⁡N)O(N \log N)O(NlogN), where NNN is the total number of records in the Employee table. This is primarily due to the sorting and ranking operation.
Space complexity:

O(N)O(N)O(N), where NNN is the total number of records in the Employee table. This is due to the storage of the intermediate results in the subquery.
SQL Query
-- Write your MySQL query statement below
SELECT Department, Employee, Salary
FROM (
    SELECT 
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK() OVER (PARTITION BY d.name ORDER BY Salary DESC) AS rnk
    FROM Employee e
    JOIN Department d
    ON e.departmentId = d.id
) AS rnk_tbl
WHERE rnk <= 3;

SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary 
FROM department d JOIN employee e ON d.id = e.departmentId
 WHERE salary >= (
    SELECT CASE 
    WHEN (SELECT COUNT(DISTINCT salary) FROM employee WHERE departmentId = d.id) >=3 
    THEN (SELECT DISTINCT o.salary FROM employee o WHERE o.departmentId = ddep.id ORDER BY o.salary DESC LIMIT 1 OFFSET 2)
    ELSE 0
    END
 );