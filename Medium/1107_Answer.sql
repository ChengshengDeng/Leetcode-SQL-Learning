SELECT c.first_login AS login_date, 
COUNT(num)AS user_count
FROM(
SELECT user_id, COUNT(activity) AS num ,min(activity_date) AS first_login 
FROM Traffic 
WHERE activity = 'login' 
GROUP BY user_id ) c 
WHERE DATEDIFF('2019-06-30', c.first_login) <=90 
GROUP BY c.first_login 