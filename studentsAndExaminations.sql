Write a solution to find the number of times each student attended each exam.

Return the result table ordered by student_id and subject_name.

The result format is in the following example.

 

Example 1:

Input: 
Students table:
+------------+--------------+
| student_id | student_name |
+------------+--------------+
| 1          | Alice        |
| 2          | Bob          |
| 13         | John         |
| 6          | Alex         |
+------------+--------------+
Subjects table:
+--------------+
| subject_name |
+--------------+
| Math         |
| Physics      |
| Programming  |
+--------------+
Examinations table:
+------------+--------------+
| student_id | subject_name |
+------------+--------------+
| 1          | Math         |
| 1          | Physics      |
| 1          | Programming  |
| 2          | Programming  |
| 1          | Physics      |
| 1          | Math         |
| 13         | Math         |
| 13         | Programming  |
| 13         | Physics      |
| 2          | Math         |
| 1          | Math         |
+------------+--------------+
Output: 
+------------+--------------+--------------+----------------+
| student_id | student_name | subject_name | attended_exams |
+------------+--------------+--------------+----------------+
| 1          | Alice        | Math         | 3              |
| 1          | Alice        | Physics      | 2              |
| 1          | Alice        | Programming  | 1              |
| 2          | Bob          | Math         | 1              |
| 2          | Bob          | Physics      | 0              |
| 2          | Bob          | Programming  | 1              |
| 6          | Alex         | Math         | 0              |
| 6          | Alex         | Physics      | 0              |
| 6          | Alex         | Programming  | 0              |
| 13         | John         | Math         | 1              |
| 13         | John         | Physics      | 1              |
| 13         | John         | Programming  | 1              |
+------------+--------------+--------------+----------------+

SELECT
    S.STUDENT_ID,
    S.STUDENT_NAME,
    SUB.SUBJECT_NAME,
    COALESCE(E.ATTENDED_EXAMS, 0) AS ATTENDED_EXAMS
FROM
    STUDENTS S
    CROSS JOIN SUBJECTS SUB
    LEFT JOIN (
        SELECT
            STUDENT_ID,
            SUBJECT_NAME,
            COUNT(*)     AS ATTENDED_EXAMS
        FROM
            EXAMINATIONS
        GROUP BY
            STUDENT_ID,
            SUBJECT_NAME
    ) E
    USING (STUDENT_ID,
    SUBJECT_NAME)
ORDER BY
    S.STUDENT_ID,
    SUB.SUBJECT_NAME;

SELECT
    S.STUDENT_ID,
    S.STUDENT_NAME,
    SUB.SUBJECT_NAME,
    COALESCE(E.ATTENDED_EXAMS, 0) AS ATTENDED_EXAMS
FROM
    STUDENTS S
    CROSS JOIN SUBJECTS SUB
    LEFT JOIN (
        SELECT
            STUDENT_ID,
            SUBJECT_NAME,
            COUNT(*)     AS ATTENDED_EXAMS
        FROM
            EXAMINATIONS
        GROUP BY
            STUDENT_ID,
            SUBJECT_NAME
    ) E
    ON S.STUDENT_ID = E.STUDENT_ID
    AND SUB.SUBJECT_NAME = E.SUBJECT_NAME
ORDER BY
    S.STUDENT_ID,
    SUB.SUBJECT_NAME;