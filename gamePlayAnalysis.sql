Write a solution to report the fraction of players that logged in 
again on the day after the day they first logged in, 
rounded to 2 decimal places. 
In other words, you need to count the number of players that logged in 
for at least two consecutive days starting from their first login date, 
then divide that number by the total number of players.

The result format is in the following example.

Example 1:

Input: 
Activity table:
+-----------+-----------+------------+--------------+
| player_id | device_id | event_date | games_played |
+-----------+-----------+------------+--------------+
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-03-02 | 6            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |
+-----------+-----------+------------+--------------+
Output: 
+-----------+
| fraction  |
+-----------+
| 0.33      |
+-----------+
Explanation: 
Only the player with id 1 logged back in after the first day he had logged in 
so the answer is 1/3 = 0.33


SELECT
  ROUND(COUNT(DISTINCT PLAYER_ID) / (
    SELECT
      COUNT(DISTINCT PLAYER_ID)
    FROM
      ACTIVITY
  ),
  2) AS FRACTION
FROM
  ACTIVITY
WHERE
  (PLAYER_ID, DATE_SUB(EVENT_DATE, INTERVAL 1 DAY)) IN (
    SELECT
      PLAYER_ID,
      MIN(EVENT_DATE) AS FIRST_LOGIN
    FROM
      ACTIVITY
    GROUP BY
      PLAYER_ID
  )