SELECT
ad_id,
IFNULL(ROUND((SUM(CASE WHEN action = 'Clicked' then 1 END)/SUM(CASE WHEN action !='Ignored' THEN 1 END)*100),2),0)AS ctr
FROM Ads
GROUP BY 1
ORDER BY 2 DESC, 1 ASC ; 