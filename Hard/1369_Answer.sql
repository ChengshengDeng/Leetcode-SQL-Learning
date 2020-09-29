WITH temp AS (
              SELECT *, 
                     RANK()OVER(PARTITION BY username ORDER BY startDate DESC ) AS rnk_DESC, 
                     RANK()OVER(PARTITION BY username ORDER BY startDate ASC) AS rnk_ASC 
              FROM UserActivity) 
              
    SELECT username, activity, startDate, endDate
    FROM temp 
    WHERE rnk_DESC = 2 OR (rnk_ASC  = 1 and rnk_DESC = 1)