
SELECT min(log_id) as start_id, 
       max(log_id) as end_id
FROM (SELECT log_id, 
             RANK() OVER(ORDER BY log_id) as num
      FROM Logs) a
GROUP BY log_id - num 