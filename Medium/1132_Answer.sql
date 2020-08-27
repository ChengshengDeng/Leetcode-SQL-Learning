SELECT ROUND(AVG(b.average_daily_percent),2) AS average_daily_percent
FROM(
SELECT ROUND(COUNT(r.post_id) / COUNT(a.post_id) *100,2)  AS average_daily_percent
FROM(
SELECT post_id, action_date,COUNT(extra) num
FROM Actions 
WHERE extra = 'spam' 
GROUP BY action_date,post_id ) a 
LEFT JOIN Removals r
ON a.post_id = r.post_id 
GROUP BY action_date 
) b