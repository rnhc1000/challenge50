Write a solution to:

Find the name of the user who has rated the greatest number of movies. 
In case of a tie, return the lexicographically smaller user name.
Find the movie name with the highest average rating in February 2020. 
In case of a tie, return the lexicographically smaller movie name.
The result format is in the following example.
Example 1:

Input: 
Movies table:
+-------------+--------------+
| movie_id    |  title       |
+-------------+--------------+
| 1           | Avengers     |
| 2           | Frozen 2     |
| 3           | Joker        |
+-------------+--------------+
Users table:
+-------------+--------------+
| user_id     |  name        |
+-------------+--------------+
| 1           | Daniel       |
| 2           | Monica       |
| 3           | Maria        |
| 4           | James        |
+-------------+--------------+
MovieRating table:
+-------------+--------------+--------------+-------------+
| movie_id    | user_id      | rating       | created_at  |
+-------------+--------------+--------------+-------------+
| 1           | 1            | 3            | 2020-01-12  |
| 1           | 2            | 4            | 2020-02-11  |
| 1           | 3            | 2            | 2020-02-12  |
| 1           | 4            | 1            | 2020-01-01  |
| 2           | 1            | 5            | 2020-02-17  | 
| 2           | 2            | 2            | 2020-02-01  | 
| 2           | 3            | 2            | 2020-03-01  |
| 3           | 1            | 3            | 2020-02-22  | 
| 3           | 2            | 4            | 2020-02-25  | 
+-------------+--------------+--------------+-------------+
Output: 
+--------------+
| results      |
+--------------+
| Daniel       |
| Frozen 2     |
+--------------+
Explanation: 
Daniel and Monica have rated 3 movies ("Avengers", "Frozen 2" and "Joker") 
but Daniel is smaller lexicographically.
Frozen 2 and Joker have a rating average of 3.5 in February but Frozen 2 is 
smaller lexicographically.

nICE EXPLANATION BY:
https://leetcode.com/samabdullaev/

Intuition
We need to find the name of the user who has rated the greatest number of movies 
and the movie name with the highest average rating in February 2020. 
In case of a tie, we should return lexicographically smaller user and movie name.

Approach
Find the user who has rated the most movies.

SELECT → This command retrieves data from a database

AS → This command renames a column with an alias (temporary name). 
In most database languages, we can skip the AS keyword and get the same result

WHERE → This command filters a result set to include only records that fulfill a 
specified condition

= → This operator compares if one value is equal to another value

GROUP BY → This command groups rows that have the same values into summary rows, 
typically to perform aggregate functions on them

ORDER BY → This command sorts the result-set in ascending (smallest to largest) 
order by default

COUNT() → This function returns the number of rows

DESC → This keyword sorts the records in descending (largest to smallest) order

LIMIT → This clause specifies the number of records to return

Find the movie with the highest average rating in February 2020.

AND → This operator filters records based on more than one condition

LIKE → This operator searches for a specified pattern in a column

AVG() → This function returns the average value of an expression

Combine the result sets into a single result set without removing duplicate rows.

UNION ALL → This operator combines the result-set of two or more SELECT statements 
(every SELECT statement must have the same number/data type/order of columns). 
It returns all rows from the query and it does not remove duplicate rows between the 
various SELECT statements

Complexity
Time complexity: O(nlogn)O(nlogn)O(nlogn)
n is the number of rows in the table. This is because the query involves joining tables, 
which requires scanning through all the rows in the tables to check the conditions.

(
    SELECT u.name AS results FROM users u INNER JOIN movierating m ON u.user_id = m.user_id HAVING  (SELECT max(count(m.rating)))
)
UNION ALL
(
    SELECT t.title AS results FROM movies t LEFT JOIN movierating m on t.movie_id = m.movie_id AND m.created_at LIKE '2020-02%' GROUP BY t.title
    ORDER BY AVG(RATING) DESC,  t.title LIMIT 1
)
