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
    PRODUCT_ID,
    PRICE
FROM
    PRODUCTS
WHERE
    CHANGE_DATE < '2019-08-16'
    SELECT
        T.PRODUCT_ID,
        COALESCE( P.NEW_PRICE,
        10 ) AS PRICE
    FROM
        (
            SELECT
                PRODUCT_ID,
                MAX(
                    CASE
                        WHEN STR_TO_DATE( CHANGE_DATE, '%Y-%m-%d') <= STR_TO_DATE('2019-08-16', '%Y-%m-%d') THEN
                            CHANGE_DATE
                    END ) AS DT
            FROM
                PRODUCTS
            GROUP BY
                PRODUCT_ID
        ) AS T
        LEFT JOIN PRODUCTS P
        ON P.PRODUCT_ID = T.PRODUCT_ID
        AND T.DT = P.CHANGE_DATE;

WITH CTE AS (
    SELECT
        DISTINCT PRODUCT_ID,
        FIRST_VALUE(NEW_PRICE) OVER(PARTITION BY PRODUCT_ID ORDER BY CHANGE_DATE DESC ) AS PRICE
    FROM
        PRODUCTS
    WHERE
        STR_TO_DATE( CHANGE_DATE, '%Y-%m-%d') <= STR_TO_DATE('2019-08-16', '%Y-%m-%d')
)
SELECT
    *
FROM
    CTE
UNION
ALL
SELECT
    DISTINCT PRODUCT_ID,
    10 AS PRICE
FROM
    PRODUCTS
WHERE
    PRODUCT_ID NOT IN (
        SELECT
            PRODUCT_ID
        FROM
            CTE
    );