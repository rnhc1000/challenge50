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

SELECT DISTINCT requester_id 
AS id, 
COUNT(*) AS num
FROM

(
SELECT requester_id, accepter_id   
FROM RequestAccepted

UNION
    
SELECT accepter_id, requester_id 
FROM RequestAccepted
)
 
AS requests

GROUP BY requester_id
ORDER BY num DESC
LIMIT 1

select requester_id as id,
       (select count(*) from RequestAccepted
            where id=requester_id or id=accepter_id) as num
from RequestAccepted
group by requester_id
order by num desc limit 1
