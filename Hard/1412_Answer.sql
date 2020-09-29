WITH temp AS( 
              SELECT s.student_name, 
                     e.exam_id, 
                     e.student_id, 
                     e.score, 
                     RANK()OVER(PARTITION BY exam_id ORDER BY score DESC) rnk,
                     RANK()OVER(PARTITION BY exam_id ORDER BY score ASC) rnk1
               FROM Student s 
               JOIN Exam e 
                ON s.student_id = e.student_id 
                ) 
                
                

 
SELECT DISTINCT student_id, student_name
FROM temp 
WHERE (student_id,student_name) 
         NOT IN(SELECT student_id, student_name FROM temp WHERE rnk = 1 OR rnk1 = 1) 
ORDER BY student_id