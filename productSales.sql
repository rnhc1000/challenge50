Input: 
Sales table:
+---------+------------+------+----------+-------+
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+ 
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |
+---------+------------+------+----------+-------+
Product table:
+------------+--------------+
| product_id | product_name |
+------------+--------------+
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |
+------------+--------------+
+--------------+---------+
product_id is the primary key (column with unique values) of this table.
Each row of this table indicates the product name of each product.
Write a solution to select the product id, year, quantity, and price for the 
first year of every product sold.

Return the resulting table in any order.

Approach
Find the earliest year each product was sold by grouping sales data.

MIN() → This function returns the smallest value of the selected column

GROUP BY → This command groups rows that have the same values into summary rows, typically to perform aggregate functions on them

Select and display product details for those earliest years.

SELECT → This command retrieves data from a database

AS → This command renames a column with an alias (temporary name). In most database languages, we can skip the AS keyword and get the same result

IN → This operator allows to specify multiple values

Complexity
Time complexity: O(n)O(n)O(n)
n is the number of rows in the table. This is because the query processes each row in the table once to find the first year of every product sold.


SELECT product_id, year AS first_year, quantity, price 
FROM Sales
WHERE (product_id, year) IN (
    SELECT product_id, MIN(year) 
    FROM Sales 
    GROUP BY product_id
);

Output: 
+------------+------------+----------+-------+
| product_id | first_year | quantity | price |
+------------+------------+----------+-------+ 
| 100        | 2008       | 10       | 5000  |
| 200        | 2011       | 15       | 9000  |
+------------+------------+----------+-------+