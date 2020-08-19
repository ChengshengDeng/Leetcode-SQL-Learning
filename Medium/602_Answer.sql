SELECT a.id as id, 
SUM(a.num) as num 
FROM
(SELECT requester_id as id, COUNT(accepter_id) as num FROM request_accepted 
GROUP BY requester_id 
UNION ALL 
SELECT accepter_id as id, COUNT(requester_id) AS num FROM request_accepted 
GROUP BY accepter_id ) a 
GROUP BY a.id
ORDER BY SUM(a.num) DESC 
LIMIT 1; 