With tmp AS (
select spend_date, 
       CASE WHEN COUNT(user_id) > 1 THEN 'both' ELSE platform END as platform,
       sum(amount) as total_amount,
       COUNT(DISTINCT user_id) AS total_users
FROM Spending
GROUP BY spend_date, user_id
),
tmp1 AS (
SELECT DISTINCT spend_date, 'desktop' AS platform
FROM Spending
UNION
SELECT DISTINCT spend_date, 'mobile' AS platform
FROM Spending
UNION
SELECT DISTINCT spend_date, 'both' AS platform
FROM Spending
)


SELECT  a.spend_date,
        a.platform,
        COALESCE(SUM(b.total_amount), 0) AS total_amount,
        
        COALESCE(SUM(b.total_users), 0) AS total_users 
FROM tmp1 a
LEFT JOIN tmp b
ON a.spend_date = b.spend_date and a.platform = b.platform
GROUP BY a.spend_date,
        a.platform  