Write a solution to calculate the number of bank accounts for each salary category. 
The salary categories are:

"Low Salary": All the salaries strictly less than $20000.
"Average Salary": All the salaries in the inclusive range [$20000, $50000].
"High Salary": All the salaries strictly greater than $50000.
The result table must contain all three categories. If there are no accounts in a category, 
return 0.

Return the result table in any order.

The result format is in the following example.

Example 1:

Input: 
Accounts table:
+------------+--------+
| account_id | income |
+------------+--------+
| 3          | 108939 |
| 2          | 12747  |
| 8          | 87709  |
| 6          | 91796  |
+------------+--------+
Output: 
+----------------+----------------+
| category       | accounts_count |
+----------------+----------------+
| Low Salary     | 1              |
| Average Salary | 0              |
| High Salary    | 3              |
+----------------+----------------+
Explanation: 
Low Salary: Account 2.
Average Salary: No accounts.
High Salary: Accounts 3, 6, and 8.
Intuition
SQL solution categorizes bank accounts into three salary categories ('Low Salary,' 'Average Salary,' 'High Salary') based on specified income ranges. The query counts the number of accounts in each category and uses the UNION operator to combine the results into a single table. If a category has no accounts, it returns 0. The result provides a clear breakdown of account distribution across different salary levels.

Approach
1 Low Salary

SELECT 'Low Salary' AS CATEGORY, COUNT(ACCOUNT_ID) AS ACCOUNTS_COUNT
FROM ACCOUNTS 
WHERE INCOME < 20000
This part of the query selects accounts with an income less than 20,000 and labels them as 'Low Salary'. It counts the number of such accounts and aliases the count as 'ACCOUNTS_COUNT'.

2 Average Salary:

UNION
SELECT 'Average Salary' AS CATEGORY, COUNT(ACCOUNT_ID) AS ACCOUNTS_COUNT
FROM ACCOUNTS
WHERE INCOME BETWEEN 20000 AND 50000

Nice explanation by:
https://leetcode.com/prashikdable7/

This part selects accounts with an income between 20,000 and 50,000 (inclusive) and 
labels them as 'Average Salary'. It also counts the number of such accounts and aliases 
the count as 'ACCOUNTS_COUNT'. The UNION operator is used to combine this result with 
the previous one.

3 High Salary:

UNION
SELECT 'High Salary' AS CATEGORY, COUNT(ACCOUNT_ID) AS ACCOUNTS_COUNT
FROM ACCOUNTS
WHERE INCOME > 50000

This part selects accounts with an income greater than 50,000 and labels them as 'High Salary'. It counts the number of such accounts and aliases the count as 'ACCOUNTS_COUNT'. Again, the UNION operator is used to combine this result with the previous ones.

# ---

SELECT "Low Salary" AS category,
       sum(income < 20000) AS accounts_count
  FROM Accounts

UNION

SELECT "Average Salary" AS category,
       sum(income BETWEEN 20000 AND 50000) AS accounts_count
  FROM Accounts

UNION

SELECT "High Salary" AS category,
       sum(income > 50000) AS accounts_count
  FROM Accounts;