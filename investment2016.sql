Write a solution to report the sum of all total investment values in 2016 tiv_2016, 
for all policyholders who:

have the same tiv_2015 value as one or more other policyholders, and
are not located in the same city as any other policyholder 
(i.e., the (lat, lon) attribute pairs must be unique).
Round tiv_2016 to two decimal places.

The result format is in the following example.

Example 1:

Input: 
Insurance table:
+-----+----------+----------+-----+-----+
| pid | tiv_2015 | tiv_2016 | lat | lon |
+-----+----------+----------+-----+-----+
| 1   | 10       | 5        | 10  | 10  |
| 2   | 20       | 20       | 20  | 20  |
| 3   | 10       | 30       | 20  | 20  |
| 4   | 10       | 40       | 40  | 40  |
+-----+----------+----------+-----+-----+
Output: 
+----------+
| tiv_2016 |
+----------+
| 45.00    |
+----------+
Explanation: 
The first record in the table, like the last record, meets both of the two criteria.
The tiv_2015 value 10 is the same as the third and fourth records, and its location is unique.

The second record does not meet any of the two criteria. Its tiv_2015 is not like any 
other policyholders and its location is the same as the third record, which makes the 
third record fail, too.
So, the result is the sum of tiv_2016 of the first and last record, which is 45.

Intuition
The solution aims to calculate the total insured value in 2016 for the insurance policies 
that meet specific conditions.

Approach
We want to calculate the total insured value in the year 2016 for specific insurance policies.
We start by looking at the "Insurance" table.
First, we find all the policies where the insured value in 2015 appears more than once. 
This helps us identify policies that have been renewed or updated.
Next, we find all the unique combinations of latitude and longitude where only one policy 
exists. This helps us identify policies with unique locations.
We then apply these two conditions together using the AND operator to filter the policies 
that meet both criteria.
Finally, we calculate the sum of the insured values in 2016 for the filtered policies, 
rounding the result to two decimal places.
Complexity
Time complexity:
The time complexity of the query depends on the size of the "Insurance" table. 
The subqueries used to filter the data have a time complexity of O(n2)O(n^2)O(n2), 
where n is the number of rows in the table. Overall, the time complexity can be 
considered linear or O(n)O(n)O(n) in terms of the number of rows in the table.

Space complexity:
The space complexity of the query is determined by the size of the "Insurance" table and 
the number of distinct tiv_2015, lat, and lon values. The query itself does not consume 
significant additional space beyond the input table. 
Thus, the space complexity can be considered O(n)O(n)O(n), where n is the number of 
rows in the table.

# ---

SELECT
    ROUND(SUM(TIV_2016), 2) AS TIV_2016
FROM
    INSURANCE
WHERE
    TIV_2015 IN (
        SELECT
            TIV_2015
        FROM
            INSURANCE
        GROUP BY
            TIV_2015
        HAVING
            COUNT(*) > 1
    )
    AND (LAT, LON) IN (
        SELECT
            LAT,
            LON
        FROM
            INSURANCE
        GROUP BY
            LAT,
            LON
        HAVING
            COUNT(*) = 1
    )

