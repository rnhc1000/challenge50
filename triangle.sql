Report for every three line segments whether they can form a triangle.

Return the result table in any order.

The result format is in the following example.

 Triangle Inequality Condition
 x + y > z 
 y + z > x 
 z + x > y

Example 1:

Input: 
Triangle table:
+----+----+----+
| x  | y  | z  |
+----+----+----+
| 13 | 15 | 30 |
| 10 | 20 | 15 |
+----+----+----+
Output: 
+----+----+----+----------+
| x  | y  | z  | triangle |
+----+----+----+----------+
| 13 | 15 | 30 | No       |
| 10 | 20 | 15 | Yes      |
+----+----+----+----------+

SELECT
    X,
    Y,
    Z,
    IF ((X+Y>Z
    AND (Y+Z>X)
    AND (Z+X>Y)), 'Yes', 'No') AS TRIANGLE
FROM
    TRIANGLE;

# ---

SELECT
    X,
    Y,
    Z,
    CASE
        WHEN X+Y>Z AND Y+Z>X AND X+Z>Y THEN
            'Yes'
        ELSE
            'No'
    END AS TRIANGLE
FROM
    TRIANGLE