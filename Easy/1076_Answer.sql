/* 

这题和编号1082类似，虽然给了两个表，但是Employee 表没什么卵用。 
遇到这种选排序的题，都可以用RANK function 解决。 
思路与编号1082类似。 

*/  


SELECT project_id 
FROM 
(SELECT project_id, 
RANK() OVER(ORDER BY COUNT(*) DESC) rnk FROM Project GROUP BY project_id) s  
WHERE s.rnk = 1 ;  
