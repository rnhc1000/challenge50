Write a solution to find the prices of all products on 2019-08-16. 
Assume the price of all products before any change is 10.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Products table:
+------------+-----------+-------------+
| product_id | new_price | change_date |
+------------+-----------+-------------+
| 1          | 20        | 2019-08-14  |
| 2          | 50        | 2019-08-14  |
| 1          | 30        | 2019-08-15  |
| 1          | 35        | 2019-08-16  |
| 2          | 65        | 2019-08-17  |
| 3          | 20        | 2019-08-18  |
+------------+-----------+-------------+
Output: 
+------------+-------+
| product_id | price |
+------------+-------+
| 2          | 50    |
| 1          | 35    |
| 3          | 10    |
+------------+-------+

SELECT 
    product_id, price
FROM Products
WHERE change_date < '2019-08-16'   

SELECT T.product_id , COALESCE( P.new_price , 10 ) AS price 
FROM (
    SELECT product_id , MAX(
        CASE WHEN 
          STR_TO_DATE( change_date, '%Y-%m-%d') <= 
          STR_TO_DATE('2019-08-16', '%Y-%m-%d')
        THEN change_date END
    ) AS dt
    FROM Products
    GROUP BY product_id
) AS T 
LEFT JOIN Products P
ON P.product_id = T.product_id AND T.dt = P.change_date;

WITH CTE AS (
    SELECT DISTINCT product_id ,
    FIRST_VALUE(new_price) OVER(PARTITION BY product_id 
    ORDER BY change_date DESC ) AS price 
    FROM Products
    WHERE STR_TO_DATE( change_date, '%Y-%m-%d') <= 
          STR_TO_DATE('2019-08-16', '%Y-%m-%d')
)

SELECT * FROM CTE 
UNION ALL 
SELECT DISTINCT product_id , 10 AS price 
FROM Products
WHERE product_id NOT IN (SELECT product_id FROM CTE );