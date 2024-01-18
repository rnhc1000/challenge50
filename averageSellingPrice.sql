Write a solution to find the average selling price for each product. average_price 
should be rounded to 2 decimal places.
Return the result table in any order.
The result format is in the following example.
Example 1:
Input: 
Prices table:
+------------+------------+------------+--------+
| product_id | start_date | end_date   | price  |
+------------+------------+------------+--------+
| 1          | 2019-02-17 | 2019-02-28 | 5      |
| 1          | 2019-03-01 | 2019-03-22 | 20     |
| 2          | 2019-02-01 | 2019-02-20 | 15     |
| 2          | 2019-02-21 | 2019-03-31 | 30     |
+------------+------------+------------+--------+
UnitsSold table:
+------------+---------------+-------+
| product_id | purchase_date | units |
+------------+---------------+-------+
| 1          | 2019-02-25    | 100   |
| 1          | 2019-03-01    | 15    |
| 2          | 2019-02-10    | 200   |
| 2          | 2019-03-22    | 30    |
+------------+---------------+-------+
Output: 
+------------+---------------+
| product_id | average_price |
+------------+---------------+
| 1          | 6.96          |
| 2          | 16.96         |
+------------+---------------+


SELECT
    P.PRODUCT_ID,
    IFNULL(ROUND(SUM(UNITS*PRICE)/SUM(UNITS), 2), 0) AS AVERAGE_PRICE
FROM
    PRICES    P
    LEFT JOIN UNITSSOLD U
    ON P.PRODUCT_ID = U.PRODUCT_ID
    AND U.PURCHASE_DATE BETWEEN START_DATE
    AND END_DATE
GROUP BY
    PRODUCT_ID