Write an SQL query to find for each month and country, 
the number of transactions and their total amount, 
the number of approved transactions and 
their total amount.

Return the result table in any order.

The query result format is in the following example.

Example 1:

Input: 
Transactions table:
+------+---------+----------+--------+------------+
| id   | country | state    | amount | trans_date |
+------+---------+----------+--------+------------+
| 121  | US      | approved | 1000   | 2018-12-18 |
| 122  | US      | declined | 2000   | 2018-12-19 |
| 123  | US      | approved | 2000   | 2019-01-01 |
| 124  | DE      | approved | 2000   | 2019-01-07 |
+------+---------+----------+--------+------------+
Output: 
+----------+---------+-------------+----------------+--------------------+-----------------------+
| month    | country | trans_count | approved_count | trans_total_amount | approved_total_amount |
+----------+---------+-------------+----------------+--------------------+-----------------------+
| 2018-12  | US      | 2           | 1              | 3000               | 1000                  |
| 2019-01  | US      | 1           | 1              | 2000               | 2000                  |
| 2019-01  | DE      | 1           | 1              | 2000               | 2000                  |
+----------+---------+-------------+----------------+--------------------+-----------------------+


SELECT 
    SUBSTR(trans_date,1,7) AS month,
    country, count(id) AS trans_count, 
    sum(CASE WHEN state='approved' THEN 1 ELSE 0 END) AS approved_count,
    sum(amount) AS trans_total_amount,
    sum(CASE WHEN state='approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM
    transactions
    GROUP BY month,COUNTRY