Write a solution to find managers with at least five direct reports.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+-----+-------+------------+-----------+
| id  | name  | department | managerId |
+-----+-------+------------+-----------+
| 101 | John  | A          | null      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |
+-----+-------+------------+-----------+
Output: 
+------+
| name |
+------+
| John |
+------+

SELECT
    E1.NAME
FROM
    EMPLOYEE E1
    JOIN (
        SELECT
            MANAGERID,
            COUNT(*)  AS DIRECTREPORTS
        FROM
            EMPLOYEE
        GROUP BY
            MANAGERID
        HAVING
            COUNT(*) >= 5
    ) E2
    ON E1.ID = E2.MANAGERID;