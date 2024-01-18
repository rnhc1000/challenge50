You are the restaurant owner and you want to analyze a possible expansion 
(there will be at least one customer every day).

Compute the moving average of how much the customer paid in a seven days window 
(i.e., current day + 6 days before). average_amount should be rounded to two decimal places.

Return the result table ordered by visited_on in ascending order.

The result format is in the following example.

 

Example 1:

Input: 
Customer table:
+-------------+--------------+--------------+-------------+
| customer_id | name         | visited_on   | amount      |
+-------------+--------------+--------------+-------------+
| 1           | Jhon         | 2019-01-01   | 100         |
| 2           | Daniel       | 2019-01-02   | 110         |
| 3           | Jade         | 2019-01-03   | 120         |
| 4           | Khaled       | 2019-01-04   | 130         |
| 5           | Winston      | 2019-01-05   | 110         | 
| 6           | Elvis        | 2019-01-06   | 140         | 
| 7           | Anna         | 2019-01-07   | 150         |
| 8           | Maria        | 2019-01-08   | 80          |
| 9           | Jaze         | 2019-01-09   | 110         | 
| 1           | Jhon         | 2019-01-10   | 130         | 
| 3           | Jade         | 2019-01-10   | 150         | 
+-------------+--------------+--------------+-------------+
Output: 
+--------------+--------------+----------------+
| visited_on   | amount       | average_amount |
+--------------+--------------+----------------+
| 2019-01-07   | 860          | 122.86         |
| 2019-01-08   | 840          | 120            |
| 2019-01-09   | 840          | 120            |
| 2019-01-10   | 1000         | 142.86         |
+--------------+--------------+----------------+
Explanation: 
1st moving average from 2019-01-01 to 2019-01-07 has an average_amount of (100 + 110 + 120 + 130 + 110 + 140 + 150)/7 = 122.86
2nd moving average from 2019-01-02 to 2019-01-08 has an average_amount of (110 + 120 + 130 + 110 + 140 + 150 + 80)/7 = 120
3rd moving average from 2019-01-03 to 2019-01-09 has an average_amount of (120 + 130 + 110 + 140 + 150 + 80 + 110)/7 = 120
4th moving average from 2019-01-04 to 2019-01-10 has an average_amount of (130 + 110 + 140 + 150 + 80 + 110 + 130 + 150)/7 = 142.86

Nice explanation by:
https://leetcode.com/deepankyadav/

Intuition
The goal is to calculate the amount and average amount of customer visits for each 
visited_on date, considering a rolling window of the previous 7 days.

Approach
We want to calculate the amount and average amount of customer visits for each 
visited_on date, considering a rolling window of the previous 7 days.

We start by selecting the visited_on date from the customer table as the main query. 
This will be the basis for our calculations.

To calculate the amount, we use a subquery within the main query. 
This subquery sums up the amount for each visited_on date by considering the previous 7 days. 
It does this by using a correlated subquery that looks for customer visits between 
the current visited_on date and 6 days prior.

Similarly, to calculate the average amount, we use another subquery within the main query. 
This subquery divides the sum of the amount by 7, representing the rolling window of 7 days. 
It also uses a correlated subquery with the same date range as the amount subquery.

Finally, we group the results by the visited_on date to get the final output.

Complexity
Time complexity:
The time complexity of this query depends on the size of the customer table and the indexing 
on the visited_on column. The subqueries perform calculations based on a rolling window of 
7 days, which requires scanning and aggregating data within that window for each 
visited_on date. The overall time complexity can be approximated as O(n2)O(n^2)O(n2), 
where n is the number of records in the customer table.

Space complexity:
The space complexity of this query is determined by the amount of memory required to store 
the intermediate result sets for the subqueries and the final result set for the main query. 
It does not depend on the size of the customer table itself. 
The space complexity can be approximated as O(n)O(n)O(n), where n is the number of records 
in the customer table

SELECT
    visited_on,
    (
        SELECT SUM(amount)
        FROM CUSTOMER
        WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
    ) AS amount,
    ROUND(
        (
            SELECT SUM(amount) / 7
            FROM CUSTOMER
            WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
        ),
        2
    ) AS average_amount
FROM CUSTOMER c
WHERE visited_on >= (
        SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY)
        FROM CUSTOMER
    )
GROUP BY visited_on;