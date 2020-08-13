CORRECT ANSWER

select round(count(a2.player_id)/count(a1.player_id),2) as fraction from 
(select player_id, min(event_date) as first_login 
from activity group by player_id) a1 
left join activity a2 on a1.player_id=a2.player_id
and datediff(a2.event_date, a1.first_login)=1 ;  

MY ANSWER 
SELECT 
ROUND(
(SELECT
COUNT(*)ELECT
FROM Activity a 
JOIN Activity b 
ON a.player_id = b.player_id 
AND DATEDIFF(a.event_date,b.event_date) = 1) / COUNT(DISTINCT player_id),2) AS fraction 
FROM Activity 

MY ANSWER IS CORRECT WHEN TEST BUT FAIL WHEN SUBMISSION. 
