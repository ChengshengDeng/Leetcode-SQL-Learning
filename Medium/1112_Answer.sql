SELECT c.student_id, min(c.course_id) AS course_id, 
c.grade
FROM (SELECT student_id,course_id,grade, DENSE_RANK() OVER(PARTITION BY student_id ORDER BY grade DESC) rnk FROM Enrollments) c 
WHERE c.rnk = 1
GROUP BY c.student_id 
; 
