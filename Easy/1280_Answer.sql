SELECT S1.student_id, S1.student_name, S2.subject_name, IFNULL(Main.counts, 0) AS 'attended_exams'
FROM Students S1
CROSS JOIN Subjects S2
LEFT JOIN 
(SELECT student_id, subject_name, COUNT(*) AS 'counts'
FROM Examinations
GROUP BY student_id, subject_name) Main
ON S1.student_id = Main.student_id
AND S2.subject_name = Main.subject_name
ORDER BY S1.student_id, S2.subject_name;