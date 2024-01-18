Write a solution to find the people who have the most friends and the most friends number.
The test cases are generated so that only one person has the most friends.
The result format is in the following example.

Example 1:

Input: 
RequestAccepted table:
+--------------+-------------+-------------+
| requester_id | accepter_id | accept_date |
+--------------+-------------+-------------+
| 1            | 2           | 2016/06/03  |
| 1            | 3           | 2016/06/08  |
| 2            | 3           | 2016/06/08  |
| 3            | 4           | 2016/06/09  |
+--------------+-------------+-------------+
Output: 
+----+-----+
| id | num |
+----+-----+
| 3  | 3   |
+----+-----+
Explanation: 
The person with id 3 is a friend of people 1, 2, and 4, 
so he has three friends in total, which is the most number than any others.]

SELECT
    DISTINCT REQUESTER_ID AS ID,
    COUNT(*) AS NUM
FROM
    (
        SELECT
            REQUESTER_ID,
            ACCEPTER_ID
        FROM
            REQUESTACCEPTED
        UNION
        SELECT
            ACCEPTER_ID,
            REQUESTER_ID
        FROM
            REQUESTACCEPTED
    ) AS REQUESTS
GROUP BY
    REQUESTER_ID
ORDER BY
    NUM DESC LIMIT 1

SELECT
    REQUESTER_ID AS ID,
    (
        SELECT
            COUNT(*)
        FROM
            REQUESTACCEPTED
        WHERE
            ID=REQUESTER_ID
            OR ID=ACCEPTER_ID
    ) AS NUM
FROM
    REQUESTACCEPTED
GROUP BY
    REQUESTER_ID
ORDER BY
    NUM DESC LIMIT 1
