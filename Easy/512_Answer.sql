WITH temp AS(
    SELECT player_id,device_id,event_date,RANK()OVER(PARTITION BY player_id ORDER BY event_date ASC) rnk 
    FROM Activity) 
    SELECT player_id, device_id
    FROM temp 
    WHERE rnk = 1