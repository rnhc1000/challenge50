Write a solution to swap the seat id of every two consecutive students. 
If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by id in ascending order.

The result format is in the following example.

Example 1:

Input: 
Seat table:
+----+---------+
| id | student |
+----+---------+
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |
+----+---------+
Output: 
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+
Explanation: 
Note that if the number of students is odd, there is no need to change the last one seat.

Nice explanation by:
https://leetcode.com/sdimon13/

Intuition
This problem involves switching students seats in a classroom based on their id. 
If the id is even, the student should move to the seat of id-1. 
If it is odd, they should move to id+1, unless it is the last id 
(in which case, they stay in their current seat because there is no seat with id+1).

The way to solve this problem is to use a CASE expression in SQL that handles each of 
these situations based on the id.

Approach
We will use a CASE expression to switch the seats based on whether the id is even or odd.

If the id is even, we will subtract one from it to switch the seat.
If it is odd, we need to check if it is  the last id. If so, the student stays in the same seat. 
Otherwise, will add one to the id.

Will use the SELECT COUNT(*) FROM Seat subquery to check if the current id is the last one.
Finally, will order the result by id to get the final seating arrangement.

Complexity
Time complexity:
O(n), because we are scanning through all rows of the Seat table once.

Space complexity:
O(n), because the output of this query will contain n rows, where n is the number of rows 
in the Seat table.

SELECT
    ID,
    IF(ID % 2 = 1,
    LEAD(STUDENT,
    1,
    STUDENT) OVER (ORDER BY ID),
    LAG(STUDENT) OVER(ORDER BY ID)) AS STUDENT
FROM
    SEAT;