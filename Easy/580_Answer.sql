SELECT d.dept_name AS dept_name, 
IFNULL(COUNT(s.student_id),0) AS student_number
FROM student s 
RIGHT JOIN department d
ON s.dept_id = d.dept_id 
GROUP BY d.dept_id
ORDER BY student_number DESC,1 ASC;  