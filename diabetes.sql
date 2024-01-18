Write a solution to find the patient_id, patient_name, and conditions of the 
patients who have Type I Diabetes. 
Type I Diabetes always starts with DIAB1 prefix.

Return the result table in any order.

The result format is in the following example.


Example 1:

Input: 
Patients table:
+------------+--------------+--------------+
| patient_id | patient_name | conditions   |
+------------+--------------+--------------+
| 1          | Daniel       | YFEV COUGH   |
| 2          | Alice        |              |
| 3          | Bob          | DIAB100 MYOP |
| 4          | George       | ACNE DIAB100 |
| 5          | Alain        | DIAB201      |
+------------+--------------+--------------+
Output: 
+------------+--------------+--------------+
| patient_id | patient_name | conditions   |
+------------+--------------+--------------+
| 3          | Bob          | DIAB100 MYOP |
| 4          | George       | ACNE DIAB100 | 
+------------+--------------+--------------+
Explanation: Bob and George both have a condition that starts with DIAB1.


SELECT
    PATIENT_ID,
    PATIENT_NAME,
    CONDITIONS
FROM
    PATIENTS
WHERE
    CONDITIONS LIKE 'DIAB1%'
    OR 
    CONDITIONS LIKE '% DIAB1%'