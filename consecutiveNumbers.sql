Find all numbers that appear at least three times consecutively.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
Explanation: 1 is the only number that appears consecutively for at least three times.

The LEAD() function is a window function that allows you to access data from the next 
row in a result set

Here’s the basic syntax of the LEAD() function:

LEAD(expression, offset, default_value) 
OVER (
  PARTITION BY partition_expression 
  ORDER BY sort_expression
)
In this syntax:

expression
This is the column or expression from which you want to retrieve the next value.

offset
The offset specifies the number of rows to look ahead. If you skip it, it defaults to 1, which is the immediate row.

default_value
This is the default value if there is no next row. For example, the last row in the result set (or in a partition) will not have the next row.

If you don’t specify the default_value, it’ll default to NULL.

PARTITION BY partition_expression
The PARTITION BY is an optional clause that divides the result set into partitions to which the LEAD() function is applied independently.

ORDER BY order_expression
The ORDER BY clause specifies the order in which the rows are processed within each partition.

The LEAD() function can be useful for queries like finding the next value in a sequence or calculating the differences between the current and the next values in a column.

MySQL LEAD() function examples
Let’s take some examples of using the LEAD() function. We’ll use the following sales table for the demonstration:

CREATE TABLE sales(
    sales_employee VARCHAR(50) NOT NULL,
    fiscal_year INT NOT NULL,
    sale DECIMAL(14,2) NOT NULL,
    PRIMARY KEY(sales_employee,fiscal_year)
);

INSERT INTO sales(sales_employee,fiscal_year,sale)
VALUES('Bob',2016,100),
      ('Bob',2017,150),
      ('Bob',2018,200),
      ('Alice',2016,150),
      ('Alice',2017,100),
      ('Alice',2018,200),
       ('John',2016,200),
      ('John',2017,150),
      ('John',2018,250);

SELECT * FROM sales;
Code language: PHP (php)
Output:

+----------------+-------------+--------+
| sales_employee | fiscal_year | sale   |
+----------------+-------------+--------+
| Alice          |        2016 | 150.00 |
| Alice          |        2017 | 100.00 |
| Alice          |        2018 | 200.00 |
| Bob            |        2016 | 100.00 |
| Bob            |        2017 | 150.00 |
| Bob            |        2018 | 200.00 |
| John           |        2016 | 200.00 |
| John           |        2017 | 150.00 |
| John           |        2018 | 250.00 |
+----------------+-------------+--------+
1) Basic MySQL LEAD() function example
The following example uses the LEAD() function to pull the sales of the next row into the current row:

SELECT 
  sales_employee,
  fiscal_year, 
  sale, 
  LEAD(sale) OVER (
    PARTITION BY sales_employee
    ORDER BY fiscal_year
  ) AS next_year_sale 
FROM 
  sales;
Code language: SQL (Structured Query Language) (sql)
Output:

+----------------+-------------+--------+----------------+
| sales_employee | fiscal_year | sale   | next_year_sale |
+----------------+-------------+--------+----------------+
| Alice          |        2016 | 150.00 |         100.00 |
| Alice          |        2017 | 100.00 |         200.00 |
| Alice          |        2018 | 200.00 |           NULL |
| Bob            |        2016 | 100.00 |         150.00 |
| Bob            |        2017 | 150.00 |         200.00 |
| Bob            |        2018 | 200.00 |           NULL |
| John           |        2016 | 200.00 |         150.00 |
| John           |        2017 | 150.00 |         250.00 |
| John           |        2018 | 250.00 |           NULL |
+----------------+-------------+--------+----------------+
9 rows in set (0.00 sec)



WITH CTE AS (
    SELECT num,
    lead(num,1) over() num1,
    lead(num,2) over() num2
    FROM logs

)

SELECT DISTINCT num ConsecutiveNums FROM CTE WHERE (num=num1) AND (num=num2)
# Write your MySQL query statement below
SELECT DISTINCT num as ConsecutiveNums
FROM logs
WHERE (id + 1, num) IN (SELECT * FROM logs) AND (id + 2, num) IN (SELECT * FROM logs)