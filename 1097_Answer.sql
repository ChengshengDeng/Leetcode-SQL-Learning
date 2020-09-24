SELECT a.first_login_date as install_dt
,COUNT(a.player_id) as installs
,ROUND(SUM(CASE WHEN DATEDIFF(a2.event_date,a.first_login_date) = 1 THEN 1 ELSE 0 end)/COUNT(a.player_id),2) as Day1_Retention
from (
(SELECT MIN(event_date) as first_login_date,player_id
from Activity 
group by player_id)as a
LEFT JOIN Activity a2
ON a2.player_id=a.player_id
and a2.event_date=first_login_date+1
) 
group by 
a.first_login_date 

