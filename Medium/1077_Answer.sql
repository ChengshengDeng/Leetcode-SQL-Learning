SELECT a.project_id, 
a.employee_id
FROM
(
SELECT p.project_id, 
e.employee_id, 
RANK() OVER (PARTITION BY p.project_id ORDER BY e.experience_years DESC) rtk 
FROM Project p 
JOIN Employee e
ON p.employee_id = e.employee_id 
) a 
WHERE a.rtk = 1 ;  