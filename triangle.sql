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
    x,y,z, IF ((x+y>z AND (y+z>x) AND (z+x>y)), 'Yes', 'No') AS triangle 
FROM triangle;

# ---

SELECT 
    x, y, z, 
CASE
    WHEN x+y>z and y+z>x and x+z>y THEN 'Yes' ELSE 'No'
END 
AS triangle
FROM Triangle