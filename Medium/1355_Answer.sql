SELECT a.activity
FROM(
SELECT t.activity 
FROM (SELECT activity, COUNT(name) AS num, 
      RANK() OVER(ORDER BY COUNT(name) DESC ) rnk 
     FROM Friends 
     GROUP BY activity )t 
WHERE t.rnk!=1 ) a 
JOIN (SELECT b.activity 
FROM (SELECT activity, COUNT(name) AS num, 
      RANK() OVER(ORDER BY COUNT(name) ASC ) rnk 
     FROM Friends 
     GROUP BY activity )b WHERE b.rnk!=1 )c 
     ON a.activity = c.activity  ; 
     