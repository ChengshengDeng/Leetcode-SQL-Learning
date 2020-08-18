SELECT DISTINCT c.title AS title 
FROM Content c 
JOIN TVProgram t 
ON c.content_id = t.content_id 
WHERE DATE_FORMAT(t.program_date,'%m') = 06 AND c.Kids_content = 'Y'AND c.content_type = 'Movies';