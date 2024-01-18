Write a solution to report the customer ids from the Customer table that bought 
all the products in the Product table.

Return the result table in any order.

The result format is in the following example.


Example 1:

Input: 
Customer table:
+-------------+-------------+
| customer_id | product_key |
+-------------+-------------+
| 1           | 5           |
| 2           | 6           |
| 3           | 5           |
| 3           | 6           |
| 1           | 6           |
+-------------+-------------+
Product table:
+-------------+
| product_key |
+-------------+
| 5           |
| 6           |
+-------------+
Output: 
+-------------+
| customer_id |
+-------------+
| 1           |
| 3           |
+-------------+
Explanation: 
The customers who bought all the products (5 and 6) are customers with IDs 1 and 3.

SELECT
    C.CUSTOMER_ID
FROM
    CUSTOMER C
    RIGHT JOIN PRODUCT P
    ON C.PRODUCT_KEY=P.PRODUCT_KEY
HAVING
    COUNT(C.PRODUCT_KEY) > 1
    SELECT
        C.CUSTOMER_ID
    FROM
        CUSTOMER C
    GROUP BY
        C.CUSTOMER_ID
    HAVING
        COUNT(DISTINCT C.PRODUCT_KEY)=(
            SELECT
                COUNT(DISTINCT PRODUCT_KEY)
            FROM
                PRODUCT
        )